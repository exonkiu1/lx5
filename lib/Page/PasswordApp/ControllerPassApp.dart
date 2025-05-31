import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController tf_pass_new = TextEditingController(),
    tf_pass_new_repeat = TextEditingController();

class Controllerpassapp extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  RxBool lock = false.obs;
  RxString password = ''.obs;
  Future CheckLock() async {
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    lock.value = await prefs.getBool('lock') ?? false;
    password.value = await prefs.getString('password_app') ?? '';
  }

  ChangeStateLock(bool value) async {
    lock.value = value;
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    await prefs.setBool('lock', lock.value);
  }

  ChangePassword() async {
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    final context = Get.context;

    if (tf_pass_new.text == tf_pass_new_repeat.text &&
        tf_pass_new.text.length == 4) {
      password.value = tf_pass_new.text;
      prefs.setString('password_app', password.value);
      ScaffoldMessenger.of(
        context!,
      ).showSnackBar(SnackBar(content: Text('پسورد با موفقت ثبت شد')));
    } else {
      ScaffoldMessenger.of(
        context!,
      ).showSnackBar(SnackBar(content: Text('اطلاعات اشتباه!!!')));
    }
    tf_pass_new_repeat.text = '';
    tf_pass_new.text = '';
  }
}
