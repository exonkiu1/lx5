import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerRelay.dart';
import 'package:lx/SendOrder.dart';
import 'package:lx/WidgetUi/Appbar.dart';
import 'package:lx/WidgetUi/BackGroundView.dart';
import 'package:lx/WidgetUi/decoration.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class WidgetRelayOld extends StatelessWidget {
  const WidgetRelayOld({super.key, required this.i});
  final int i;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
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
                  onSelected: (value) {
                    switch (value) {
                      case 'ChangeName':
                        DialogTextFieldSms(context,
                            () => Get.find<Controllerrelay>().ChangeName(i),
                            description: 'نام رله');
                        break;
                      case 'ChangeTriger':
                        Get.find<Controllerrelay>().ChangeTriger(i, context);
                      default:
                    }
                  },
                  itemBuilder: (_) => <PopupMenuItem<String>>[
                        const PopupMenuItem(
                          value: 'ChangeName',
                          child: Text(
                            'تغییر نام رله',
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'ChangeTriger',
                          child: Text(
                            'تغییر زمان تریگر',
                          ),
                        ),
                      ]),
              Obx(() {
                return Text(
                    Get.find<Controllerrelay>().Name[i].value.toPersianDigit());
              }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Obx(() {
                  return Image.asset(
                    'assets/image/relay/${Get.find<Controllerrelay>().State[i].value}.png',
                    height: Get.height * 0.15,
                  );
                }),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () => SendOrder(
                        context,
                        () => Get.find<Controllerrelay>().ChangeState(
                              false,
                              i,
                            )),
                    child: Obx(() {
                      return Container(
                        width: Get.width * 0.3,
                        decoration: decoration(
                            color: !Get.find<Controllerrelay>().State[i].value),
                        child: Center(child: Obx(() {
                          return Text(
                            'غیرفعال',
                            style: TextStyle(
                                color:
                                    !Get.find<Controllerrelay>().State[i].value
                                        ? color2
                                        : null),
                          );
                        })),
                      );
                    }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () => SendOrder(
                        context,
                        () => Get.find<Controllerrelay>().Triger(
                              i,
                            )),
                    child: Container(
                      width: Get.width * 0.3,
                      decoration: decoration(),
                      child: const Center(child: Text('درب بازکن')),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () => SendOrder(
                        context,
                        () => Get.find<Controllerrelay>().ChangeState(
                              true,
                              i,
                            )),
                    child: Obx(() {
                      return Container(
                        width: Get.width * 0.3,
                        decoration: decoration(
                            color: Get.find<Controllerrelay>().State[i].value),
                        child: Center(child: Obx(() {
                          return Text(
                            'فعال',
                            style: TextStyle(
                                color:
                                    Get.find<Controllerrelay>().State[i].value
                                        ? color2
                                        : null),
                          );
                        })),
                      );
                    }),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
