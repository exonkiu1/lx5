import 'package:get/get.dart';
import 'package:lx/Getx/ControllerDatabase.dart';
import 'package:lx/Getx/ControllerInfo.dart';
import 'package:lx/Getx/ControllerOther.dart';
import 'package:lx/Getx/ControllerSyncing.dart';
import 'package:lx/Getx/controllerWarenty.dart';
import 'package:lx/Stt/ControllerSttAddDevice.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controllerremote extends GetxController {
  RxList<RxString> Name = <RxString>[].obs;
  RxList<RxString> Part = <RxString>[].obs;
  RxList<RxString> Statelock = <RxString>[].obs;
  ////////////////
  RxBool showpart = false.obs;
  RxList<int> List_Remote = <int>[].obs;

  AddRemote(String id) async {
    var prefs = SharedPreferencesAsync();
    List<String> value =
        List.generate(30, (i) => 'ریموت ${i}${CodeSplite}1${CodeSplite}unlock');
    await prefs.setStringList('${id}remote', value);
    if (Get.find<Controllersttadddevice>().SingleUser.value) {
      List_Remote.value = List.generate(30, (i) => i);
       prefs.setStringList(
        '${id}ListRemote', List.generate(30, (i) => '$i'));
    }
  }

  GetRemote(String id) async {
    var prefs = SharedPreferencesAsync();
    List<String> value = await prefs.getStringList('${id}remote') ?? [];
    Name.value = List.generate(30, (i) => value[i].split(CodeSplite)[0].obs);
    Part.value = List.generate(30, (i) => value[i].split(CodeSplite)[1].obs);
    Statelock.value =
        List.generate(30, (i) => value[i].split(CodeSplite)[2].obs);
    List<String> copy_ListRemote =
        await prefs.getStringList('${id}ListRemote') ?? [];
    List_Remote.value = List.generate(
        copy_ListRemote.length, (i) => int.parse(copy_ListRemote[i]));
  }

  UpdateRemote() async {
    var prefs = SharedPreferencesAsync();
    List<String> value = List.generate(
        30,
        (i) =>
            '${Name[i].value}${CodeSplite}${Part[i].value}${CodeSplite}${Statelock[i].value}');
    await prefs.setStringList(
        '${Get.find<Controllerinfo>().id.value}remote', value);
    List<String> copy_ListRemote =
        List.generate(List_Remote.length, (i) => List_Remote[i].toString());
    prefs.setStringList(
        '${Get.find<Controllerinfo>().id.value}ListRemote', copy_ListRemote);
  }

  Future<String> ChangeNameRemote(int i) async {
    Name[i].value = Get.find<Controllerother>().tf.text;
    UpdateRemote();
    return '';
  }

  Future<String> ChangePart() async {
    String val = '';
    for (var i = 0; i < 30; i++) {
      if (Part[i].value != '8') {
        val = val + Part[i].value;
      } else {
        val = val + '0';
      }
    }
    UpdateRemote();
    showpart.value = false;
    return 'LUXSTS$val';
  }

  Future<String> ChangeStateLock(
      {String state_lock = '', int index = 1}) async {
    Statelock[index].value = state_lock;
    UpdateRemote();
    return 'LUXVV*${index}*${keyvalueStatelock[state_lock]}';
  }

  Map<String, String> keyvalueStatelock = {'lock': 'L', 'unlock': 'U'};
  Future<String> DeleteRemote(int i) async {
    Part[i].value = '1';
    Name[i].value = 'ریموت ${i + 1}';
    UpdateRemote();
    return '50*${i + 1}';
  }

  Inquiry() {
    String message = Get.find<Controllerother>()
        .TextInuiry
        .value
        .replaceAll(';', '')
        .replaceAll('#', '');
    for (var i = 0; i < 30; i++) {
      if (int.tryParse(message[i]) != null) {
        Part[i].value = message[i];
      }
    }
    List_Remote.value = [];
    if (Get.find<Controllerinfo>().Partion.value == '1') {
      List_Remote.value = List.generate(30, (i) => i);
    } else {
      for (var i = 0; i < message.length; i++) {
        if (Get.find<Controllerinfo>().Partion.value == message[i]) {
          List_Remote.add(i);
        }
      }
    }
    UpdateRemote();
    Get.find<Controllersyncing>().Syncing();
  }
}
