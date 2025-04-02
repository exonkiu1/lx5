import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerDatabase.dart';
import 'package:lx/SendOrder.dart';
import 'package:lx/WidgetUi/Appbar.dart';
import 'package:lx/WidgetUi/BackGroundView.dart';
import 'package:lx/WidgetUi/decoration.dart';
import 'package:lx/WidgetUi/decoration_textfield.dart';

class Adddevice extends StatelessWidget {
  const Adddevice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'افزودن دستگاه'),
      body: Backgroundview(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Get.width * 0.8,
              padding: EdgeInsets.all(4),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: decoration(),
              child: TextField(
                controller: Get.find<Controllerdatabase>().tfName,
                decoration: inputDecoration(hint: 'نام دستگاه'),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: Get.width * 0.8,
              padding: EdgeInsets.all(4),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: decoration(),
              child: TextField(
                controller: Get.find<Controllerdatabase>().tfPhone,
                keyboardType: TextInputType.phone,
                decoration: inputDecoration(hint: 'شماره تلفن دستگاه'),
                textAlign: TextAlign.center,
              ),
            ),
            InkWell(
              onTap: () => DialogOrder(
                  context, () => Get.find<Controllerdatabase>().AddLx(),
                  description: 'از ساخت دستگاه مطمعن هستید؟'),
              child: Container(
                width: Get.width * 0.3,
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(8),
                decoration: decoration(),
                child: Center(child: Text('ثبت دستگاه')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
