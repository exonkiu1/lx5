import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lx/Stt/ControllerSttAddDevice.dart';
import 'package:lx/Stt/ControllerSttContact.dart';
import 'package:lx/Stt/ControllerSttHomePage.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

Stt(BuildContext context) async {
  stt.SpeechToText _speech = stt.SpeechToText();

  await _speech.initialize(
    onError: (errorNotification) {},
    onStatus: (status) {
      if (status == 'done' &&
          Get.find<Controllerstt>().text.value.length != 0) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 1),
          content: Row(
            children: [
              const Icon(
                Icons.support_agent,
                color: Colors.green,
              ),
              Text(Get.find<Controllerstt>().text.value),
            ],
          ),
        ));
        Get.find<Controllerstt>().ProcessText(context);
      }
    },
  );
  _speech.listen(
    onResult: (result) {
      Get.find<Controllerstt>().WaitingToHear.value = false;
      Get.find<Controllerstt>().Listening.value = true;
      Get.find<Controllerstt>().text.value = result.recognizedWords;
      print('Text: ${result.recognizedWords}');
    },
  );
}

class Controllerstt extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  RxString text = ''.obs;
  RxString type = ''.obs;
  RxString PlayORListen = ''.obs;
  RxBool Playing = false.obs;
  RxBool Listening = false.obs;
  RxBool WaitingToHear = false.obs;
  ProcessText(BuildContext context) {
    switch (type.value) {
      case 'AddDevice':
        Get.find<Controllersttadddevice>().ProcessText(context);
        break;
      case 'Contact':
        Get.find<Controllersttcontact>().ProcessText(context);
        break;
      case 'HomePage':
        Get.find<Controllerstthomepage>().ProcessText(context);
        break;
      default:
    }
  }
}
