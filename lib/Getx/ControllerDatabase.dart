import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '/DateBase/DataBase.dart';
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
DateTime khordad_15 = DateTime(2025, 6, 8);

class Controllerdatabase extends GetxController {
  @override
  void onInit() {
    GetLx(splahscreen: true);
    // TODO: implement onInit
    super.onInit();
  }

  RxInt Lenght = 0.obs;
  RxInt Index = 0.obs;
  List<DevLX> Devs = [];

  ///
  GetLx({int i = 0, bool splahscreen = false}) async {
    Devs = await DatabaseLX.instance.GetDevs();
    Lenght.value = Devs.length;

    Index.value = i;
    if (Devs.length != 0) {
      if (splahscreen) {
        DateTime timenow = DateTime.now();
        if (khordad_15.isAfter(timenow)) {
          Get.off(() => const Splashscreen());
        }
      }
      DevLX model = Devs[i];
      String id = model.id;
      Get.find<Controllerinfo>().GetInfo(model);
      Get.find<Controllerhomepage>().GetHomepage(model);
      Get.find<Controllerpassword>().GetPass(model);
      Get.find<Controllercontact>().GetContact(id);
      Get.find<Controllerremote>().GetRemote(id);
      Get.find<Controllerzon>().GetZon(id);
      Get.find<Controllerrelay>().GetRelay(id);
      Get.find<Controllersetting>().GetSetting(model);
    } else {
      await Future.delayed(
          Duration(milliseconds: 777), () => Get.off(() => const Adddevice2()));
    }
  }

  ///
  TextEditingController tfName = TextEditingController(),
      tfPhone = TextEditingController();
  RxInt sim = 0.obs;

  ///
  AddLx() async {
    var rand = Random();
    int id = rand.nextInt(1000000);
    DevLX model = DevLX(
      id: '$id',
      Phone: tfPhone.text,
      Name: tfName.text,
      Oprator: Get.find<Controllerinfo>().FindOprator(tfPhone.text),
      Simcard: sim.value.toString(),
    );
    await DatabaseLX.instance.AddDev(model);
    await Get.find<Controllercontact>().AddContact('$id');
    await Get.find<Controllerrelay>().AddRelay('$id');
    await Get.find<Controllerremote>().AddRemote('$id');
    await Get.find<Controllerzon>().AddZon('$id');
    await Future.delayed(const Duration(milliseconds: 100));
    await GetLx(i: Lenght.value);
    Get.off(() => Homepage());
  }

  //
  UpdateLx() {
    DevLX model = DevLX(
      //info
      id: Get.find<Controllerinfo>().id.value,
      Phone: Get.find<Controllerinfo>().Phone.value,
      Name: Get.find<Controllerinfo>().Name.value,
      StateDev: Get.find<Controllerhomepage>().StateDev.value,
      Oprator: Get.find<Controllerinfo>().Oprator.value,
      Charge: Get.find<Controllerinfo>().Charge.value.toString(),
      Pass: Get.find<Controllerpassword>().PasswordDev.value,
      Simcard: Get.find<Controllerinfo>().Simcard.value.toString(),
      //info
      //Setting
      DevLanguage: Get.find<Controllersetting>().DevLanguage.value,
      EstablishingContactDuringPowerOutage: Get.find<Controllersetting>()
          .EstablishingContactDuringPowerOutage
          .value,
      SemiActiveStatusRemote:
          Get.find<Controllersetting>().SemiActiveStatusRemote.value,
      PeriodicBatteryReport:
          Get.find<Controllersetting>().PeriodicBatteryReport.value,
      InventoryReport: Get.find<Controllersetting>().InventoryReport.value,
      AlarmMode: Get.find<Controllersetting>().AlarmMode.value,
      AlarmTime: Get.find<Controllersetting>().AlarmTime.value,
      //Setting
      //inquiry
      UrbanElectricity: Get.find<Controllerinquiry>().UrbanElectricity.value,
      AntennaStrength: Get.find<Controllerinquiry>().AntennaStrength.value,
      BatterPower: Get.find<Controllerinquiry>().BatterPower.value,
      CommunicationsStatus:
          Get.find<Controllerinquiry>().CommunicationsStatus.value,
      CountContact: Get.find<Controllerinquiry>().CountContact.value,
      CountRemote: Get.find<Controllerinquiry>().CountRemote.value,
      Speaker: Get.find<Controllerinquiry>().Speaker.value,
      zon1: Get.find<Controllerinquiry>().zon1.value,
      zon2: Get.find<Controllerinquiry>().zon2.value,
      zon3: Get.find<Controllerinquiry>().zon3.value,
      zon4: Get.find<Controllerinquiry>().zon4.value,
      //inquiry
    );
    DatabaseLX.instance.UpdateDev(model);
  }

  DeleteDevLx() async {
    await DatabaseLX.instance.DeleteDev(Get.find<Controllerinfo>().id.value);
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
    );
    DatabaseLX.instance.UpdateDev(model);
    Get.find<Controllercontact>().AddContact(id);
    Get.find<Controllerremote>().AddRemote(id);
    Get.find<Controllerrelay>().AddRelay(id);
    Get.find<Controllerzon>().AddZon(id);
    await Future.delayed(Duration(milliseconds: 200));
    GetLx(i: Index.value);
  }
}
