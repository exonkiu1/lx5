import 'package:get/get.dart';
import 'package:lx/Getx/ControllerContact.dart';
import 'package:lx/Getx/ControllerDatabase.dart';
import 'package:lx/Getx/ControllerHomePage.dart';
import 'package:lx/Getx/ControllerInfo.dart';
import 'package:lx/Getx/ControllerInquiry.dart';
import 'package:lx/Getx/ControllerOther.dart';
import 'package:lx/Getx/ControllerPassword.dart';
import 'package:lx/Getx/ControllerRelay.dart';
import 'package:lx/Getx/ControllerRemote.dart';
import 'package:lx/Getx/ControllerSetting.dart';
import 'package:lx/Getx/ControllerStateAllDev.dart';
import 'package:lx/Getx/ControllerZon.dart';
import 'package:lx/Page/Options/ControllerOptions.dart';
import 'package:lx/Page/ReportSms/ControllerReportSms.dart';
import 'package:lx/Stt/ControllerSttAddDevice.dart';
import 'package:lx/Stt/ControllerSttContact.dart';
import 'package:lx/Stt/ControllerSttHomePage.dart';
import 'package:lx/Stt/MainStt.dart';

class mybinding implements Bindings {
  @override
  void dependencies() {
    Get.put(Controllerother(), permanent: true);
    Get.put(Controllerinfo(), permanent: true);
    Get.put(Controllerhomepage(), permanent: true);
    Get.put(Controllercontact(), permanent: true);
    Get.put(Controllerrelay(), permanent: true);
    Get.put(Controllerzon(), permanent: true);
    Get.put(Controllerpassword(), permanent: true);
    Get.put(Controllersetting(), permanent: true);
    Get.put(Controllerstatealldev(), permanent: true);
    Get.put(Controllerdatabase(), permanent: true);
    Get.put(Controllerremote(), permanent: true);
    Get.put(Controllerinquiry(), permanent: true);
    //Get.put(Controllerreportsms(), permanent: true);
    Get.put(Controlleroptions(), permanent: true);
    Get.put(Controllerstt(), permanent: true);
    Get.put(Controllerstthomepage(), permanent: true);
    Get.put(Controllersttadddevice(), permanent: true);
    Get.put(Controllersttcontact(), permanent: true);
    // TODO: implement dependencies
  }
}
