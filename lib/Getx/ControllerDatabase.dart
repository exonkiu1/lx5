import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerOther.dart';
import 'package:lx/Getx/ControllerPassRemote.dart';
import 'package:lx/Getx/controllerWarenty.dart';
import 'package:lx/Stt/ControllerSttAddDevice.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/DateBase/Model.dart';
import '/Getx/ControllerContact.dart';
import '/Getx/ControllerHomePage.dart';
import '/Getx/ControllerInfo.dart';
import '/Getx/ControllerInquiry.dart';
import '/Getx/ControllerPassword.dart';
import '/Getx/ControllerRelay.dart';
import '/Getx/ControllerRemote.dart';
import '/Getx/ControllerSetting.dart';
import '/Getx/ControllerZon.dart';
import '/Page/HomePage/HomePage.dart';
import '/Page/SplashScreen.dart/SplashScreen.dart';
import '../Page/AddDevice/AddDevice2.dart';

String CodeSplite = '#%%!%%!#';
String GetDevSplite(String val, {int index = 0, bool autoselected = true}) {
  return Get.find<Controllerdatabase>()
      .Devs[autoselected ? Get.find<Controllerdatabase>().Index.value : index]
      .split('${val}')[1]
      .split(':')[1]
      .split(',')[0];
}

class Controllerdatabase extends GetxController {
  @override
  void onInit() {
    GetLx(splahscreen: true);
    // TODO: implement onInit
    super.onInit();
  }

  RxInt Lenght = 0.obs;
  RxInt Index = 0.obs;
  RxList<String> Devs = <String>[].obs;
  RxString id = ''.obs;

  ///
  GetLx({int i = 0, bool splahscreen = false}) async {
    // Devs = await DatabaseLX.instance.GetDevs();
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    Devs.value = await prefs.getStringList('Dev') ?? [];
    Lenght.value = Devs.length;
    Index.value = i;
    if (Devs.length != 0) {
      if (splahscreen) {
        Get.off(() => const Splashscreen());
      }
      String model = Devs[i];
      print(model);
      // DevLX model = Devs[i];
      id.value = model
          .split(',')[0]
          .split(':')[1]
          .removeAllWhitespace
          .replaceAll('\n', '');
      Get.find<Controllerinfo>().GetInfo();
      Get.find<Controllerhomepage>().GetHomepage();
      Get.find<Controllerpassword>().GetPass();
      Get.find<Controllercontact>().GetContact(id.value);
      Get.find<Controllerremote>().GetRemote(id.value);
      Get.find<Controllerzon>().GetZon(id.value);
      Get.find<Controllerrelay>().GetRelay(id.value);
      Get.find<Controllersetting>().GetSetting();
      Get.find<Controllerinquiry>().GetInquiry();
      Get.find<Controllerwarrenty>().GetWarenty();
      Get.find<Controllerpassremote>().GetPasswordRemote();
    } else {
      Get.off(() => const Adddevice2());
    }
  }

  ///
  TextEditingController tfName = TextEditingController(),
      tfPhone = TextEditingController();

  ///
  AddLx() async {
    Get.find<Controllersttadddevice>().PlayMusic('greeting');
    var rand = Random();
    int id = rand.nextInt(1000000);
    String model = """
        id:${id},
        Phone:${tfPhone.text},
        Name:${tfName.text},
        StateDev:on,
        Oprator:${Get.find<Controllerinfo>().FindOprator(tfPhone.text)},
        Charge:0,
        Pass:0000,
        Simcard:${0},
        Model:${Get.find<Controllerother>().Model.value == '' ? 'LX PRO' : Get.find<Controllerother>().Model.value},
        Partion:
            ${Get.find<Controllersttadddevice>().SingleUser.value ? '1' : ''}
        DevLanguage:per,
        MelodySpeaker:0,
        EstablishingContactDuringPowerOutage:false,
        SemiActiveStatusRemote:false,
        PeriodicBatteryReport:10,
        InventoryReport:12,
        AlarmMode:ابتدا پیامک سپس تماس با تکرار,
        AlarmTime:10,
        UrbanElectricity:روشن,
        AntennaStrength:,
        BatterPower:,
        CommunicationsStatus:,
        CountContact:,
        CountRemote:,
        Speaker:,
        zon1:بسته,
        zon2:بسته,
        zon3:بسته,
        zon4:بسته,
        Address:,
        City:,
        DateWarrenty:,
        NameClinet:,
        NameTechnician:,
        PhoneClinet:,
        PhoneTechnician:,
        Province:,
        ModelPro:,
        PasswordRemote:,
        """;

    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    List<String> ListModel = await prefs.getStringList('Dev') ?? [];
    ListModel.add(model);
    await prefs.setStringList('Dev', ListModel);
    await Get.find<Controllercontact>().AddContact('$id');
    await Get.find<Controllerrelay>().AddRelay('$id');
    await Get.find<Controllerremote>().AddRemote('$id');
    await Get.find<Controllerzon>().AddZon('$id');
    await Future.delayed(const Duration(milliseconds: 100));
    await GetLx(i: Lenght.value);
    Get.off(() => Homepage());
  }

  //
  UpdateLx() async {
    String model = """
        id:${Get.find<Controllerinfo>().id.value},
        Phone:${Get.find<Controllerinfo>().Phone.value},
        Name:${Get.find<Controllerinfo>().Name.value},
        StateDev:${Get.find<Controllerhomepage>().StateDev.value},
        Oprator:${Get.find<Controllerinfo>().Oprator.value},
        Charge:${Get.find<Controllerinfo>().Charge.value},
        Pass:${Get.find<Controllerpassword>().PasswordDev.value},
        Simcard:${Get.find<Controllerinfo>().Simcard.value},
        Model:${Get.find<Controllerinfo>().Model.value},
        DevLanguage:${Get.find<Controllersetting>().DevLanguage.value},
        EstablishingContactDuringPowerOutage:${Get.find<Controllersetting>().EstablishingContactDuringPowerOutage.value},
        SemiActiveStatusRemote:${Get.find<Controllersetting>().SemiActiveStatusRemote.value},
        PeriodicBatteryReport:${Get.find<Controllersetting>().PeriodicBatteryReport.value},
        InventoryReport:${Get.find<Controllersetting>().InventoryReport.value},
        AlarmMode:${Get.find<Controllersetting>().AlarmMode.value},
        AlarmTime:${Get.find<Controllersetting>().AlarmTime.value},
        UrbanElectricity:${Get.find<Controllerinquiry>().UrbanElectricity.value},
        AntennaStrength:${Get.find<Controllerinquiry>().AntennaStrength.value},
        BatterPower:${Get.find<Controllerinquiry>().BatterPower.value},
        CommunicationsStatus:${Get.find<Controllerinquiry>().CommunicationsStatus.value},
        CountContact:${Get.find<Controllerinquiry>().CountContact.value},
        CountRemote:${Get.find<Controllerinquiry>().CountRemote.value},
        Speaker:${Get.find<Controllerinquiry>().Speaker.value},
        zon1:${Get.find<Controllerinquiry>().zon1.value},
        zon2:${Get.find<Controllerinquiry>().zon2.value},
        zon3:${Get.find<Controllerinquiry>().zon3.value},
        zon4:${Get.find<Controllerinquiry>().zon4.value},
        Address:${Get.find<Controllerwarrenty>().Address.value},
        City:${Get.find<Controllerwarrenty>().City.value},
        DateWarrenty:${Get.find<Controllerwarrenty>().DateWarrenty.value},
        NameClinet:${Get.find<Controllerwarrenty>().NameClinet.value},
        NameTechnician:${Get.find<Controllerwarrenty>().NameTechnician.value},
        PhoneClinet:${Get.find<Controllerwarrenty>().PhoneClinet.value},
        PhoneTechnician:${Get.find<Controllerwarrenty>().PhoneTechnician.value},
        Province:${Get.find<Controllerwarrenty>().Province.value},
        ModelPro:${Get.find<Controllerwarrenty>().ModelPro.value},
        PasswordRemote:${Get.find<Controllerpassremote>().PasswordRemote.value},
        Partion:${Get.find<Controllerinfo>().Partion.value}
        """;
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    List<String> ListModel = await prefs.getStringList('Dev') ?? [];
    ListModel[Index.value] = model;
    await prefs.setStringList('Dev', ListModel);
    //  DatabaseLX.instance.UpdateDev(model);
  }

  DeleteDevLx() async {
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    List<String> ListModel = await prefs.getStringList('Dev') ?? [];
    ListModel.removeAt(Index.value);
    await prefs.setStringList('Dev', ListModel);

    GetLx();
  }

  ResetDevLx() async {
    String id = Get.find<Controllerinfo>().id.value;
    DevLX model = DevLX(
        id: id,
        Phone: Get.find<Controllerinfo>().Phone.value,
        Name: Get.find<Controllerinfo>().Name.value,
        StateDev: Get.find<Controllerhomepage>().StateDev.value,
        Oprator: Get.find<Controllerinfo>().Oprator.value,
        Model: Get.find<Controllerinfo>().Model.value.toString(),
        Address: Get.find<Controllerwarrenty>().Address.value,
        City: Get.find<Controllerwarrenty>().City.value,
        DateWarrenty: Get.find<Controllerwarrenty>().DateWarrenty.value,
        NameClinet: Get.find<Controllerwarrenty>().NameClinet.value,
        NameTechnician: Get.find<Controllerwarrenty>().NameTechnician.value,
        PhoneClinet: Get.find<Controllerwarrenty>().PhoneClinet.value,
        PhoneTechnician: Get.find<Controllerwarrenty>().PhoneTechnician.value,
        Province: Get.find<Controllerwarrenty>().Province.value,
        ModelPro: Get.find<Controllerwarrenty>().ModelPro.value);
    //  DatabaseLX.instance.UpdateDev(model);
    Get.find<Controllercontact>().AddContact(id);
    Get.find<Controllerremote>().AddRemote(id);
    Get.find<Controllerrelay>().AddRelay(id);
    Get.find<Controllerzon>().AddZon(id);
    await Future.delayed(Duration(milliseconds: 200));
    GetLx(i: Index.value);
  }
}
