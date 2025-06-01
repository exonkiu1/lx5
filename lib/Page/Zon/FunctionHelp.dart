import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lx/WidgetUi/decoration.dart';

HelpModeZon(BuildContext context) {
  Get.bottomSheet(
    Container(
      width: Get.width,
      //height: Get.height * 0.4,
      decoration: decoration(color: true, colorBG: color2),
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
            style: TextStyle(color: const Color.fromARGB(255, 150, 23, 14)),
          ),
          SizedBox(width: 20),
          Expanded(child: Text(des, textDirection: TextDirection.rtl)),
        ],
      ),
    );
  }
}

Map<String, String> MapHelpModeZon = {
  'نرمال':
      'حالت معمول که با تحریک فعال میشود و تمام آلارم های بلندگو و پیامک و تلفن فعال میشود',
  'دینگ دانگ':
      'در صورت تحریک در زمان مسطح بودن فقط بلنگوی کوچک داخل پنل عمل میکند',
  '24 th':
      'بدون توجه به مسلح یا غیر مسلح بودن دستگاه فعال است و با تحریک زون آلارم ها عمل میکند',
  'گارد': 'در حالت مسلح در صورت تحریک آژیر ها 2 ثانیه آژیر میکشد',
};
