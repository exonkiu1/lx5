import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:lx/WidgetUi/decoration.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

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
  StartDelyOrder() async {
    DelyOrder.value = 17;
    for (var i = 0; i < 17; i++) {
      await Future.delayed(Duration(seconds: 1));
      DelyOrder.value -= 1;
    }
    onceSnackbar.value = false;
  }

  SnackBarDelay(BuildContext context) {
    if (!onceSnackbar.value) {
      onceSnackbar.value = true;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: DelyOrder.value),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: color1),
          ),
          margin: EdgeInsets.symmetric(vertical: 30,horizontal: 10),
         // width: Get.width*0.8,
         behavior: SnackBarBehavior.floating,
          backgroundColor: color2,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Icon(Icons.sms, color: color1),
              Obx(() {
                return Text(
                  'لطفا تا زدن دستور  ${DelyOrder.value}  ثانیه صبر کنید'
                      .toPersianDigit(),
                      style: TextStyle(color: color1),
                  textDirection: TextDirection.rtl,
                );
              }),
            ],
          ),
        ),
      );
    }
  }
}
