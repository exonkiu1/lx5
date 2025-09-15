import 'package:lx/Getx/ControllerDatabase.dart';
import 'package:lx/Stt/ControllerSttAddDevice.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telephony/telephony.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerHomePage.dart';
import 'package:lx/Getx/ControllerInfo.dart';
import 'package:lx/Getx/ControllerOther.dart';
import 'package:lx/Getx/ControllerPassword.dart';
import 'package:url_launcher/url_launcher.dart';

void SendOrder(BuildContext context, Future<String> Function() function,
    {String title = 'هشدار',
    String description = 'پیامک به دستگاه ارسال شود؟',
    bool pass = false,
    bool StateDev = false}) {
  Get.find<Controllerother>().DelyOrder.value <= 0
      ? showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Color.fromARGB(0, 255, 255, 255),
              actions: <Widget>[
                Container(
                  height: Get.height * 0.4,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/image/dialog.png'),
                          fit: BoxFit.fitHeight)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(flex: 1, child: Container()),
                      Flexible(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100)),
                            child: InkWell(
                              splashColor: Color.fromARGB(138, 244, 67, 54),
                              onTap: () {
                                Navigator.of(context).pop();
                                if (StateDev) {
                                  Get.find<Controllerhomepage>()
                                      .backflyflySpaceship();
                                }
                              },
                              child: Container(),
                            ),
                          )),
                      Flexible(
                          flex: 1,
                          child: Container(
                            child: Center(
                                child: Text(
                              description,
                              style: TextStyle(fontSize: 12),
                            )),
                          )),
                      Flexible(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100)),
                            child: InkWell(
                              splashColor: Color.fromARGB(137, 54, 244, 79),
                              onTap: () async {
                                Navigator.of(context).pop();
                                String code = await function();
                                if (!pass) {
                                  SendSms(context, code);
                                } else {
                                  SendSmsPass(context, code);
                                }
                                if (StateDev) {
                                  Get.find<Controllerhomepage>()
                                      .backflyflySpaceship();
                                }
                                print('code : $code');
                              },
                              child: Container(),
                            ),
                          )),
                      Flexible(flex: 1, child: Container()),
                    ],
                  ),
                )
              ],
            );
          })
      : Get.find<Controllerother>().SnackBarDelay(context);
  ;
}

///////////
DialogTextFieldSms(BuildContext context, Future<String> Function() function,
    {String title = 'توجه',
    String description = '',
    int maxlenght = 50,
    bool KeyboardInt = false,
    bool sms = false}) {
  Get.find<Controllerother>().tf.text = '';
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(
            title,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                description + ' ' + 'وارد کنید',
              ),
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
                Get.find<Controllerother>().TextInuiry.value =
                    Get.find<Controllerother>().tf.text;
                Get.find<Controllerother>().tf.text='';
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
      });
}

////

SendInquiry(
  BuildContext context,
  Function() function, {
  String title = 'هشدار',
  String description =
      'یکی از مراحل استعلام را انتخاب نمایید(ابتدا باید پیامک به دستگاه ارسال شود)',
  String code = '',
  String controller = '',
  String type = '',
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Text(title),
        content: Text(description),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              DialogTextFieldSms(context, () => function());
            },
            child: Text('دخیره پیامک دستگاه'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              // Get.find<Controllerother>().TypeInquiry.value = type;
              SendSms(context, code);
              // InquirySms(function, controller: controller);
              print('code : $code');
            },
            child: Text('ارسال پیامک'),
          ),
        ],
      );
    },
  );
}

///
Future<void> SendSms(BuildContext context, String code,
    {String phone = '', bool bool_phone = false}) async {
  String uri = '';
  if (Get.find<Controllerother>().Android.value) {
    uri =
        'sms:${Get.find<Controllerinfo>().Phone.value}?body=*${Get.find<Controllerpassword>().PasswordDev.value}*${code}';
  } else {
    String phoneD = Get.find<Controllerinfo>().Phone.value;
    uri =
        '${phoneD[0]}${phoneD[1]}${phoneD[2]}${phoneD[3]}-${phoneD[4]}${phoneD[5]}${phoneD[6]}-${phoneD[7]}${phoneD[8]}${phoneD[9]}';
  }
  String body = '*${Get.find<Controllerpassword>().PasswordDev.value}*${code}#';
  String uri2 = 'sms:${uri}?body=$body';
  print(uri);

  if (await canLaunch(uri2)) {
    await launch(uri2);
    var context = Get.context;
  }

  Get.find<Controllerother>().StartDelyOrder();
}

void InquirySms(
  Function() function, {
  String controller = '',
}) {
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

DirectInquiry(
  Function() function, {
  String code = '',
  String controller = '',
  String type = '',
}) async {
  final context = Get.context;
  SendSms(context!, code);
  await Future.delayed(Duration(seconds: 2));
  InquirySms(function);
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
      });
}

Future<void> SendSmsPass(BuildContext context, String code) async {
  String uri = '';
  if (Get.find<Controllerother>().Android.value) {
    uri =
        'sms:${Get.find<Controllerinfo>().Phone.value}?body=*${Get.find<Controllerpassword>().PasswordDev.value}*${code}';
  } else {
    String phoneD = Get.find<Controllerinfo>().Phone.value;
    uri =
        '${phoneD[0]}${phoneD[1]}${phoneD[2]}${phoneD[3]}-${phoneD[4]}${phoneD[5]}${phoneD[6]}-${phoneD[7]}${phoneD[8]}${phoneD[9]}';
  }
  String body =
      '*${Get.find<Controllerpassword>().tf1.text}*40*${Get.find<Controllerpassword>().tf3.text}#';
  String uri2 = 'sms:${uri}?body=$body';
  print(uri);

  if (await canLaunch(uri2)) {
    await launch(uri2);
    var context = Get.context;
  }
  /*  final Uri smsuri = Uri(
      scheme: 'sms',
      path: Get.find<Controllerinfo>().Phone.value,
      queryParameters: {
        'body':
            '*${Get.find<Controllerpassword>().tf1.text}*40*${Get.find<Controllerpassword>().tf3.text}#'
      });
  if (await canLaunch(smsuri.toString())) {
    await launch(smsuri.toString());
    var context = Get.context;
  } */

  Get.find<Controllerpassword>().tf1.text = '';
  Get.find<Controllerpassword>().tf2.text = '';
  Get.find<Controllerpassword>().tf3.text = '';
}

showSnackBar(BuildContext context, {String title = '', double width = 0.3}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: Duration(seconds: 1),
    width: Get.width * width,
    margin: EdgeInsets.all(20),
    backgroundColor: const Color.fromARGB(116, 255, 255, 255),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    content: Text(
      '${title}',
      style: TextStyle(color: const Color.fromARGB(255, 155, 9, 9)),
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    ),
  ));
}

String HelpFirstOrder =
    "دقت کنید چنانچه گزارش هر دستور برای شما ارسال نشد به معنی این میباشد در دستگاه تنظیمات اعمال نشده یا این موضوع میتواند از ضعف آنتن باشد حتما بررسی کنید و بعد از اطمینان دستور بعد را بفرستید (پیشنهاد میشوداز اپراتور همراه اول استفاده کنید )";

showhelpfirstorder() async {
  var prefs = SharedPreferencesAsync();
  String KeyValue = 'countorder${Get.find<Controllerinfo>().id.value}';
  int count = await prefs.getInt(KeyValue) ?? 0;
  await prefs.setInt(KeyValue, (count + 1));
  if (count < 2 && count != 0) {
    final context = Get.context;

    showDialog(
        context: context!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'توجه',
              style: TextStyle(color: Colors.grey),
            ),
            content: Text(
              HelpFirstOrder,
              style: TextStyle(color: Colors.blue),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
