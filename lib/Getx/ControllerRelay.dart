import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lx/Getx/ControllerDatabase.dart';
import 'package:lx/Getx/ControllerInfo.dart';
import 'package:lx/Getx/ControllerOther.dart';
import 'package:lx/Getx/ControllerZon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controllerrelay extends GetxController {
  RxList<RxString> Name = <RxString>[].obs;
  RxList<RxBool> State = <RxBool>[].obs;
  RxList<RxString> TimeTriger = <RxString>[].obs;
  RxList<RxInt> Zon = <RxInt>[].obs;
  RxList<RxMap<String, String>> listzon = <RxMap<String, String>>[].obs;
  Future<String> ChangeState(bool state, int index) async {
    State[index].value = state;
    await UpdateRelay();
    final music = AudioPlayer();
    music.setAsset('assets/music/relay/${State[index].value}.mp3');
    music.play();
    return '*LUXREL${index + 1}${state ? 'ON' : 'OFF'}';
  }

  Future<String> Triger(int index) async {
    return 'LUXREL${index + 1}*T';
  }

  Future<String> ChangeZon(int index,int value) async {
    Zon[index].value = value;
    print('${listzon[Zon[index]
                          .value]['label']}');
    UpdateRelay();
    return 'LUXREL${index + 1}${Get.find<Controllerrelay>().listzon[value]['value']}';
  }

  StartTriger(int index) async {
    bool beforstate = State[index].value;
    for (var i = 0; i < 3; i++) {
      await Future.delayed(Duration(milliseconds: 500), () {
        State[index].value
            ? State[index].value = false
            : State[index].value = true;
      });
      print('state${index + 1}: ${State[index].value}');
    }
    State[index].value = beforstate;
  }

  /*  ChangeTriger(int index, BuildContext context) async {
    var resultingDuration = await showDurationPicker(
      context: context,
      initialTime: const Duration(seconds: 2),
      baseUnit: BaseUnit.second,
    );
    if (resultingDuration != null) {
      String value = '$resultingDuration'.split('.')[0].replaceAll(':', '');
      if (value.length == 5) {
        value = '0$value';
      }
      TimeTriger[index].value = value;
      await UpdateRelay();
    }
  } */

  Future<String> ChangeName(int index) async {
    Name[index].value = Get.find<Controllerother>().tf.text;
    await UpdateRelay();
    return '';
  }

  AddRelay(String id) async {
    List<String> value = [];
    for (var i = 0; i < 6; i++) {
      value.add(
        'رله ${i + 1} ${CodeSplite}true${CodeSplite}000002${CodeSplite}-1',
      );
    }
    var prefs = SharedPreferencesAsync();
    await prefs.setStringList('${id}relay', value);
  }

  GetRelay(String id) async {
    var prefs = SharedPreferencesAsync();
    List<String> value = await prefs.getStringList('${id}relay') ?? [];
    Name.value = List.generate(6, (i) => value[i].split(CodeSplite)[0].obs);
    State.value = List.generate(
      6,
      (i) => value[i].split(CodeSplite)[1] == 'true' ? true.obs : false.obs,
    );
    TimeTriger.value = List.generate(
      6,
      (i) => value[i].split(CodeSplite)[2].obs,
    );
    Zon.value = List.generate(
      6,
      (i) => int.parse(value[i].split(CodeSplite)[3]).obs,
    );
    listzon.value = [];
    for (int zone = 0; zone <= 7; zone++) {
      final String letter = String.fromCharCode(65 + zone);
      listzon.add(
        {
          'label': '${Get.find<Controllerzon>().Name[zone].value}  متصل به رله,بسته',
          'value': letter,
        }.obs,
      );
      listzon.add(
        {
          'label': '${Get.find<Controllerzon>().Name[zone].value}  متصل به رله,باز',
          'value': letter.toLowerCase(),
        }.obs,
      );
    }
  }

  UpdateRelay() async {
    var prefs = SharedPreferencesAsync();
    List<String> value = List.generate(
      6,
      (i) =>
          '${Name[i].value}$CodeSplite${State[i].value}$CodeSplite${TimeTriger[i].value}$CodeSplite${Zon[i].value}',
    );
    await prefs.setStringList(
      '${Get.find<Controllerinfo>().id.value}relay',
      value,
    );
  }
}
