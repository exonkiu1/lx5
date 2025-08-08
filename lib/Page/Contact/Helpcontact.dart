import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lx/WidgetUi/decoration.dart';

HelpLevelContact(BuildContext context) {
  Get.bottomSheet(
    Container(
      width: Get.width,
      decoration:
          decoration(color: true, colorBG: const Color.fromARGB(150, 0, 0, 0)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('راهنمای سطح دسترسی مخاطبین'),
            ),
            Column(
              children: List.generate(
                MapHelpModeContact.length,
                (i) => widgetModeContact(
                  des: MapHelpModeContact.values.elementAt(i),
                  level: MapHelpModeContact.keys.elementAt(i),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class widgetModeContact extends StatelessWidget {
  const widgetModeContact({super.key, required this.des, required this.level});
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
            style: TextStyle(color: const Color.fromARGB(255, 234, 8, 8)),
          ),
          SizedBox(width: 20),
          Expanded(child: Text(des, textDirection: TextDirection.rtl)),
        ],
      ),
    );
  }
}

Map<String, String> MapHelpModeContact = {
  "تماس برق": "(برق قطع شود با مخاطب تماس میگیره)",
  "تماس": "(دستگاه عمل کند با مخاطب تماس میگیرد)",
  "پیامک": "(دستگاه عمل کند به مخاطب پیام تحریک زون و اخطار میدهد)",
  "گزارش گیری": "(به مخاطب تمام گزارش های دستگاه پیام میشود )",
  "مدیر ": "(دسترسی کامل به تمام تنظیمات دستگاه)",
  "کاربر": "(فقط دسترسی فعال و غیر فعال سازی دستگاه و رله ها )",
};
