import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lx/WidgetUi/decoration.dart';

HelpModeZon(BuildContext context) {
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
              child: Text('راهنمای حالت های زون'),
            ),
            Column(
              children: List.generate(
                MapHelpModeZon.length,
                (i) => widgetModeZon(
                  des: MapHelpModeZon.values.elementAt(i),
                  level: MapHelpModeZon.keys.elementAt(i),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class widgetModeZon extends StatelessWidget {
  const widgetModeZon({super.key, required this.des, required this.level});
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

Map<String, String> MapHelpModeZon = {
  'نرمال': 'نسبت به خروجی سنسور تنظیم شود',
  'دینگ دانگ':
      'وقتی دستگاه غیر فعال باشد با هر بار تحریک زون بازر برد دو بوق می‌کشد و هم زمان رله یک دو ثانیه عمل میکند',
  '24 th':
      'در هر دو حالت فعال و غیر فعال بودن دستگاه با تحریک زون دستگاه عمل میکند.',
  'گارد':
      'وقتی دستگاه فعال باشد در صورت تحریک زون  فقط 2 ثانیه آلارم میکشد (فضای باز )',
  'جاسوسی': 'وقتی دستگاه فعال باشد در صورت تحریک فقط پیامک و تماس میگیرد ',
  'آبی': 'چنانچه سنسور سه ساعت تحریک نشود دستگاه خود به خود فعال میشود',
  '24th جاسوسی':
      'در هر دو حالت فعال و غیر فعال بودن دستگاه با تحریک زون فقط پیامک و تماس میگیرد.',
  'غیرفعالسازی زون':
      ' در صورت خرابی سنسور یا سیم کشی زون از مدار خارج میشود ودر ضمن برای فعالسازی مجدد زون روی نرمال کلوز گذاشته شود',
};
