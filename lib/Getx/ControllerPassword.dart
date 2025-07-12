
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '/DateBase/Model.dart';
import '/Getx/ControllerDatabase.dart';
import '/Getx/ControllerInfo.dart';
import '/SendOrder.dart';

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
