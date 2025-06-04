import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerHomePage.dart';
import 'package:lx/Page/Inquiry/Inquiry.dart';
import 'package:lx/Page/Relay/Relay.dart';
import 'package:lx/Page/ReportSms/ReportSms.dart';
import 'package:lx/SendOrder.dart';
import '/Getx/ControllerInfo.dart';
import '/Page/AddDevice/AddDevice.dart';
import '/Page/Contact/Contact.dart';
import '/Page/Help/Help.dart';
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
          child: Wrap(
            children: List.generate(
              PageOptions.length,
              (i) => WidpgetPageOption(i: i),
            )..add(
              InkWell(
                onTap: () => SendOrder(
                        context, () => Get.find<Controllerhomepage>().Hearing(),
                        description:
                            'با فرستاد دستور شنود دستگاه با شما تماس خواهد گرفت'),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: Get.width * 0.3,
                      height: Get.width * 0.3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/image/box/red.png'),
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/image/options/listen.png',
                          height: Get.width * 0.1,
                        ),
                      ),
                    ),
                    Text('شنود'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: Get.width * 0.3,
            height: Get.width * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/box/red.png'),
              ),
            ),
            child: Center(
              child: Image.asset(
                'assets/image/options/${PageOptions.values.elementAt(i)['image']}.png',
                height: Get.width * 0.1,
              ),
            ),
          ),
          Text('${PageOptions.keys.elementAt(i)}'),
        ],
      ),
    );
  }
}

Map<String, Map<String, dynamic>> PageOptions = {
  'افزودن دستگاه': {'image': 'add', 'page': Adddevice()},
  'مخاطبین': {'image': 'contact', 'page': Contacts()},
  'زون ها': {'image': 'zon', 'page': Zon()},
  'رله ها': {'image': 'relay', 'page': Relay()},
  'استعلام دستگاه': {'image': 'inquiry', 'page': Inquiry()},
  'ریموت': {'image': 'remote', 'page': Remote()},
  'تنظیمات دستگاه': {'image': 'setting', 'page': Settingdevice()},
  'تنظیم سیمکارت': {'image': 'simcard', 'page': Settingsim()},
  'پسورد دستگاه': {'image': 'pass', 'page': Passworddevice()},
  'گزارش گیری': {'image': 'history', 'page': Reportsms()},
  'گارانتی': {'image': 'warranty', 'page': Help()},
  // 'راهنمایی': {'image': 'help', 'page': Help()},
};
