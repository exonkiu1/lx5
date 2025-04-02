import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerOther.dart';
import 'package:lx/Getx/ControllerRemote.dart';
import 'package:lx/SendOrder.dart';
import 'package:lx/WidgetUi/Appbar.dart';
import 'package:lx/WidgetUi/BackGroundView.dart';
import 'package:lx/WidgetUi/decoration.dart';

class WidgetRemoteOld extends StatelessWidget {
  const WidgetRemoteOld({super.key, required this.i});
  final int i;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      decoration: decoration(),
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: Get.width * 0.4,
            child: Row(
              children: [
                Container(
                  decoration: decoration(),
                  width: 35,
                  height: 35,
                  child: Center(child: Text('${i + 1}')),
                ),
                SizedBox(
                  width: 20,
                ),
                Obx(() {
                  return Text(Get.find<Controllerremote>().Name[i].value);
                }),
              ],
            ),
          ),
          Obx(() {
            return DropdownButton(
              value: Get.find<Controllerremote>().Part[i].value == ''
                  ? null
                  : Get.find<Controllerremote>().Part[i].value,
              dropdownColor: color2,
              items: ['1', '2', '3', '4']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem(
                  child: Text(
                    '${value}',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: value,
                );
              }).toList(),
              onChanged: (value) {
                Get.find<Controllerremote>().Part[i].value = value!;
              },
            );
          }),
          PopupMenuButton(
              iconColor: color1,
              onSelected: (value) {
                switch (value) {
                  case 'ChangeName':
                    DialogTextFieldSms(context,
                        () => Get.find<Controllerremote>().ChangeNameRemote(i),
                        description: 'نام ریموت');
                    break;
                  default:
                }
              },
              itemBuilder: (_) => <PopupMenuItem<String>>[
                    PopupMenuItem(
                        value: 'ChangeName', child: Text('تغییر نام ریموت'))
                  ]),
        ],
      ),
    );
  }
}
