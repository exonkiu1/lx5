import 'package:get/get.dart';
import 'package:lx/Getx/ControllerWarrenty.dart';
import '/Getx/ControllerContact.dart';
import '/Getx/ControllerDatabase.dart';
import '/Getx/ControllerHomePage.dart';
import '/Getx/ControllerInfo.dart';
import '/Getx/ControllerInquiry.dart';
import '/Getx/ControllerOther.dart';
import '/Getx/ControllerPassword.dart';
import '/Getx/ControllerRelay.dart';
import '/Getx/ControllerRemote.dart';
import '/Getx/ControllerSetting.dart';
import '/Getx/ControllerStateAllDev.dart';
import '/Getx/ControllerZon.dart';
import '/Page/Options/ControllerOptions.dart';
import '/Page/ReportSms/ControllerReportSms.dart';
import '/Stt/ControllerSttAddDevice.dart';
import '/Stt/ControllerSttContact.dart';
import '/Stt/ControllerSttHomePage.dart';
import '/Stt/MainStt.dart';

class mybinding implements Bindings {
  @override
  void dependencies() async {
    Get.put(Controllerother(), permanent: true);
    Get.put(Controllerdatabase(), permanent: true);
    Get.put(Controllerinfo(), permanent: true);
    Get.put(Controllerhomepage(), permanent: true);
    Get.put(Controllercontact(), permanent: true);
    Get.put(Controllerrelay(), permanent: true);
    Get.put(Controllerzon(), permanent: true);
    Get.put(Controllerpassword(), permanent: true);
    Get.put(Controllersetting(), permanent: true);
    Get.put(Controllerstatealldev(), permanent: true);
    Get.put(Controllerremote(), permanent: true);
    Get.put(Controllerinquiry(), permanent: true);
    Get.put(Controllerreportsms(), permanent: true);
    Get.put(Controllerstt(), permanent: true);
    Get.put(Controllerstthomepage(), permanent: true);
    Get.put(Controllersttadddevice(), permanent: true);
    Get.put(Controllersttcontact(), permanent: true);
    await Future.delayed(Duration(seconds: 2));
    Get.put(Controlleroptions(), permanent: true);
    Get.put(Controllerwarrenty(), permanent: true);
    // TODO: implement dependencies
  }
}
