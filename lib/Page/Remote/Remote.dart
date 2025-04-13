import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerOther.dart';
import 'package:lx/Getx/ControllerRemote.dart';
import 'package:lx/Page/Remote/clippathwidgetremote.dart';
import 'package:lx/SendOrder.dart';
import 'package:lx/WidgetUi/Appbar.dart';
import 'package:lx/WidgetUi/BackGroundView.dart';
import 'package:lx/WidgetUi/decoration.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class Remote extends StatelessWidget {
  const Remote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'ریموت ها'),
      body: Backgroundview(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => SendOrder(
                      context, () => Get.find<Controllerremote>().ChangePart()),
                  child: Obx(() {
                    return Container(
                      width: Get.width * 0.4,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.all(8),
                      decoration: decoration(
                          color: Get.find<Controllerremote>().showpart.value),
                      child: Center(
                        child: Text('ثبت پارتیشن ها'),
                      ),
                    );
                  }),
                ),
                Obx(() {
                  return Visibility(
                    visible: Get.find<Controllerother>().TypeInquiry.value !=
                        'RemotePart',
                    replacement: CircularProgressIndicator(),
                    child: InkWell(
                      onTap: () => SendInquiry(
                          context, () => Get.find<Controllerremote>().Inquiry(),
                          code: 'LUXSTE', type: 'RemotePart'),
                      child: Container(
                        width: Get.width * 0.4,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.all(8),
                        decoration: decoration(),
                        child: Center(
                          child: Text('استعلام پارتیشن ها'),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
            Wrap(
              children: List.generate(
                  30,
                  (i) => WidgetRemote(
                        i: i,
                      )),
            ),
          ],
        ),
      )),
    );
  }
}

class WidgetRemote extends StatelessWidget {
  const WidgetRemote({super.key, required this.i});
  final int i;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.44,
      // height: Get.width * 0.4,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.only(bottom: 9),
      decoration:
          decoration(color: true, colorBG: Color.fromARGB(36, 255, 82, 166)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipPath(
                clipper: Clippathwidgetremote(),
                child: Container(
                  width: Get.width * 0.1,
                  height: Get.width * 0.2,
                  decoration: decoration(color: true, border: false),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Obx(() {
                        return DropdownButton(
                          value:
                              Get.find<Controllerremote>().Part[i].value == ''
                                  ? null
                                  : Get.find<Controllerremote>().Part[i].value,
                          dropdownColor: const Color.fromARGB(255, 194, 60, 20),
                          iconEnabledColor: Colors.white,
                          underline: Container(),
                          isDense: true,
                          items: List.generate(8, (i) => '${i + 1}')
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
                            Get.find<Controllerremote>().showpart.value = true;
                          },
                        );
                      }),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    margin: EdgeInsets.only(top: 5, right: 5),
                    decoration: decoration(color: true),
                    child: Center(child: Text('${i}')),
                  ),
                  SizedBox(
                    height: Get.width * 0.05,
                  ),
                  widgetNameRemote(i: i),
                ],
              ),
            ],
          ),
          WidgetDeleteRemote(i: i),
        ],
      ),
    );
  }
}

class WidgetDeleteRemote extends StatelessWidget {
  const WidgetDeleteRemote({
    super.key,
    required this.i,
  });

  final int i;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SendOrder(
          context, () => Get.find<Controllerremote>().DeleteRemote(i)),
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }
}

class widgetNameRemote extends StatelessWidget {
  const widgetNameRemote({
    super.key,
    required this.i,
  });

  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.3,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 84, 6, 6),
            Colors.white,
          ])),
      padding: EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: () => DialogTextFieldSms(context,
                  () => Get.find<Controllerremote>().ChangeNameRemote(i),
                  description: 'نام ریموت'),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              )),
          Align(
            alignment: Alignment.centerRight,
            child: Obx(() {
              return Text(
                Get.find<Controllerremote>().Name[i].value.toPersianDigit(),
                style: TextStyle(color: Colors.black),
              );
            }),
          ),
        ],
      ),
    );
  }
}
