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
    bool lan = isEnglish(Name[i].value);
    return '82*${lan?'E':'F'}*${Name[i].value}';
  }

  AddZon(String id) async {
    var prefs = SharedPreferencesAsync();
    List<String> value = List.generate(
      19,
      (i) =>
          'زون ${i + 1}${CodeSplite}${ListModesZon.keys.elementAt(0)}${CodeSplite}true${CodeSplite}1',
    );
    prefs.setStringList('${id}zon', value);
  }

  GetZon(String id) async {
    var prefs = SharedPreferencesAsync();
    List<String> value = await prefs.getStringList('${id}zon') ?? [];
    Name.value = List.generate(19, (i) => value[i].split(CodeSplite)[0].obs);
    Mode.value = List.generate(19, (i) => value[i].split(CodeSplite)[1].obs);
    State.value = List.generate(
      19,
      (i) => value[i].split(CodeSplite)[2] == 'true' ? true.obs : false.obs,
    );
    Part.value = List.generate(19, (i) => value[i].split(CodeSplite)[3].obs);
  }

  UpdateZon() async {
    var prefs = SharedPreferencesAsync();
    List<String> value = List.generate(
      19,
      (i) =>
          '${Name[i].value}${CodeSplite}${Mode[i].value}${CodeSplite}${State[i].value}${CodeSplite}${Part[i].value}',
    );
    prefs.setStringList('${Get.find<Controllerinfo>().id.value}zon', value);
  }

  Future<String> ChangePart({int index=0,int part = 0}) async {
    Part[index].value = '${part+1}';
    UpdateZon();
    return '46*${index + 1}*${Part[index].value}';
  }

  InquiryMode() async {
    List<String> message = Get.find<Controllerother>().TextInuiry.value
        .replaceAll('#', '')
        .split('*Z');
    for (var i = 1; i < message.length; i++) {
      Mode[i - 1].value = ListModesZonInquiry[message[i][1]] ?? 'نرمال کلوز';
    }
    UpdateZon();
  }

  InquiryPart() {
    String message = Get.find<Controllerother>().TextInuiry.value.substring(
      0,
      18,
    );
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
    String message = Get.find<Controllerother>().TextInuiry.value.substring(
      0,
      18,
    );
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
Map<String, String> ListModesZonInquiry = {
  'N': 'نرمال کلوز',
  'í': 'نرمال کلوز',
  'ÿ': 'نرمال کلوز',
  'O': 'نرمال اوپن',
  'D': 'دینگ دانگ',
  'H': '24th',
  'G': 'گارد',
  'j': 'جاسوسی',
  'W': 'جاسوسی 24 ساعت ',
  'B': 'زون خطر nc',
  'b': 'زون خطر no',
  'i': 'تماس با پلیس no سایلنت',
  'I': 'تماس با پلیس nc سایلنت',
  'M': 'تماس با پلیس nc',
  'm': 'تماس با پلیس no',
  'F': 'اعلان حریق nc',
  'f': 'اعلان حریق no',
};
bool isEnglish(String text) {
  for (final rune in text.runes) {
    if (rune > 127) {
      return false;
    }
  }
  return true;
}