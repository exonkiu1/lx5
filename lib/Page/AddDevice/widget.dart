import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerDatabase.dart';

import '../../WidgetUi/decoration.dart';

class boxselectedsim extends StatelessWidget {
  const boxselectedsim({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: decoration(),
      child: Column(
        children: [
          Text('انتخاب سیمکارت برای ارسال دستورات'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WidgetSim(
                sim: 0,
              ),
              WidgetSim(
                sim: 1,
              ),
            ],
          ),
          WidgetSim(
            sim: -1,
            name: 'سیم پیش فرض موبایل',
          ),
          WidgetSim(
            sim: -2,
            name: 'ارسال از طریق پیامرسان',
          ),
        ],
      ),
    );
  }
}

class WidgetSim extends StatelessWidget {
  const WidgetSim({super.key, required this.sim, this.name = ''});
  final int sim;
  final String name;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.find<Controllerdatabase>().sim.value = sim;
      },
      child: Obx(() {
        return Container(
          width: sim >= 0 ? Get.width * 0.3 : Get.width * 0.5,
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.symmetric(vertical: 5),
          decoration: decoration(
              color: Get.find<Controllerdatabase>().sim.value == sim),
          child: Center(child: Text(sim >= 0 ? 'sim ${sim + 1}' : name)),
        );
      }),
    );
  }
}
