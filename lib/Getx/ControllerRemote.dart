import 'package:get/get.dart';
import 'package:lx/Getx/ControllerDatabase.dart';
import 'package:lx/Getx/ControllerInfo.dart';
import 'package:lx/Getx/ControllerOther.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controllerremote extends GetxController {
  RxList<RxString> Name = <RxString>[].obs;
  RxList<RxString> Part = <RxString>[].obs;
  ////////////////
  RxBool showpart = false.obs;
  AddRemote(String id) async {
    var prefs = SharedPreferencesAsync();
    List<String> value =
        List.generate(30, (i) => 'ریموت ${i }${CodeSplite}1');
    await prefs.setStringList('${id}remote', value);
  }

  GetRemote(String id) async {
    var prefs = SharedPreferencesAsync();
    List<String> value = await prefs.getStringList('${id}remote') ?? [];
    Name.value = List.generate(30, (i) => value[i].split(CodeSplite)[0].obs);
    Part.value = List.generate(30, (i) => value[i].split(CodeSplite)[1].obs);
  }

  UpdateRemote() async {
    var prefs = SharedPreferencesAsync();
    List<String> value = List.generate(
        30, (i) => '${Name[i].value}${CodeSplite}${Part[i].value}');
    await prefs.setStringList(
        '${Get.find<Controllerinfo>().id.value}remote', value);
  }

  Future<String> ChangeNameRemote(int i) async {
    Name[i].value = Get.find<Controllerother>().tf.text;
    UpdateRemote();
    return '';
  }

  Future<String> ChangePart() async {
    String val = '';
    for (var i = 0; i < 30; i++) {
      val = val + Part[i].value;
    }
    UpdateRemote();
    showpart.value = false;
    return 'LUXSTS$val';
  }

  Future<String> DeleteRemote(int i) async {
    Part[i].value = '1';
    Name[i].value = 'ریموت ${i + 1}';
    UpdateRemote();
    return '50*${i + 1}';
  }

  Inquiry() {
    String message = Get.find<Controllerother>().TextInuiry.value;
    for (var i = 0; i < 30; i++) {
      Part[i].value = message[i];
    }
    UpdateRemote();
  }
}
