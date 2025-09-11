import 'package:get/get.dart';
import 'package:lx/DateBase/Model.dart';
import 'package:lx/Getx/ControllerDatabase.dart';
import 'package:lx/Getx/ControllerRemote.dart';
import 'package:lx/Getx/controllerWarenty.dart';

class Controllerpassremote extends GetxController {
  RxString PasswordRemote = ''.obs;
  RxString edit_PasswordRemote = ''.obs;
  RxInt Index = 0.obs;
  GetPasswordRemote() {
    PasswordRemote.value = GetDevSplite('PasswordRemote');
  }

  ChangeRemote(int index) {
    Index.value = index;
    PasswordRemote.value =
        Get.find<Controllerremote>().PasswordRemote[index].value;
  }

  Future<String> ChangePassWordRemote() async {
    PasswordRemote.value = edit_PasswordRemote.value;
    edit_PasswordRemote.value = '';
    if (Get.find<Controllerwarrenty>().ModelPro.value.contains('MAX')) {
      Get.find<Controllerremote>().PasswordRemote[Index.value].value =
          PasswordRemote.value;
      Get.find<Controllerremote>().UpdateRemote();
      return 'AAAVA*${Index.value >= 10 ? Index.value : '0${Index.value}'}*${PasswordRemote.value}';
    } else {
      Get.find<Controllerdatabase>().UpdateLx();
      return 'AAAVA*${PasswordRemote.value}';
    }
  }
}

Map<String, String> MapPassRemote = {
  '3': 'قفل سایلنت یا نیمه فعال',
  '2': 'رله',
  '0': 'باز',
  '4': 'قفل'
};
Map<String, String> MapPassRemote2 = {
  'on': '4',
  'off': '0',
  'relay': '2',
  'silent': '3'
};
