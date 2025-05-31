import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/SendOrder.dart';
import 'package:lx/WidgetUi/Appbar.dart';
import 'package:lx/WidgetUi/BackGroundView.dart';
import 'package:lx/WidgetUi/decoration.dart';
import 'package:lx/WidgetUi/decoration_textfield.dart';

import '../../Getx/ControllerPassword.dart';

class Passworddevice extends StatelessWidget {
  const Passworddevice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'پسورد دستگاه'),
      body: Backgroundview(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: Get.width * 0.9,
              decoration: decoration(),
              child: TextField(
                maxLength: 4,
                controller: Get.find<Controllerpassword>().tf1,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: inputDecoration(
                  hint: 'پسورد فعلی دستگاه را وارد کنید',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: Get.width * 0.9,
              decoration: decoration(),
              child: TextField(
                maxLength: 4,
                controller: Get.find<Controllerpassword>().tf2,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: inputDecoration(
                  hint: 'پسورد جدید دستگاه را وارد کنید',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: Get.width * 0.9,
              decoration: decoration(),
              child: TextField(
                maxLength: 4,

                keyboardType: TextInputType.number,
                controller: Get.find<Controllerpassword>().tf3,
                textAlign: TextAlign.center,
                decoration: inputDecoration(
                  isDense: true,
                  hint: 'پسورد جدید دستگاه را دوباره وارد کنید',
                ),
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                bool val = Get.find<Controllerpassword>().controllpass();
                if (val) {
                  SendOrder(
                    context,
                    () => Get.find<Controllerpassword>().ChangePass(),
                    pass: true,
                  );

                  ;
                } else {
                  Get.snackbar('خطا', 'تکرار پسورد اشتباه میباشد');
                  Get.find<Controllerpassword>().tf1.text = '';
                  Get.find<Controllerpassword>().tf2.text = '';
                  Get.find<Controllerpassword>().tf3.text = '';
                }
              },
              child: Container(
                width: Get.width * 0.25,
                decoration: decoration(color: true),
                child: Center(child: Text('اعمال')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
