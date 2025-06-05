import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerHomePage.dart';
import 'package:lx/Page/Inquiry/Inquiry.dart';
import 'package:lx/Page/Relay/Relay.dart';
import 'package:lx/SendOrder.dart';
import 'package:lx/Stt/MainStt.dart';

import '../Page/Options/Options2.dart';

class Controllerstthomepage extends GetxController {
  ProcessText(BuildContext context) async {
    print('hi homepage');
    String val = Get.find<Controllerstt>().text.value;
    Get.find<Controllerstt>().text.value = '';
    for (var i = 0; i < PageOptions2.length; i++) {
      if (PageOptions2.keys.elementAt(i).contains(val)) {
        Get.to(PageOptions2.values.elementAt(i)['page']);
      }
    }
    if (val.contains('رله')) {
      Get.to(Relay());
    }
    if (val.contains('استعلام')) {
      Get.to(Inquiry());
    }
    /////////////////
    for (var i = 0; i < MapStateDev.length; i++) {
      if (MapStateDev.keys.elementAt(i).contains(val)) {
        String code = await Get.find<Controllerhomepage>()
            .ChangeStateDev(MapStateDev.values.elementAt(i));
        SendSms(context, code);
      }
    }
  }
}

Map<String, String> MapStateDev = {
  'نیمه فعال': 'halfon',
  'غیر فعال': 'off',
  'سایلنت': 'silent',
  'فعال': 'on',
};
