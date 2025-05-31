import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Page/PasswordApp/ControllerPassApp.dart';
import 'package:lx/WidgetUi/Appbar.dart';
import 'package:lx/WidgetUi/BackGroundView.dart';
import 'package:lx/WidgetUi/decoration.dart';
import 'package:lx/WidgetUi/decoration_textfield.dart';

class Passwordapp extends StatelessWidget {
  const Passwordapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'امنیت ورود به دستگاه'),
      body: Backgroundview(
        child: Column(
          children: [
            SizedBox(height: 20),
            Obx(() {
              return Visibility(
                visible:
                    Get.find<Controllerpassapp>().password.value.length == 4,
                child: Container(
                  width: Get.width * 0.9,
                  decoration: decoration(),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('ورود با امنیت'),
                      Checkbox(
                        value: Get.find<Controllerpassapp>().lock.value,
                        onChanged: (value) => Get.find<Controllerpassapp>()
                            .ChangeStateLock(value!),
                      ),
                    ],
                  ),
                ),
              );
            }),
            SizedBox(height: 20),
            Container(
              width: Get.width * 0.9,
              decoration: decoration(),
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: Get.width * 0.66,
                          child: TextField(
                            controller: tf_pass_new,
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              if (value.length > 4) {
                                tf_pass_new.text = value.substring(0, 4);
                              }
                            },
                            keyboardType: TextInputType.phone,
                            decoration: inputDecoration(
                                hint: 'پسورد جدید را وارد نمایید',
                                isDense: true,
                                border: true),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.66,
                          child: TextField(
                            controller: tf_pass_new_repeat,
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              if (value.length > 4) {
                                tf_pass_new_repeat.text = value.substring(0, 4);
                              }
                            },
                            keyboardType: TextInputType.phone,
                            decoration: inputDecoration(
                                hint: 'پسورد جدید را تکرار نمایید',
                                isDense: true,
                                border: true),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () => Get.find<Controllerpassapp>().ChangePassword(),
                    child: Container(
                      width: Get.width * 0.3,
                      decoration: decoration(color: true),
                      child: Center(
                          child: Text(
                        'ثبت',
                        style: TextStyle(color: color2),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
