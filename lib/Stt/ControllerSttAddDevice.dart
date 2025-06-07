import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lx/Getx/ControllerDatabase.dart';
import 'package:lx/Getx/ControllerOther.dart';

class Controllersttadddevice extends GetxController {
  RxBool Playing = false.obs;
  ProcessText(BuildContext context) {}
  Agent() {
    if (!CheckEmptyTf(Get.find<Controllerdatabase>().tfName, 'name_dev')) {
      if (!CheckEmptyTf(
        Get.find<Controllerdatabase>().tfPhone,
        'phone_dev',
        lenght: 11,
      )) {
        if (CheckMicro()) {
          PlayMusic('confirm');
        }
      }
    }
  }

  PlayMusic(String name) async {
    if (!Playing.value) {
      AudioPlayer player = AudioPlayer();
      await player.setAsset('assets/music/adddevice/$name.mp3');
      Playing.value = true;
      await player.play();
      Playing.value = false;
    }
  }

  bool CheckEmptyTf(TextEditingController tf, String name, {int lenght = 2}) {
    if (tf.text.length < lenght) {
      PlayMusic(name);
      return true;
    } else {
      return false;
    }
  }

  bool CheckMicro() {
    if (Get.find<Controllerother>().Model.value == '') {
      PlayMusic('micro');
      return false;
    } else {
      return true;
    }
  }
}
