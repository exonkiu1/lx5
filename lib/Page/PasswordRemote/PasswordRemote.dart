import 'package:flutter/material.dart';
import 'package:lx/Getx/ControllerPassRemote.dart';
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
        //  ThisPass(),
        //  editpass(),
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
    return Container(
      decoration: decoration(),
      width: Get.width * 0.8,
      child: Column(
        children: [
          Obx(() {
            return Column(
              children: List.generate(
                  Get.find<Controllerpassremote>()
                      .edit_PasswordRemote
                      .value
                      .length,
                  (int i) => Obx(() {
                        return Text(
                          '1: ${MapPassRemote[Get.find<Controllerpassremote>().edit_PasswordRemote.value[i]]}'
                              .toPersianDigit(),
                          textDirection: TextDirection.rtl,
                        );
                      })),
            );
          }),
          Obx(() {
            return Visibility(
                visible: Get.find<Controllerpassremote>()
                        .edit_PasswordRemote
                        .value
                        .length >
                    0,
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
                    child: Icon(Icons.close)));
          }),
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
                    decoration: decoration(),
                    child: Center(
                      child: Text('ثبت'),
                    ),
                  ),
                ));
          })
        ],
      ),
    );
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('پسورد فعلی :'),
          Obx(() {
            return Visibility(
              visible: Get.find<Controllerpassremote>()
                      .PasswordRemote
                      .value
                      .length ==
                  4,
              replacement: Text('هنوز کد گزاری روی ریموت انجام نشده'),
              child: Column(
                children: List.generate(
                    4,
                    (int i) => Obx(() {
                          return Text(
                            '1: ${MapPassRemote[Get.find<Controllerpassremote>().PasswordRemote.value[i]]}'
                                .toPersianDigit(),
                            textDirection: TextDirection.rtl,
                          );
                        })),
              ),
            );
          }),
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
          image: AssetImage('assets/image/homepage/passwordremote.png'),
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
