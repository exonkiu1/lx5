import 'package:flutter/material.dart';
import 'package:lx/Getx/ControllerPassRemote.dart';
import 'package:lx/Getx/controllerWarenty.dart';
import 'package:lx/SendOrder.dart';
import 'package:lx/WidgetUi/Appbar.dart';
import 'package:lx/WidgetUi/BackGroundView.dart';
import 'package:get/get.dart';
import 'package:lx/WidgetUi/decoration.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class Passwordremote extends StatelessWidget {
  const Passwordremote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'کد گذاری ریموت'),
      body: Backgroundview(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ThisPass(),
          editpass(),
          RemotePass(),
        ],
      )),
    );
  }
}

class editpass extends StatelessWidget {
  const editpass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Visibility(
        visible:
            Get.find<Controllerpassremote>().edit_PasswordRemote.value.length !=
                0,
        child: Container(
          decoration: decoration(),
          width: Get.width * 0.8,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(
                      Get.find<Controllerpassremote>()
                          .edit_PasswordRemote
                          .value
                          .length,
                      (int i) => Align(
                            alignment: Alignment.centerRight,
                            child: Obx(() {
                              return Text(
                                '${i + 1}:  ${MapPassRemote[Get.find<Controllerpassremote>().edit_PasswordRemote.value[i]]}'
                                    .toPersianDigit(),
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.right,
                              );
                            }),
                          )),
                );
              }),
              Align(
                alignment: Alignment.centerLeft,
                child: Obx(() {
                  return Visibility(
                      visible: Get.find<Controllerpassremote>()
                              .edit_PasswordRemote
                              .value
                              .length >
                          0,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                            onTap: () {
                              Get.find<Controllerpassremote>()
                                      .edit_PasswordRemote
                                      .value =
                                  Get.find<Controllerpassremote>()
                                      .edit_PasswordRemote
                                      .value
                                      .substring(
                                          0,
                                          Get.find<Controllerpassremote>()
                                                  .edit_PasswordRemote
                                                  .value
                                                  .length -
                                              1);
                            },
                            child: Icon(Icons.close, color: color1)),
                      ));
                }),
              ),
              Obx(() {
                return Visibility(
                    visible: Get.find<Controllerpassremote>()
                            .edit_PasswordRemote
                            .value
                            .length ==
                        4,
                    child: InkWell(
                      onTap: () => SendOrder(
                          context,
                          () => Get.find<Controllerpassremote>()
                              .ChangePassWordRemote()),
                      child: Container(
                        width: Get.width * 0.3,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: decoration(color: true),
                        child: Center(
                          child: Text('ثبت'),
                        ),
                      ),
                    ));
              })
            ],
          ),
        ),
      );
    });
  }
}

class ThisPass extends StatelessWidget {
  const ThisPass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration(),
      width: Get.width * 0.8,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'پسورد فعلی :',
            style: TextStyle(color: color2),
          ),
          Obx(() {
            return Visibility(
              visible: Get.find<Controllerpassremote>()
                      .PasswordRemote
                      .value
                      .length ==
                  4,
              replacement: Text('هنوز کد گذاری روی ریموت انجام نشده'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(
                    4,
                    (int i) => Align(
                          alignment: Alignment.centerRight,
                          child: Obx(() {
                            return Text(
                              '${i + 1}: ${MapPassRemote[Get.find<Controllerpassremote>().PasswordRemote.value[i]]}'
                                  .toPersianDigit(),
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,
                            );
                          }),
                        )),
              ),
            );
          }),
          Obx(() {
            return Visibility(
                visible: Get.find<Controllerwarrenty>()
                    .ModelPro
                    .value
                    .contains('MAX'),
                child: Obx(() {
                  return DropdownButton(
                      value: Get.find<Controllerpassremote>().Index.value,
                      items: List.generate(30, (i) => i)
                          .map<DropdownMenuItem<int>>(
                              (value) => DropdownMenuItem(
                                    child: Text('ریموت ${value}'),
                                    value: value,
                                  ))
                          .toList(),
                      onChanged: (value) => Get.find<Controllerpassremote>()
                          .ChangeRemote(value!));
                }));
          })
        ],
      ),
    );
  }
}

class RemotePass extends StatelessWidget {
  const RemotePass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height * 0.4,
        width: Get.width * 0.58,
        decoration: const BoxDecoration(
            // color: Colors.red,
            image: DecorationImage(
          image: AssetImage('assets/image/homepage/passremote.png'),
        )),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.03,
            ),
            Container(
              width: Get.width * 0.4,
              height: Get.height * 0.05,
              //  color: Colors.red.withOpacity(0.3),
              child: Row(
                children: [
                  Flexible(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          if (Get.find<Controllerpassremote>()
                                  .edit_PasswordRemote
                                  .value
                                  .length <=
                              3) {
                            Get.find<Controllerpassremote>()
                                .edit_PasswordRemote
                                .value += MapPassRemote2['on']!;
                          }
                        },
                        child: Container(
                            //  color: Colors.green.withOpacity(0.3),
                            ),
                      )),
                  Flexible(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          if (Get.find<Controllerpassremote>()
                                  .edit_PasswordRemote
                                  .value
                                  .length <=
                              3) {
                            Get.find<Controllerpassremote>()
                                .edit_PasswordRemote
                                .value += MapPassRemote2['silent']!;
                          }
                        },
                        child: Container(
                            //  color: Colors.blue.withOpacity(0.3),
                            ),
                      )),
                  Flexible(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          if (Get.find<Controllerpassremote>()
                                  .edit_PasswordRemote
                                  .value
                                  .length <=
                              3) {
                            Get.find<Controllerpassremote>()
                                .edit_PasswordRemote
                                .value += MapPassRemote2['off']!;
                          }
                        },
                        child: Container(
                            //  color: Colors.black.withOpacity(0.3),
                            ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: Get.width * 0.4,
              height: Get.height * 0.05,
              child: Row(
                children: [
                  Flexible(
                      flex: 1,
                      child: Container(
                          //  color: Colors.green.withOpacity(0.3),
                          )),
                  Flexible(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          if (Get.find<Controllerpassremote>()
                                  .edit_PasswordRemote
                                  .value
                                  .length <=
                              3) {
                            Get.find<Controllerpassremote>()
                                .edit_PasswordRemote
                                .value += MapPassRemote2['relay']!;
                          }
                        },
                        child: Container(
                            //  color: Colors.green.withOpacity(0.3),
                            ),
                      )),
                  Flexible(
                      flex: 1,
                      child: Container(
                          //  color: Colors.green.withOpacity(0.3),
                          )),
                ],
              ),
            )
          ],
        ));
  }
}
