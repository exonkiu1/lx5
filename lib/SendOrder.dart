import 'package:telephony/telephony.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerHomePage.dart';
import 'package:lx/Getx/ControllerInfo.dart';
import 'package:lx/Getx/ControllerOther.dart';
import 'package:lx/Getx/ControllerPassword.dart';
import 'package:lx/WidgetUi/decoration.dart';
import 'package:url_launcher/url_launcher.dart';

void SendOrder(
  BuildContext context,
  Future<String> Function() function, {
  String title = 'هشدار',
  String description = 'دستور به دستگاه ارسال شود؟',
  bool pass = false,
  bool StateDev = false,
}) {
  Get.find<Controllerother>().DelyOrder.value == 0
      ? showDialog(
        context: context,
      //  barrierDismissible: false,
       
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: color2,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: color1,
                  ),
                ),
                Image.asset('assets/image/options3/sms.gif', height: 25),
              ],
            ),
            content: Text(description),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      if (StateDev) {
                        Get.find<Controllerhomepage>().backflyflySpaceship();
                      }
                    },
                    child: Text('خیر'),
                  ),

                  ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).pop();
                      String code = await function();
                      if (!pass) {
                        SendSms(context, code);
                      } else {
                        SendSmsPass(context, code);
                      }
                      if (StateDev) {
                        Get.find<Controllerhomepage>().backflyflySpaceship();
                      }
                      print('code : $code');
                    },
                    child: Text('بله'),
                  ),
                ],
              ),
            ],
          );
        },
      )
      : Get.find<Controllerother>().SnackBarDelay(context);
  ;
}

///////////
DialogTextFieldSms(
  BuildContext context,
  Future<String> Function() function, {
  String title = 'توجه',
  String description = '',
  int maxlenght = 50,
  bool KeyboardInt = false,
  bool sms = false,
}) {
  Get.find<Controllerother>().tf.text = '';
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(description + ' ' + 'وارد کنید'),
            TextField(
              autofocus: true,
              controller: Get.find<Controllerother>().tf,
              maxLength: maxlenght,
              keyboardType: KeyboardInt ? TextInputType.number : null,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
            },
            child: Text('لغو'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              String code = await function();
              if (sms) {
                SendSms(context, code);
              }

              print('code : $code');
            },
            child: Text('تایید'),
          ),
        ],
      );
    },
  );
}

////
SendInquiry(
  BuildContext context,
  Function() function, {
  String title = 'هشدار',
  String description = 'درخواست استعلام به دستگاه ارسال شود؟',
  String code = '',
  String controller = '',
  String type = '',
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: color2,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color1,
              ),
            ),
            Image.asset('assets/image/options3/sms.gif', height: 25),
          ],
        ),
        content: Text(description),
        actions: <Widget>[
           Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                                           Navigator.of(context).pop();

                    },
                    child: Text('خیر'),
                  ),

                  ElevatedButton(
                    onPressed: () async {
                        Navigator.of(context).pop();
                      Get.find<Controllerother>().TypeInquiry.value = type;
                      SendSms(context, code);
                      InquirySms(function, controller: controller);
                      print('code : $code');
                    },
                    child: Text('بله'),
                  ),
                ],
              ),






        
          /*   TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
              },
              child: Text('لغو'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                Get.find<Controllerother>().TypeInquiry.value = type;
                SendSms(context, code);
                InquirySms(
                  function,
                  controller: controller,
                );
                print('code : $code');
              },
              child: Text('تایید'),
            ), */
        ],
      );
    },
  );
}

///
Future<void> SendSms(BuildContext context, String code) async {
  if (Get.find<Controllerinfo>().Simcard.value != -2) {
     final Telephony telephony = Telephony.instance;
    telephony.sendSms(
        to: '${Get.find<Controllerinfo>().Phone.value}',
        message:
            '*${Get.find<Controllerpassword>().PasswordDev.value}*${code}#',
        subscriptionId: Get.find<Controllerinfo>().Simcard.value);
 
  } else {
    String uri =
        'sms:${Get.find<Controllerinfo>().Phone.value}?body=*${Get.find<Controllerpassword>().PasswordDev.value}*${code}';
    final Uri smsuri = Uri(
      scheme: 'sms',
      path: Get.find<Controllerinfo>().Phone.value,
      queryParameters: {
        'body': '*${Get.find<Controllerpassword>().PasswordDev.value}*${code}#',
      },
    );
    if (await canLaunch(smsuri.toString())) {
      await launch(smsuri.toString());
      var context = Get.context;
    }
  }

  Get.find<Controllerother>().StartDelyOrder();
}

void InquirySms(Function() function, {String controller = ''}) {
   final telephony = Telephony.instance;
  telephony.listenIncomingSms(
    onNewMessage: (SmsMessage message) {
      if (message.body!.contains(controller) == true) {
        Get.find<Controllerother>().TypeInquiry.value = '';
        Get.snackbar('توجه', 'استعلام رسید');
        Get.find<Controllerother>().TextInuiry.value = message.body!;
        function();
        Get.find<Controllerother>().TextInuiry.value = message.body!;
      }
    },
    listenInBackground: false,
  );
}

void DialogOrder(
  BuildContext context,
  Function() function, {
  String title = 'هشدار',
  String description = '',
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
            },
            child: Text('لغو'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await function();
            },
            child: Text('تایید'),
          ),
        ],
      );
    },
  );
}

Future<void> SendSmsPass(BuildContext context, String code) async {
  if (Get.find<Controllerinfo>().Simcard.value != -2) {
       final Telephony telephony = Telephony.instance;
    telephony.sendSms(
        to: '${Get.find<Controllerinfo>().Phone}',
        message:
            '*${Get.find<Controllerpassword>().tf1.text}*40*${Get.find<Controllerpassword>().tf3.text}#',
        subscriptionId: Get.find<Controllerinfo>().Simcard.value);
 
  } else {
    String uri =
        'sms:${Get.find<Controllerinfo>().Phone.value}?body=*${Get.find<Controllerpassword>().PasswordDev.value}*${code}';
    final Uri smsuri = Uri(
      scheme: 'sms',
      path: Get.find<Controllerinfo>().Phone.value,
      queryParameters: {
        'body':
            '*${Get.find<Controllerpassword>().tf1.text}*40*${Get.find<Controllerpassword>().tf3.text}#',
      },
    );
    if (await canLaunch(smsuri.toString())) {
      await launch(smsuri.toString());
      var context = Get.context;
    }
  }
  Get.find<Controllerpassword>().tf1.text = '';
  Get.find<Controllerpassword>().tf2.text = '';
  Get.find<Controllerpassword>().tf3.text = '';
}
