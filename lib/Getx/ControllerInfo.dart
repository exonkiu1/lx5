import 'dart:async';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:lx/DateBase/Model.dart';
import 'package:lx/Getx/ControllerDatabase.dart';
import 'package:lx/Getx/ControllerOther.dart';
import 'package:url_launcher/url_launcher.dart';

class Controllerinfo extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  RxString Phone = ''.obs;
  RxString Name = ''.obs;
  RxInt Charge = 0.obs;
  RxString Oprator = ''.obs;
  RxString id = ''.obs;
  RxInt Simcard = 0.obs;
  GetInfo(DevLX model) {
    id.value = model.id;
    Name.value = model.Name;
    Phone.value = model.Phone;
    Oprator.value = model.Oprator;
    Charge.value = int.parse(model.Charge);
    Simcard.value = int.parse(model.Simcard);
  }

  Future<String> ChangeName() async {
    Name.value = Get.find<Controllerother>().tf.text;
    Get.find<Controllerdatabase>().UpdateLx();

    return '';
  }

  Future<String> ChangePhone() async {
    Phone.value = Get.find<Controllerother>().tf.text;
    Oprator.value = FindOprator(Phone.value);
    Get.find<Controllerdatabase>().UpdateLx();

    return '';
  }

  InquiryCharge() {
    Charge.value = int.tryParse(Get.find<Controllerother>()
        .TextInuiry
        .value
        .replaceAll(new RegExp(r'[^0-9]'), ''))!;

    Get.find<Controllerdatabase>().UpdateLx();
  }

  String FindOprator(String phone) {
    String oprator = '';
    if (ha.contains(phone.substring(0, 4))) {
      oprator = 'ha';
    }
    if (rl.contains(phone.substring(0, 4))) {
      oprator = 'rl';
    }
    if (ir.contains(phone.substring(0, 4))) {
      oprator = 'ir';
    }
    return oprator;
  }

  Hearing() async {
    final Uri smsuri = Uri(
      scheme: 'tell',
      path: Get.find<Controllerinfo>().Phone.value,
    );
    if (await canLaunch(smsuri.toString())) {
      await launch(smsuri.toString());
      var context = Get.context;
    }
  }
}

Map<String, String> codeInquiryCharge = {
  'ha': '*140*11',
  'ir': '*555*1*2',
  'rl': '*200*2*2*1'
};
List<String> ha = [
  '0910',
  '0911',
  '0912',
  '0913',
  '0914',
  '0915',
  '0916',
  '0917',
  '0918',
  '0919',
  '0990',
  '0991',
  '0992',
  '0993',
];

List<String> ir = [
  '0930',
  '0933',
  '0935',
  '0936',
  '0937',
  '0938',
  '0939',
  '0901',
  '0902',
  '0903',
  '0904',
  '0905',
];

List<String> rl = [
  '0920',
  '0921',
  '0922',
];
