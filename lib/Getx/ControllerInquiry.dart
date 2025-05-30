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
  GetInquiry(DevLX model) {
    UrbanElectricity.value = model.UrbanElectricity;
    Speaker.value = model.Speaker;
    BatterPower.value = model.BatterPower;
    CountContact.value = model.CountContact;
    CountRemote.value = model.CountContact;
    AntennaStrength.value = model.AntennaStrength;
    CommunicationsStatus.value = model.CommunicationsStatus;
    zon1.value = model.zon1;
    zon2.value = model.zon2;
    zon3.value = model.zon3;
    zon4.value = model.zon4;
  }

  inquiry() {
    List<String> message = Get.find<Controllerother>().TextInuiry.value.split(
      ',',
    );
    Get.find<Controllerhomepage>().StateDev.value = MapStateDev[message[0]]!
        .keys
        .elementAt(0);
    UrbanElectricity.value = message[1] == '1' ? 'روشن' : 'خاموش';
    zon1.value = message[2][0] == '1' ? 'بسته' : 'باز';
    zon2.value = message[2][1] == '1' ? 'بسته' : 'باز';
    zon3.value = message[2][2] == '1' ? 'بسته' : 'باز';
    zon4.value = message[2][3] == '1' ? 'بسته' : 'باز';
    Speaker.value = message[3] == '1' ? 'روشن' : 'خاموش';

    AntennaStrength.value = '${(int.parse(message[5]) / 31) * 100}';

    print('Anten:${(int.parse(message[5]) / 31) * 100}');
    AntennaStrength.value =
        AntennaStrength.value != '100.0'
            ? AntennaStrength.value.substring(0, 2)
            : '100';
    BatterPower.value = message[8];
    Get.find<Controllerrelay>().State[0].value == '1' ? true : false;
    CountContact.value = message[6];
    CommunicationsStatus.value = message[7] == '1' ? 'روشن' : 'خاموش';
    for (var i = 0; i < 2; i++) {
      Get.find<Controllerrelay>().State[i].value =
          message[9][i] == '1' ? true : false;
    }
    Get.find<Controllerdatabase>().UpdateLx();
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
  'halfon': 'نیمه فعال',
};
