import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Getx/ControllerInfo.dart';
import '/Page/AddDevice/AddDevice.dart';
import '/Page/Contact/Contact.dart';
import '/Page/PasswordDevice/PasswordDevice.dart';
import '/Page/Remote/Remote.dart';
import '/Page/SettingDev/SettingDevice.dart';
import '/Page/SettingSim/SettingSim.dart';
import '/Page/Zon/Zon.dart';
import '/WidgetUi/BackGroundView.dart';

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
};
