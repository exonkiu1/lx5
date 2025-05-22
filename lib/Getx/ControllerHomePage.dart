import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lx/DateBase/Model.dart';
import 'package:lx/Getx/ControllerDatabase.dart';
import 'package:lx/Getx/ControllerOther.dart';
import 'package:flutter/material.dart';

class Controllerhomepage extends GetxController {
  @override
  void onInit() {
    RotateEarth();
    // TODO: implement onInit
    super.onInit();
  }

  RxString StateDev = ''.obs;
  RxString Remote = 'false'.obs;
  GetHomepage(DevLX model) {
    StateDev.value = model.StateDev;
    print(StateDev.value);
  }

  Future<String> ChangeStateDev(String State) async {
    StateDev.value = State;
    await Get.find<Controllerdatabase>().UpdateLx();
    if (State == 'on' || State == 'off') {
      final music = AudioPlayer();
      await music.setAsset('assets/music/homepage/${State}.mp3');
      await music.play();
    }

    return '${MapStateDevCode[State]}';
  }

  RxDouble Degree = 100.0.obs;
  RxString StateErth = 'right'.obs;
  RxString beforStateErth = 'right'.obs;
  RxDouble Loc = 0.0.obs;
  RxDouble EndLoc = 0.0.obs;
  RxDouble spead = 0.25.obs;
  ChangeState() {
    // print('Start: ${Loc.value} // End: ${EndLoc.value}');
    double value = EndLoc.value - Loc.value;
    if (value > 40) {
      StateErth.value = 'right';
    }
    if (value < -40) {
      StateErth.value = 'left';
    }
    if (value < 10 && value > -10) {
      StateErth.value = 'stop';
    }
  }

  StartSpead() async {
    spead.value += 0.05;
  }

  EndSpead() async {
    //print('spead: ${spead.value}');
    for (var i = 0; i < 500; i++) {
      if (spead.value > 0.25) {
        await Future.delayed(Duration(milliseconds: 100));
        spead.value -= 0.02;
      } else {
        spead.value = 0.25;
        break;
      }
    }
  }

  RotateEarth() async {
    while (true) {
      await Future.delayed(Duration(milliseconds: 10));
      // print(StateErth.value);
      switch (StateErth.value) {
        case 'left':
          {
            if (Degree.value != 360) {
              Degree.value += spead.value;
            } else {
              Degree.value = 0;
            }
          }

        case 'right':
          {
            if (Degree.value > 0) {
              Degree.value -= spead.value;
            } else {
              Degree.value = 360;
            }
          }
        case 'stop':
          {
            //print('stop2');
          }
      }
    }
  }

  RxDouble DySpaceship = 0.0.obs;
  RxDouble DySpaceship2 = 0.0.obs;
  RxBool animationflying = false.obs;
  flySpaceship(BuildContext context, void Function() function) async {
    winking();
    if (Get.find<Controllerother>().DelyOrder.value == 0) {
      if (!animationflying.value && !animationbackflying.value) {
        animationflying.value = true;
        while (DySpaceship.value > -(Get.height * 0.4)) {
          await Future.delayed(Duration(milliseconds: 1));
          DySpaceship.value -= 0.8;
          // print('A:${DySpaceship.value}  B:${-(Get.height * 0.4)}');
        }
        print('end');
        // DySpaceship.value = 0.0;

        while (DySpaceship2.value < Get.height) {
          await Future.delayed(Duration(milliseconds: 1));
          DySpaceship2.value += 2;
        }
        animationflying.value = false;
        function();
      }
    } else {
      Get.find<Controllerother>().SnackBarDelay(context);
    }
  }

  //
  RxBool animationbackflying = false.obs;
  backflyflySpaceship() async {
    if (!animationflying.value && !animationbackflying.value) {
      animationbackflying.value = true;
      while (DySpaceship2.value > 0) {
        await Future.delayed(Duration(milliseconds: 1));
        DySpaceship2.value -= 2;
      }
      while (DySpaceship.value < 0) {
        await Future.delayed(Duration(milliseconds: 1));
        DySpaceship.value += 0.8;
      }
      animationbackflying.value = false;
      print('end');
    }
  }

  winking() async {
    for (var i = 0; i < 2; i++) {
      await Future.delayed(
        Duration(milliseconds: 170),
        () =>Remote.value = 'true',
      );
      await Future.delayed(
        Duration(milliseconds: 170),
        () => Remote.value = 'false',
      );
    }
  }
}

Map<String, String> MapStateDevCode = {
  'on': '11',
  'off': '10',
  'silent': '12',
  'halfon': '13',
};
