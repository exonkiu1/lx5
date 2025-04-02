import 'package:telephony/telephony.dart';
import 'package:telephony/telephony.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lx/DateBase/Model.dart';
import 'package:lx/Getx/ControllerDatabase.dart';
import 'package:lx/Getx/ControllerInfo.dart';
import 'package:lx/SendOrder.dart';

class Controllerpassword extends GetxController {
  RxString PasswordDev = ''.obs;
  TextEditingController tf1 = TextEditingController(),
      tf2 = TextEditingController(),
      tf3 = TextEditingController();
  GetPass(DevLX model) {
    PasswordDev.value = model.Pass;
  }

  bool controllpass() {
    bool val = true;
    if (tf2.text != tf3.text) {
      val = false;
    }
    return val;
  }

  Future<String> ChangePass() async {
    PasswordDev.value = tf2.text;
    Get.find<Controllerdatabase>().UpdateLx();
    return '';
  }
}
