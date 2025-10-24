import 'package:get/get.dart';
import 'package:lx/DateBase/Model.dart';
import 'package:lx/Getx/ControllerDatabase.dart';
import 'package:lx/Getx/ControllerOther.dart';

class Controllersetting extends GetxController {
  RxString DevLanguage = ''.obs,
      EstablishingContactDuringPowerOutage = ''.obs,
      SemiActiveStatusRemote = ''.obs,
      PeriodicBatteryReport = ''.obs,
      InventoryReport = ''.obs,
      AlarmTime = ''.obs,
      AlarmMode = ''.obs,MelodySpeaker=''.obs;
  GetSetting() {
    DevLanguage.value = GetDevSplite('DevLanguage');
    EstablishingContactDuringPowerOutage.value =
        GetDevSplite('EstablishingContactDuringPowerOutage');
    SemiActiveStatusRemote.value = GetDevSplite('EstablishingContactDuringPowerOutage');
    PeriodicBatteryReport.value = GetDevSplite('PeriodicBatteryReport');
    InventoryReport.value = GetDevSplite('InventoryReport');
    AlarmTime.value = GetDevSplite('AlarmTime');
    AlarmMode.value = GetDevSplite('AlarmMode');
    MelodySpeaker.value=GetDevSplite('MelodySpeaker');

  }
   Future<String> ChangeMelodySpeaker(int value) async {
    MelodySpeaker.value = value.toString();
    Get.find<Controllerdatabase>().UpdateLx();
    return '221*0__${value}bb#';
  }
  Future<String> ChangeLangDev(String value) async {
    DevLanguage.value = value;
    Get.find<Controllerdatabase>().UpdateLx();
    return '53*${value == 'per' ? '0' : '1'}';
  }

  Future<String> ChangeEstablishingContactDuringPowerOutage(
      String value) async {
    EstablishingContactDuringPowerOutage.value = value;
    Get.find<Controllerdatabase>().UpdateLx();
    return '55*${value == 'true' ? '1' : '0'}';
  }

  Future<String> ChangeSemiActiveStatusRemote(String value) async {
    SemiActiveStatusRemote.value = value;
    Get.find<Controllerdatabase>().UpdateLx();
    return '51*${value == 'true' ? '1' : '0'}';
  }

  Future<String> ChangeModeAlarm(String value) async {
    AlarmMode.value = value;
    Get.find<Controllerdatabase>().UpdateLx();
    return '51*${ModeAlarm[value]}';
  }

  Future<String> ChangePeriodicBatteryReport() async {
    PeriodicBatteryReport.value = Get.find<Controllerother>().tf.text;
    Get.find<Controllerdatabase>().UpdateLx();
    return '44*${PeriodicBatteryReport.value}';
  }

  Future<String> ChangeInventoryReport() async {
    InventoryReport.value = Get.find<Controllerother>().tf.text;
    Get.find<Controllerdatabase>().UpdateLx();
    return '43*${InventoryReport.value}';
  }

  Future<String> ChangeAlarmTime() async {
    AlarmTime.value = Get.find<Controllerother>().tf.text;
    Get.find<Controllerdatabase>().UpdateLx();
    return '41*${AlarmTime.value}';
  }

  Future<String> ChangeDeleteRemote() async {
    String value = Get.find<Controllerother>().tf.text;
    return '50*${value}';
  }

  Future<String> ChangeDeleteSencor() async {
    String value = Get.find<Controllerother>().tf.text;
    return '42*9';
    //'42*${int.parse(value) + 4}*9';
  }

  Future<String> ChangeAddRemote() async {
    return '57';
  }

  Future<String> ChangeAddSencor() async {
    return '66';
  }
}

Map<String, String> ModeAlarm = {
  'ابتدا پیامک سپس تماس با تکرار': '6',
  'ابتدا تماس سپس پیامک با تکرار': '7',
  'ابتدا پیامک سپس تماس': '0',
  'ابتدا تماس سپس پیامک': '1',
};
