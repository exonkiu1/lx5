import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lx/Getx/ControllerContact.dart';
import 'package:lx/Getx/ControllerOther.dart';
import 'package:lx/Getx/ControllerRemote.dart';
import 'package:lx/Getx/ControllerZon.dart';
import 'package:lx/Page/HomePage/HomePage.dart';
import 'package:lx/SendOrder.dart';

class Controllersyncing extends GetxController {
  RxInt index = 0.obs;
  RxBool bool_StartSyncing = false.obs;
  Syncing() {
    if (index.value < 4 && bool_StartSyncing.value) {
      DirectInquiry(
          Execution_order_list.values.elementAt(index.value)['function'],
          code: Execution_order_list.values.elementAt(index.value)['code'],
          controller:
              Execution_order_list.values.elementAt(index.value)['controller']);
      index.value += 1;
    } else {
      bool_StartSyncing.value = false;
      Get.off(Homepage());
    }
  }

  StartSyncing() {
    AudioPlayer player = AudioPlayer();
    player.setAsset('assets/music/syncing/syncing.mp3');
    player.play();
    index.value = 0;
    bool_StartSyncing.value = true;
    Syncing();
  }
}

Map<String, Map<String, dynamic>> Execution_order_list = {
  'استعلام مخاطبین': {
    'code': '91',
    'function': Get.find<Controllercontact>().InquiryContact,
    'controller': '*'
  },
  'استعلام پارتیشن مخاطب': {
    'code': 'LUXSWE',
    'function': Get.find<Controllercontact>().InquiryPart,
    'controller': ';'
  },
  'استعلام پارتیشن زون': {
    'code': 'LUXSSE',
    'function': Get.find<Controllerzon>().InquiryPart,
    'controller': ''
  },
  'استعلام پارتیشن ریموت': {
    'code': 'LUXSTE',
    'function': Get.find<Controllerremote>().Inquiry,
    'controller': ''
  },
};
