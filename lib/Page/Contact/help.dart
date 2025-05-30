import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lx/WidgetUi/decoration.dart';

HelpContact(BuildContext context) {
  Get.bottomSheet(
    Container(
      width: Get.width,
      height: Get.height * 0.4,
      decoration: decoration(color: true, colorBG: color2),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('راهنمای سطح دسترسی مخاطبین'),
          ),
          Column(
            children: List.generate(
              HelpLevelContact.length,
              (i) => widgehelpcontact(
                des: HelpLevelContact.values.elementAt(i),
                level: HelpLevelContact.keys.elementAt(i),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class widgehelpcontact extends StatelessWidget {
  const widgehelpcontact({super.key, required this.des, required this.level});
  final String level, des;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: decoration(),
      child: Row(
        children: [
          Text(
            level,
            style: TextStyle(color: const Color.fromARGB(255, 150, 23, 14)),
          ),
          SizedBox(width: 20),
          Expanded(child: Text(des, textDirection: TextDirection.rtl)),
        ],
      ),
    );
  }
}

Map<String, String> HelpLevelContact = {
  'D': 'تماس و پیامک',
  'C': 'تماس و پیامک + فعال و غیر فعال کردن دستگاه',
  'B': 'تماس و پیامک + فعال و غیر فعال کردت دستگاه + گزارش ها',
  'A':
      'تماس و پیامک + فعال و غیر فعال کردن دستگاه + گزارش ها + دسترسی به تنظیمات',
};
