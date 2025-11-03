import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lx/Getx/ControllerDatabase.dart';
import 'package:lx/Getx/ControllerOther.dart';
import 'package:lx/SendOrder.dart';

class Controllersttadddevice extends GetxController {
  RxBool Playing = false.obs;
  RxBool SingleUser = true.obs;
  ProcessText(BuildContext context) {}
 Future<bool> Agent() async{
    bool val = false;
    bool valCheckInternet =await CheckInternet();
    if (valCheckInternet) {
      if (!CheckEmptyTf(Get.find<Controllerdatabase>().tfName, 'name_dev')) {
      if (!CheckEmptyTf(
        Get.find<Controllerdatabase>().tfPhone,
        'phone_dev',
        lenght: 11,
      )) {
        if (CheckMicro()) {
        val = true;
        }
      }
    } 
    }
    return val;
  }

  PlayMusic(String name) async {
    if (!Playing.value) {
     /*  AudioPlayer player = AudioPlayer();
      await player.setAsset('assets/music/adddevice/$name.mp3');
      Playing.value = true;
      await player.play();
      Playing.value = false; */
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
  Future<bool> CheckInternet()async{
    bool val = false;
      var connectivityResult = await (Connectivity().checkConnectivity());

   if (connectivityResult.contains(ConnectivityResult.mobile) ||
      connectivityResult.contains(ConnectivityResult.wifi)) {
   val = true;
  }else{
    PlayMusic('internet');
    final context = Get.context;
    showSnackBar(context!,title: 'اینترنت خود را روشن نمایید',width: 0.5);
    val = false;
  }
  return val;
  }
  
  
}
