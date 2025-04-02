import 'package:get/get.dart';
import 'package:lx/Getx/ControllerDatabase.dart';
import 'package:lx/Getx/ControllerInfo.dart';
import 'package:lx/Getx/ControllerOther.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Controllerzon extends GetxController {
  RxList<RxString> Name = <RxString>[].obs;
  RxList<RxString> Mode = <RxString>[].obs;
  RxList<RxBool> State = <RxBool>[].obs;
  RxList<RxString> Part = <RxString>[].obs;

  ///
  RxBool showhalfon = false.obs;
  RxBool showpart = false.obs;

  ///
  Future<String> ChangeModeZon(String mode, int i) async {
    Mode[i].value = mode;
    UpdateZon();
    return '42*${i + 1}*${ListModesZon[mode]}';
  }

  Future<String> ChangeName(int i) async {
    Name[i].value = Get.find<Controllerother>().tf.text;
    UpdateZon();
    return '';
  }

  AddZon(String id) async {
    var prefs = SharedPreferencesAsync();
    List<String> value = List.generate(
        19,
        (i) =>
            'زون ${i + 1}${CodeSplite}${ListModesZon.keys.elementAt(0)}${CodeSplite}true${CodeSplite}1');
    prefs.setStringList('${id}zon', value);
  }

  GetZon(String id) async {
    var prefs = SharedPreferencesAsync();
    List<String> value = await prefs.getStringList('${id}zon') ?? [];
    Name.value = List.generate(19, (i) => value[i].split(CodeSplite)[0].obs);
    Mode.value = List.generate(19, (i) => value[i].split(CodeSplite)[1].obs);
    State.value = List.generate(19,
        (i) => value[i].split(CodeSplite)[2] == 'true' ? true.obs : false.obs);
    Part.value = List.generate(19, (i) => value[i].split(CodeSplite)[3].obs);
  }

  UpdateZon() async {
    var prefs = SharedPreferencesAsync();
    List<String> value = List.generate(
        19,
        (i) =>
            '${Name[i].value}${CodeSplite}${Mode[i].value}${CodeSplite}${State[i].value}${CodeSplite}${Part[i].value}');
    prefs.setStringList('${Get.find<Controllerinfo>().id.value}zon', value);
  }

  Future<String> ChangePart() async {
    String val = '';
    for (var i = 0; i < 18; i++) {
      val = val + Part[i].value;
    }
    showpart.value = false;
    UpdateZon();
    return 'LUXSSS$val';
  }

  InquiryMode() async {
    String message =
        Get.find<Controllerother>().TextInuiry.value.substring(1, 19);
    for (var i = 0; i < message.length; i++) {
      for (var i = 0; i < ListModesZon.length; i++) {
        if (ListModesZon.values.elementAt(i) == message[i]) {
          Mode[i].value = ListModesZon.keys.elementAt(i);
        }
      }
    }
  }

  InquiryPart() {
    String message =
        Get.find<Controllerother>().TextInuiry.value.substring(0, 18);
    for (var i = 0; i < 18; i++) {
      print(message[i]);
      Part[i].value = message[i];
    }
    UpdateZon();
  }

  Future<String> ChangeState() async {
    String value = '';
    for (var i = 0; i < 18; i++) {
      value = value + '${State[i].value ? '1' : '0'}';
    }
    showhalfon.value = false;
    await UpdateZon();
    return '14*${value}';
  }

  InquiryState() async {
    String message =
        Get.find<Controllerother>().TextInuiry.value.substring(0, 18);
  }

  DeleteAllZonWirles() async {
    return 'LUXZWE';
  }
}

Map<String, String> ListModesZon = {
  'نرمال کلوز': '1',
  'نرمال اوپن': '5',
  'دینگ دانگ': '2',
  '24th': '3',
  'گارد': '4',
  'جاسوسی': '6',
  'ابی': '7',
  '24th جاسوسی': '8',
};
