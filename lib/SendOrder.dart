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
SendInquiry(BuildContext context, Function() function,
    {String title = 'هشدار',
    String description = 'درخواست استعلام به دستگاه ارسال شود؟',
    String code = '',
    String controller = '',
    String type = '',
    String phone = '',
    bool bool_phone = false}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          /*    title: Text(title),
          content: Text(description), */
          actions: <Widget>[
            Container(
              //width: Get.width * 0.7,
              height: Get.height * 0.4,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(0, 255, 255, 255),
                  image: DecorationImage(
                      image: AssetImage('assets/image/dialog.png'),
                      fit: BoxFit.fitHeight)),
              child: Column(
                children: [
                  Flexible(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                            // color: Color.fromARGB(0, 244, 67, 54),
                            ),
                      )),
                  Flexible(
                      flex: 1,
                      child: Container(
                        //  color: const Color.fromARGB(86, 33, 149, 243),
                        child: SizedBox(
                          width: Get.width * 0.4,
                          child: Center(
                              child: Text(
                            description,
                            style: TextStyle(fontSize: 12),
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.center,
                          )),
                        ),
                      )),
                  Flexible(
                      flex: 2,
                      child: InkWell(
                        onTap: () async {
                          Navigator.of(context).pop();
                          Get.find<Controllerother>().TypeInquiry.value = type;
                          SendSms(context, code,
                              bool_phone: bool_phone, phone: phone);
                          if (code == '6660') {
                            Get.find<Controllerother>().playcounter();
                            Get.find<Controllersttadddevice>()
                                .PlayMusic('imei');
                          }
                          InquirySms(
                            function,
                            controller: controller,
                          );
                          print('code : $code');
                        },
                        child: Container(
                            // color: const Color.fromARGB(63, 255, 153, 0),
                            ),
                      )),
                ],
              ),
            )
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
      });
}

///
Future<void> SendSms(BuildContext context, String code,
    {String phone = '', bool bool_phone = false}) async {
  if (Get.find<Controllerinfo>().Simcard.value != -2) {
    final Telephony telephony = Telephony.instance;
    final simCards = await telephony.getSimSlots();
    int i = 0;
    int j = 0;
    for (var sim in simCards) {
      if (i == int.parse(Get.find<Controllerinfo>().Simcard.value)) {
        j = sim.index;
      }
    }
    if (!bool_phone) {
      telephony.sendSms(
          to: '${Get.find<Controllerinfo>().Phone.value}',
          message:
              '*${Get.find<Controllerpassword>().PasswordDev.value}*${code}#',
          subscriptionId:
              Get.find<Controllerinfo>().Simcard.value == '-1' ? null : j);
    } else {
      telephony.sendSms(
          to: phone,
          message: '*0000*${code}#',
          subscriptionId:
              Get.find<Controllerinfo>().Simcard.value == '-1' ? null : j);
    }
  } else {
    String uri =
        'sms:${Get.find<Controllerinfo>().Phone.value}?body=*${Get.find<Controllerpassword>().PasswordDev.value}*${code}';
    final Uri smsuri = Uri(
        scheme: 'sms',
        path: Get.find<Controllerinfo>().Phone.value,
        queryParameters: {
          'body':
              '*${Get.find<Controllerpassword>().PasswordDev.value}*${code}#'
        });
    if (await canLaunch(smsuri.toString())) {
      await launch(smsuri.toString());
      var context = Get.context;
    }
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
  if (Get.find<Controllerinfo>().Simcard.value != -2) {
    final Telephony telephony = Telephony.instance;
    telephony.sendSms(
        to: '${Get.find<Controllerinfo>().Phone}',
        message:
            '*${Get.find<Controllerpassword>().tf1.text}*40*${Get.find<Controllerpassword>().tf3.text}#',
        subscriptionId: Get.find<Controllerinfo>().Simcard.value == '-1'
            ? null
            : int.parse(Get.find<Controllerinfo>().Simcard.value));
  } else {
    String uri =
        'sms:${Get.find<Controllerinfo>().Phone.value}?body=*${Get.find<Controllerpassword>().PasswordDev.value}*${code}';
    final Uri smsuri = Uri(
        scheme: 'sms',
        path: Get.find<Controllerinfo>().Phone.value,
        queryParameters: {
          'body':
              '*${Get.find<Controllerpassword>().tf1.text}*40*${Get.find<Controllerpassword>().tf3.text}#'
        });
    if (await canLaunch(smsuri.toString())) {
      await launch(smsuri.toString());
      var context = Get.context;
    }
  }
  Get.find<Controllerpassword>().tf1.text = '';
  Get.find<Controllerpassword>().tf2.text = '';
  Get.find<Controllerpassword>().tf3.text = '';
}

showSnackBar(BuildContext context, {String title = '',double width=0.3}) {
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
