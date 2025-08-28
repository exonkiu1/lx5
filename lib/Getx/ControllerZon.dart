import 'package:get/get.dart';
import 'package:lx/Getx/ControllerDatabase.dart';
import 'package:lx/Getx/ControllerInfo.dart';
import 'package:lx/Getx/ControllerOther.dart';
import 'package:lx/Getx/ControllerSyncing.dart';
import 'package:lx/Stt/ControllerSttAddDevice.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model.dart';
import 'controllerWarenty.dart';

///
///
///
///

class Controllerzon extends GetxController {
  RxList<RxString> Name = <RxString>[].obs;
  RxList<RxString> Mode = <RxString>[].obs;
  RxList<RxBool> State = <RxBool>[].obs;
  RxList<RxString> Part = <RxString>[].obs;

  ///
  RxBool showhalfon = false.obs;
  RxBool showpart = false.obs;
  RxList<int> List_Zon = <int>[].obs;

  ///
  Future<String> ChangeModeZon(String mode, int i) async {
    Mode[i].value = mode;
    UpdateZon();
    return '42*${i + 1}*${ListModesZon[mode]}';
  }

  ///
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
    if (Get.find<Controllersttadddevice>().SingleUser.value) {
      int leng = 18;
      List_Zon.value = List.generate(leng, (i) => i);
       prefs.setStringList(
        '${id}ListZon', List.generate(leng, (i) => '$i'));
    }
  }

  GetZon(String id) async {
    var prefs = SharedPreferencesAsync();
    List<String> value = await prefs.getStringList('${id}zon') ?? [];

    Name.value = List.generate(19, (i) => value[i].split(CodeSplite)[0].obs);
    Mode.value = List.generate(19, (i) => value[i].split(CodeSplite)[1].obs);
    State.value = List.generate(19,
        (i) => value[i].split(CodeSplite)[2] == 'true' ? true.obs : false.obs);
    Part.value = List.generate(19, (i) => value[i].split(CodeSplite)[3].obs);
    List<String> copy_ListZon = await prefs.getStringList('${id}ListZon') ?? [];
    List_Zon.value =
        List.generate(copy_ListZon.length, (i) => int.parse(copy_ListZon[i]));
  }

  UpdateZon() async {
    var prefs = SharedPreferencesAsync();
    List<String> value = List.generate(
        19,
        (i) =>
            '${Name[i].value}${CodeSplite}${Mode[i].value}${CodeSplite}${State[i].value}${CodeSplite}${Part[i].value}');
    prefs.setStringList('${Get.find<Controllerinfo>().id.value}zon', value);
    List<String> copy_ListZon =
        List.generate(List_Zon.length, (i) => List_Zon[i].toString());
    prefs.setStringList(
        '${Get.find<Controllerinfo>().id.value}ListZon', copy_ListZon);
  }

  Future<String> ChangePart() async {
    String val = '';
    int leng =
        MapModelPro[Get.find<Controllerwarrenty>().ModelPro.value]!['zon']!;
    for (var i = 0; i < leng; i++) {
      if (Part[i].value != '8') {
        val = val + Part[i].value;
      } else {
        val = val + '0';
      }
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

  //112122111112121211#;1
  InquiryPart() {
    String message = Get.find<Controllerother>().TextInuiry.value;
    int leng =
        MapModelPro[Get.find<Controllerwarrenty>().ModelPro.value]!['zon']!;
    for (var i = 0; i < leng; i++) {
      // print(message[i]);
      if (int.tryParse(message[i]) != null) {
        Part[i].value = message[i];
      }
    }
    List_Zon.value = [];
    if (Get.find<Controllerinfo>().Partion.value == '1') {
      List_Zon.value = List.generate(leng, (i) => i);
    } else {
      for (var i = 0; i < message.length; i++) {
        if (Get.find<Controllerinfo>().Partion.value == message[i]) {
          List_Zon.add(i);
        }
      }
    }
    UpdateZon();
    Get.find<Controllersyncing>().Syncing();
  }

  Future<String> ChangeState() async {
    String value = '';
    int leng =
        MapModelPro[Get.find<Controllerwarrenty>().ModelPro.value]!['zon']!;
    for (var i = 0; i < leng; i++) {
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
  'دینگ دانگ': '0',
  '24th': '3',
  'گارد': '4',
  'جاسوسی': '6',
  'ابی': 'g',
  '24th جاسوسی': '8',
  'غیرفعال زون': '9'
};
