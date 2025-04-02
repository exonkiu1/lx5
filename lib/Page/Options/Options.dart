import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerInfo.dart';
import 'package:lx/Page/AddDevice/AddDevice.dart';
import 'package:lx/Page/Contact/Contact.dart';
import 'package:lx/Page/Help/Help.dart';
import 'package:lx/Page/PasswordDevice/PasswordDevice.dart';
import 'package:lx/Page/Remote/Remote.dart';
import 'package:lx/Page/SettingDev/SettingDevice.dart';
import 'package:lx/Page/SettingSim/SettingSim.dart';
import 'package:lx/Page/Zon/Zon.dart';
import 'package:lx/WidgetUi/BackGroundView.dart';

import 'SelectedDev.dart';

class Options extends StatefulWidget {
  const Options({super.key});

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SelectedDevLx(),
      extendBody: true,
      body: Backgroundview(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              PageOptions.length,
              (i) => WidpgetPageOption(
                    i: i,
                  )),
        ),
      )),
    );
  }
}

class WidpgetPageOption extends StatelessWidget {
  const WidpgetPageOption({super.key, required this.i});
  final int i;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(PageOptions.values.elementAt(i)['page']),
      child: Container(
        width: Get.width * 0.8,
        margin: EdgeInsets.symmetric(vertical: 13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
                'assets/image/options/${PageOptions.values.elementAt(i)['image']}.png'),
            Text(
              '${PageOptions.keys.elementAt(i)}',
            ),
          ],
        ),
      ),
    );
  }
}

Map<String, Map<String, dynamic>> PageOptions = {
  'افزودن دستگاه': {'image': 'add', 'page': Adddevice()},
  'مخاطبین': {'image': 'profile-circle', 'page': Contacts()},
  'زون ها': {'image': 'eye', 'page': Zon()},
  'ریموت ها': {'image': 'remote', 'page': Remote()},
  'تنظیمات دستگاه': {'image': 'setting-2-2', 'page': Settingdevice()},
  'تنظیم سیمکارت': {'image': 'simcard', 'page': Settingsim()},
  'پسورد دستگاه': {'image': 'lock', 'page': Passworddevice()},
  'راهنمایی': {'image': 'info-circle', 'page': Help()},
};
