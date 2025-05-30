import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerOther.dart';
import 'package:lx/Getx/ControllerZon.dart';
import 'package:lx/Page/Zon/clippathboxzon.dart';
import 'package:lx/SendOrder.dart';
import 'package:lx/WidgetUi/Appbar.dart';
import 'package:lx/WidgetUi/BackGroundView.dart';
import 'package:lx/WidgetUi/decoration.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class Zon extends StatelessWidget {
  const Zon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'زون ها'),
      extendBody: true,
      bottomNavigationBar: Obx(() {
        return Visibility(
          visible: Get.find<Controllerzon>().showhalfon.value,
          child: InkWell(
            onTap:
                () => SendOrder(
                  context,
                  () => Get.find<Controllerzon>().ChangeState(),
                ),
            child: Container(
              width: Get.width * 0.3,
              margin: EdgeInsets.symmetric(
                horizontal: Get.width * 0.1,
                vertical: 20,
              ),
              height: Get.height * 0.05,
              decoration: decoration(color: true),
              child: Center(child: Text('ثبت نیم فعالسازی ')),
            ),
          ),
        );
      }),
      body: Backgroundview(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Obx(() {
                          return Visibility(
                            visible:
                                Get.find<Controllerother>().TypeInquiry.value !=
                                'ModeZon',
                            replacement: SizedBox(
                              child: CircularProgressIndicator(),
                            ),
                            child: InkWell(
                              onTap:
                                  () => SendInquiry(
                                    context,
                                    () =>
                                        Get.find<Controllerzon>().InquiryMode(),
                                    code: '92',
                                    controller: '',
                                    type: 'ModeZon',
                                  ),
                              child: Container(
                                width: Get.width * 0.4,
                                decoration: decoration(),
                                padding: EdgeInsets.all(8),
                                child: Center(child: Text('استعلام زون ها')),
                              ),
                            ),
                          );
                        }),
                        Obx(() {
                          return Visibility(
                            visible:
                                Get.find<Controllerother>().TypeInquiry.value !=
                                'HalfZon',
                            replacement: CircularProgressIndicator(),
                            child: InkWell(
                              onTap:
                                  () => SendInquiry(
                                    context,
                                    () =>
                                        Get.find<Controllerzon>()
                                            .InquiryState(),
                                    code: 'LUXSSE',
                                    controller: '#',
                                    type: 'HalfZon',
                                  ),
                              child: Container(
                                width: Get.width * 0.4,
                                decoration: decoration(),
                                padding: EdgeInsets.all(8),
                                child: Center(
                                  child: Text('استعلام نیم فعالسازی'),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              ),
              Column(children: List.generate(16, (i) => WidgetZon(i: i))..add(SizedBox(height: 100,))),
              /* Align(
                child: InkWell(
                  onTap: () => SendOrder(
                    context,
                    () => Get.find<Controllerzon>().DeleteAllZonWirles(),
                  ),
                  child: Obx(() {
                    return Container(
                      width: Get.width * 0.4,
                      decoration: decoration(
                          color: Get.find<Controllerzon>().showpart.value),
                      padding: EdgeInsets.all(8),
                      child: Center(
                        child: Text('حذف زون های بیسیم'),
                      ),
                    );
                  }),
                ),
              ), */
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetZon extends StatelessWidget {
  const WidgetZon({super.key, required this.i});
  final int i;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        // height: Get.height * 0.19,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: Get.width * 0.8,
            // height: Get.height * 0.,
            decoration: decoration(),
            // padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        decoration: decoration(),
                        child: Center(child: Text('${i + 1}')),
                      ),
                      Container(
                        width: Get.width * 0.4,

                        padding: EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap:
                                  () => DialogTextFieldSms(
                                    context,
                                    () =>
                                        Get.find<Controllerzon>().ChangeName(i),
                                    description: 'نام زون',
                                  ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Icon(Icons.edit, color: color1),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Obx(() {
                                return Text(
                                  Get.find<Controllerzon>().Name[i].value
                                      .toPersianDigit(),
                                  style: TextStyle(color: Colors.black),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/image/zon/zon ${i < 6 ? 'w' : 'wl'}1.png',
                        height: 50,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: Get.width * 0.4,
                      decoration: decoration(),
                      child: Obx(() {
                        return DropdownButton(
                          value: Get.find<Controllerzon>().Mode[i].value,
                          isDense: true,
                          iconEnabledColor: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          dropdownColor: Colors.white,
                          underline: Container(),
                          items:
                              List.generate(
                                    ListModesZon.length,
                                    (i) => ListModesZon.keys.elementAt(i),
                                  )
                                  .map<DropdownMenuItem<String>>(
                                    (String value) => DropdownMenuItem(
                                      value: value,
                                      child: Align(
                                        child: Text(
                                          value,
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                          onChanged:
                              (value) => SendOrder(
                                context,
                                () => Get.find<Controllerzon>().ChangeModeZon(
                                  value!,
                                  i,
                                ),
                              ),
                        );
                      }),
                    ),
                    Center(
                      child: Obx(() {
                        return Checkbox(
                           shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              side: BorderSide(color: color1),
                              checkColor: color2,
                          value: Get.find<Controllerzon>().State[i].value,
                          onChanged: (value) {
                            Get.find<Controllerzon>().State[i].value = value!;
                            Get.find<Controllerzon>().showhalfon.value = true;
                          },
                        );
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
