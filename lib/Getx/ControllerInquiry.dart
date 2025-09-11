import 'package:get/get.dart';
import 'package:lx/DateBase/Model.dart';
import 'package:lx/Getx/ControllerDatabase.dart';
import 'package:lx/Getx/ControllerHomePage.dart';
import 'package:lx/Getx/ControllerInfo.dart';
import 'package:lx/Getx/ControllerOther.dart';
import 'package:lx/Getx/ControllerRelay.dart';

class Controllerinquiry extends GetxController {
  RxString UrbanElectricity = ''.obs,
      Speaker = ''.obs,
      BatterPower = ''.obs,
      CountContact = ''.obs,
      CountRemote = ''.obs,
      AntennaStrength = ''.obs,
      CommunicationsStatus = ''.obs,
      zon1 = ''.obs,
      zon2 = ''.obs,
      zon3 = ''.obs,
      zon4 = ''.obs;
  GetInquiry() {
    UrbanElectricity.value = GetDevSplite('UrbanElectricity');
    Speaker.value = GetDevSplite('Speaker');
    BatterPower.value = GetDevSplite('BatterPower');
    CountContact.value = GetDevSplite('CountContact');
    CountRemote.value = GetDevSplite('CountContact');
    AntennaStrength.value = GetDevSplite('AntennaStrength');
    CommunicationsStatus.value = GetDevSplite('CommunicationsStatus');
    zon1.value = GetDevSplite('zon1');
    zon2.value = GetDevSplite('zon2');
    zon3.value = GetDevSplite('zon2');
    zon4.value = GetDevSplite('zon4');
  }

  inquiry() {
    List<String> message =
        Get.find<Controllerother>().TextInuiry.value.split(',');
    Get.find<Controllerhomepage>().StateDev.value =
        MapStateDev[message[0]]!.keys.elementAt(0);
    UrbanElectricity.value = message[1] == '1' ? 'روشن' : 'خاموش';
    zon1.value = message[2][0] == '0' ? 'بسته' : 'باز';
    zon2.value = message[2][1] == '0' ? 'بسته' : 'باز';
    zon3.value = message[2][2] == '0' ? 'بسته' : 'باز';
    zon4.value = message[2][3] == '0' ? 'بسته' : 'باز';
    Speaker.value = message[3] == '0' ? 'روشن' : 'خاموش';

    AntennaStrength.value = '${(int.parse(message[5]) / 31) * 100}';

    print('Anten:${(int.parse(message[5]) / 31) * 100}');
    AntennaStrength.value = AntennaStrength.value != '100.0'
        ? AntennaStrength.value.substring(0, 2)
        : '100';
    BatterPower.value = message[8];
    Get.find<Controllerrelay>().State[0].value == '1' ? true : false;
    CountContact.value = message[6];
    CommunicationsStatus.value = message[7] == '1' ? 'روشن' : 'خاموش';
    int lenghtrelay =
        Get.find<Controllerinfo>().Model.value == 'LX PRO' ? 6 : 2;
    for (var i = 0; i < lenghtrelay; i++) {
      if (message[9][i] == '1') {
        Get.find<Controllerrelay>().State[i].value = true;
      } else {
        Get.find<Controllerrelay>().State[i].value = false;
      }
    }
    Get.find<Controllerdatabase>().UpdateLx();
    Get.find<Controllerrelay>().UpdateRelay();
  }
}

Map<String, Map<String, String>> MapStateDev = {
  '4': {'on': 'فعال'},
  '0': {'off': 'غیرفعال'},
  '3': {'silent': 'سایلنت'},
  '2': {'halfon': 'نیمه فعال'},
};
Map<String, String> MapstateDev2 = {
  'on': 'فعال',
  'off': 'غیرفعال',
  'silent': 'سایلنت',
  'halfon': 'نیمه فعال'
};
