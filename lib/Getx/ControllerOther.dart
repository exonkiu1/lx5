import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
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
}
