import 'package:get/get.dart';
import 'package:lx/DateBase/Model.dart';
import 'package:lx/Getx/ControllerDatabase.dart';

class Controllerpassremote extends GetxController {
  RxString PasswordRemote = ''.obs;
  RxString edit_PasswordRemote = ''.obs;
  GetPasswordRemote(DevLX model) {
    PasswordRemote.value = model.PasswordRemote;
  }

  Future<String> ChangePassWordRemote() async {
    PasswordRemote.value = edit_PasswordRemote.value;
    Get.find<Controllerdatabase>().UpdateLx();
    return 'AAAVA*${edit_PasswordRemote.value}';
  }

}

Map<String, String> MapPassRemote = {
  '3': 'قفل سایلنت یا نیمه فعال',
  '2': 'رله',
  '0': 'باز',
  '4': 'قفل'
};
Map<String,String>MapPassRemote2 = {
  'on':'4',
  'off':'0',
  'relay':'2',
  'silent':'3'
};