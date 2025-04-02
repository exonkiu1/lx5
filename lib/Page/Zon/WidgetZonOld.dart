import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerOther.dart';
import 'package:lx/Getx/ControllerZon.dart';
import 'package:lx/SendOrder.dart';
import 'package:lx/WidgetUi/Appbar.dart';
import 'package:lx/WidgetUi/BackGroundView.dart';
import 'package:lx/WidgetUi/decoration.dart';

class WidgetZonOld extends StatelessWidget {
  const WidgetZonOld({super.key, required this.i});
  final int i;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.8,
      decoration: decoration(),
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PopupMenuButton(
                  iconColor: color1,
                  onSelected: (value) => DialogTextFieldSms(
                      context, () => Get.find<Controllerzon>().ChangeName(i),
                      description: 'نام زون'),
                  itemBuilder: (_) => <PopupMenuItem<String>>[
                        PopupMenuItem(
                            value: 'ChangeName', child: Text('تغییر نام زون'))
                      ]),
              Text(
                  '${i == 8 ? 'درب دستگاه' : i < 9 ? 'زون سیم دار' : 'زون بی سیم'}'),
              Obx(() {
                return Text(Get.find<Controllerzon>().Name[i].value);
              }),
            ],
          ),
          Obx(() {
            return DropdownButton(
                value: Get.find<Controllerzon>().Mode[i].value,
                dropdownColor: Colors.black,
                items: List.generate(ListModesZon.length,
                        (i) => ListModesZon.keys.elementAt(i))
                    .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem(
                              child: Text(
                                value,
                                style: TextStyle(color: color1),
                              ),
                              value: value,
                            ))
                    .toList(),
                onChanged: (value) => SendOrder(context,
                    () => Get.find<Controllerzon>().ChangeModeZon(value!, i)));
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: decoration(),
                child: Center(
                  child: Obx(() {
                    return Checkbox(
                        value: Get.find<Controllerzon>().State[i].value,
                        onChanged: (value) {
                          Get.find<Controllerzon>().State[i].value = value!;
                        });
                  }),
                ),
              ),
              Visibility(
                visible: i != 8,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: decoration(),
                  child: Center(
                    child: Obx(() {
                      return DropdownButton(
                        value: Get.find<Controllerzon>().Part[i].value == ''
                            ? null
                            : Get.find<Controllerzon>().Part[i].value,
                        dropdownColor: color2,
                        items: ['1', '2', '3', '4', '5', '6', '7']
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
                          Get.find<Controllerzon>().Part[i].value = value!;
                          //  Get.find<Controllerzon>().showpart.value = true;
                        },
                      );
                    }),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
