import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lx/Getx/ControllerDatabase.dart';
import 'package:lx/Getx/ControllerInfo.dart';
import 'package:lx/Getx/ControllerOther.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controllerrelay extends GetxController {
  RxList<RxString> Name = <RxString>[].obs;
  RxList<RxBool> State = <RxBool>[].obs;
  RxList<RxString> TimeTriger = <RxString>[].obs;
  Future<String> ChangeState(bool state, int index) async {
    State[index].value = state;
    await UpdateRelay();
    final music = AudioPlayer();
    music.setAsset('assets/music/relay/${State[index].value}.mp3');
    music.play();
    return '*2${index + 1}*${state ? 'ON' : 'OFF'}';
  }

  Future<String> Triger(int index) async {
    return '2${index + 1}*t000002';
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
      value.add('رله ${i + 1} ${CodeSplite}true${CodeSplite}000002');
    }
    var prefs = SharedPreferencesAsync();
    await prefs.setStringList('${id}relay', value);
  }

  GetRelay(String id) async {
    var prefs = SharedPreferencesAsync();
    List<String> value = await prefs.getStringList('${id}relay') ?? [];
    Name.value = List.generate(6, (i) => value[i].split(CodeSplite)[0].obs);
    State.value = List.generate(6,
        (i) => value[i].split(CodeSplite)[1] == 'true' ? true.obs : false.obs);
    TimeTriger.value =
        List.generate(6, (i) => value[i].split(CodeSplite)[2].obs);
  }

  UpdateRelay() async {
    var prefs = SharedPreferencesAsync();
    List<String> value = List.generate(
        6,
        (i) =>
            '${Name[i].value}$CodeSplite${State[i].value}$CodeSplite${TimeTriger[i].value}');
    await prefs.setStringList(
        '${Get.find<Controllerinfo>().id.value}relay', value);
  }
}
