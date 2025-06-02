import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Page/AddDevice/AddDevice2.dart';
import 'package:lx/Page/Help/aboutme.dart';
import 'package:lx/Page/Options/ControllerOptions.dart';
import 'package:lx/Page/Options/Options.dart';
import 'package:lx/Page/PasswordApp/PasswordApp.dart';
import 'package:lx/Page/Relay/Relay.dart';
import 'package:lx/Page/ReportSms/ReportSms.dart';
import 'package:lx/WidgetUi/BackGroundView.dart';
import 'package:lx/Page/AddDevice/AddDevice.dart';
import 'package:lx/Page/Contact/Contact.dart';
import 'package:lx/Page/Help/Help.dart';
import 'package:lx/Page/PasswordDevice/PasswordDevice.dart';
import 'package:lx/Page/Remote/Remote.dart';
import 'package:lx/Page/SettingDev/SettingDevice.dart';
import 'package:lx/Page/SettingSim/SettingSim.dart';
import 'package:lx/Page/Zon/Zon.dart';

import 'SelectedDev.dart';

class Options2 extends StatefulWidget {
  const Options2({super.key});

  @override
  State<Options2> createState() => _Options2State();
}

class _Options2State extends State<Options2> {
  @override
  void initState() {
    Get.find<Controlleroptions>().StartShowing();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    Get.find<Controlleroptions>().DisposeOpacity();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SelectedDevLx(),
      extendBody: true,
      body: Backgroundview(
          child: Center(
        child: Wrap(
          children: List.generate(
              PageOptions2.length,
              (i) => InkWell(
                  onTap: () => Get.to(PageOptions2.values.elementAt(i)['page']),
                  child: Obx(() {
                    return Opacity(
                      opacity:
                          Get.find<Controlleroptions>().OpacityOption[i].value,
                      child: Container(
                        width: Get.width * 0.3,
                        margin: EdgeInsets.symmetric(vertical: 15),
                        child: Center(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/image/options2/${PageOptions2.values.elementAt(i)['image']}.png',
                                width: Get.width * 0.2,
                              ),
                              Text(
                                '${PageOptions2.keys.elementAt(i)}',
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }))),
        ),
      )),
    );
  }
}

Map<String, Map<String, dynamic>> PageOptions2 = {
  'افزودن دستگاه': {'image': 'add', 'page': Adddevice2()},
  'مخاطبین': {'image': 'contact', 'page': Contacts()},
  'زون ها': {'image': 'zon', 'page': Zon()},
  'رله ها': {'image': 'relay', 'page': Relay()},
  'ریموت ها': {'image': 'rimote', 'page': Remote()},
  'تنظیمات دستگاه': {'image': 'setting', 'page': Settingdevice()},
  'تنظیم سیمکارت': {'image': 'simcard', 'page': Settingsim()},
  'پسورد دستگاه': {'image': 'pass', 'page': Passworddevice()},
  'امنیت ورود به دستگاه': {'image': 'password_app', 'page': Passwordapp()},

  'گزارش گیری': {'image': 'history', 'page': Reportsms()},
 // 'راهنمایی': {'image': 'help', 'page': Help()},
  'درباره ما': {'image': 'about_me', 'page': Aboutme()},
};
