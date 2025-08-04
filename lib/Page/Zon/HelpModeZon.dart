import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lx/WidgetUi/decoration.dart';

HelpModeZon(BuildContext context) {
  Get.bottomSheet(
    Container(
      width: Get.width,
      height: Get.height * 0.7,
      decoration:
          decoration(color: true, colorBG: const Color.fromARGB(150, 0, 0, 0)),
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
      'با تحریک سنسور بازر برد دو بوق میکشد و هم زمان رله را یک عمل میکند',
  '24 th': 'با تحریک زون در هر حالت فعال و غیرفعال دستگاه آلارم میکشد',
  'گارد': 'در صورت تحریک فقط آلارم 2 ثانیه عمل میکند',
  'جاسوسی': 'در صورت تحریک فقط پیام و تماس میگیرد',
  'آبی': 'اگر سنسور چند ساعت تحریک نشود و دستگاه خودکار فعالم میشود',
  '24th جاسوسی':
      'با تحریک زون در هر حالت فعال و غیرفعال فقط پیام و تماس میگیرد',
  'غیرفعالسازی زون':
      ' در صورت خرابی سنسور یا سیم کشی زون از مدار خارج میشود ودر ضمن برای فعالسازی مجدد زون روی نرمال کلوز گذاشته شود',
};
