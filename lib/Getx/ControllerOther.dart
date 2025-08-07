import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:lx/WidgetUi/decoration.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:url_launcher/url_launcher.dart';

class Controllerother extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  TextEditingController tf = TextEditingController();
  RxString TypeInquiry = ''.obs, TextInuiry = ''.obs;
  RxInt DelyOrder = 0.obs;
  RxBool onceSnackbar = false.obs;
  RxString Model = ''.obs;
  RxString ModelPro = ''.obs;
  RxInt counter = 30.obs;
  StartDelyOrder() async {
    DelyOrder.value = 10;
    for (var i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      DelyOrder.value -= 1;
    }
    onceSnackbar.value = false;
  }

  SnackBarDelay(BuildContext context) {
    if (!onceSnackbar.value) {
      onceSnackbar.value = true;

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: DelyOrder.value),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.timelapse_outlined,
              color: Colors.red,
            ),
            Obx(() {
              return Text(
                'لطفا تا زدن دستور  ${DelyOrder.value}  ثانیه صبر کنید'
                    .toPersianDigit(),
                textDirection: TextDirection.rtl,
              );
            }),
          ],
        ),
      ));
    }
  }

  
  playcounter() async {
    counter.value = 30;
    while (counter.value != 0) {
      await Future.delayed(Duration(seconds: 1), () => counter.value -= 1);
    }
    if (TypeInquiry.value == 'imei') {
      TypeInquiry.value = '';
      Get.bottomSheet(Container(
        width: Get.width,
        padding: EdgeInsets.all(8),
        decoration: decoration(color: true),
        child: Wrap(
          children: [
            Text(
              TextHelpWarrenty,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
            ),
            InkWell(
              onTap: () async {
                final Uri _url = Uri.parse('https://luxsecurity.ir/');
                await launchUrl(_url);
              },
              child: Text(
                'www.Luxsecurity.ir',
                style: TextStyle(color: Colors.blueAccent),
              ),
            )
          ],
        ),
      ));
    }
  }
}

String TextHelpWarrenty = """"
اخطار 1 :
شارژ خطوط بررسی شود 

اخطار 2 :
اولین کاربر ( مدیر ) قبل شروع کار با نرم افزار حتما باید دستگاه را ریست کند و به خط دستگاه تماس بگیرید 

اخطار 3:
یکی از سیم کارت ها (دستگاه یا سیم کارت مخاطب )بدلیل ضعیف بودن شبکه دیر پیام می‌دهد یا گاهی پیام نمیدهد باید اپراتور رو تغییر دهید 
نکته(همراه اول همیشه پیشنهاد میشود چون معمولا کمتر این اتفاق میوفتد )

آموزش کامل نصب در سایت 


"""
    "";
