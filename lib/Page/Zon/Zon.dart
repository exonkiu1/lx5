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
      appBar: appBar(
        title:
            'زون ها', /* actions: [
        IconButton(
            onPressed: () => SendOrder(
                context, () => Get.find<Controllerzon>().DeleteAllZonWirles(),
                description: 'از حذف زون های بیسیم مطمعن هستید؟'),
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ))
      ] */
      ),
      extendBody: true,
      bottomNavigationBar: Obx(() {
        return Visibility(
          visible: Get.find<Controllerzon>().showhalfon.value,
          child: InkWell(
            onTap: () => SendOrder(
                context, () => Get.find<Controllerzon>().ChangeState()),
            child: Container(
              width: Get.width * 0.3,
              margin: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.1, vertical: 20),
              height: Get.height * 0.05,
              decoration: decoration(color: true),
              child: Center(
                child: Text('ثبت نیم فعالسازی '),
              ),
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
                        InkWell(
                          onTap: () => SendOrder(
                            context,
                            () => Get.find<Controllerzon>().ChangePart(),
                          ),
                          child: Obx(() {
                            return Container(
                              width: Get.width * 0.4,
                              decoration: decoration(
                                  color:
                                      Get.find<Controllerzon>().showpart.value),
                              padding: EdgeInsets.all(8),
                              child: Center(
                                child: Text('ثبت  پارتیشن'),
                              ),
                            );
                          }),
                        ),
                        Obx(() {
                          return Visibility(
                            visible:
                                Get.find<Controllerother>().TypeInquiry.value !=
                                    'PartZon',
                            replacement: CircularProgressIndicator(),
                            child: InkWell(
                              onTap: () => SendInquiry(context,
                                  () => Get.find<Controllerzon>().InquiryPart(),
                                  code: 'LUXSSE',
                                  controller: '#',
                                  type: 'PartZon'),
                              child: Container(
                                width: Get.width * 0.4,
                                decoration: decoration(),
                                padding: EdgeInsets.all(8),
                                child: Center(
                                  child: Text('استعلام پارتیشن'),
                                ),
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Obx(() {
                          return Visibility(
                            visible:
                                Get.find<Controllerother>().TypeInquiry.value !=
                                    'ModeZon',
                            replacement:
                                SizedBox(child: CircularProgressIndicator()),
                            child: InkWell(
                              onTap: () => SendInquiry(context,
                                  () => Get.find<Controllerzon>().InquiryMode(),
                                  code: '92', controller: '', type: 'ModeZon'),
                              child: Container(
                                width: Get.width * 0.4,
                                decoration: decoration(),
                                padding: EdgeInsets.all(8),
                                child: Center(
                                  child: Text('استعلام زون ها'),
                                ),
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
                              onTap: () => SendInquiry(
                                  context,
                                  () =>
                                      Get.find<Controllerzon>().InquiryState(),
                                  code: 'LUXSSE',
                                  controller: '#',
                                  type: 'HalfZon'),
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
                    )
                  ],
                ),
              ),
              Column(
                children: List.generate(
                    18,
                    (i) => WidgetZon(
                          i: i,
                        )),
              ),
              Align(
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
              ),
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
        height: Get.height * 0.19,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: Get.width * 0.85,
                height: Get.height * 0.05,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Color.fromARGB(18, 30, 4, 3),
                      Color.fromARGB(253, 58, 6, 2),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Transform.translate(
                  offset: Offset(0, 7),
                  child: Obx(() {
                    return Checkbox(
                        value: Get.find<Controllerzon>().State[i].value,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        side: BorderSide(color: Colors.white),
                        checkColor: Colors.white,
                        activeColor: Colors.black,
                        onChanged: (value) {
                          Get.find<Controllerzon>().State[i].value = value!;
                          Get.find<Controllerzon>().showhalfon.value = true;
                        });
                  }),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: ClipPath(
                clipper: boxwidgetzon(),
                child: Container(
                  width: Get.width * 0.8,
                  // height: Get.height * 0.,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(188, 71, 2, 3),
                        Color.fromARGB(190, 1, 41, 61),
                      ]),
                      color: Color.fromARGB(255, 6, 58, 84),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  // padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: decoration(),
                              child: Center(
                                child: Text('${i + 1}'),
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/image/zon/zon ${i == 8 ? 'd' : i < 9 ? 'w' : 'wl'}.png',
                            height: 50,
                          ),
                          Container(
                            width: Get.width * 0.4,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                gradient: LinearGradient(colors: [
                                  Color.fromARGB(255, 6, 58, 84),
                                  Colors.white,
                                ])),
                            padding: EdgeInsets.only(right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                    onTap: () => DialogTextFieldSms(
                                        context,
                                        () => Get.find<Controllerzon>()
                                            .ChangeName(i),
                                        description: 'نام زون'),
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
                                      Get.find<Controllerzon>()
                                          .Name[i]
                                          .value
                                          .toPersianDigit(),
                                      style: TextStyle(color: Colors.black),
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: Get.width * 0.4,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              gradient: LinearGradient(colors: [
                                Colors.white,
                                Color.fromARGB(255, 6, 58, 84),
                              ])),
                          child: Obx(() {
                            return DropdownButton(
                                value: Get.find<Controllerzon>().Mode[i].value,
                                isDense: true,
                                iconEnabledColor: Colors.white,
                                dropdownColor: Colors.white,
                                underline: Container(),
                                items: List.generate(ListModesZon.length,
                                        (i) => ListModesZon.keys.elementAt(i))
                                    .map<DropdownMenuItem<String>>(
                                        (String value) => DropdownMenuItem(
                                              value: value,
                                              child: Align(
                                                child: Text(
                                                  value,
                                                  textAlign: TextAlign.center,
                                                  textDirection:
                                                      TextDirection.rtl,
                                                ),
                                              ),
                                            ))
                                    .toList(),
                                onChanged: (value) => SendOrder(
                                    context,
                                    () => Get.find<Controllerzon>()
                                        .ChangeModeZon(value!, i)));
                          }),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            7,
                            (c) => InkWell(
                                  onTap: () {
                                    Get.find<Controllerzon>().Part[i].value =
                                        '${c + 1}';
                                    Get.find<Controllerzon>().showpart.value =
                                        true;
                                  },
                                  child: Obx(() {
                                    return Container(
                                      width: 20,
                                      height: 20,
                                      decoration: decoration(
                                          color: Get.find<Controllerzon>()
                                                  .Part[i]
                                                  .value ==
                                              '${c + 1}'),
                                      child: Center(
                                        child: Text('${c + 1}'),
                                      ),
                                    );
                                  }),
                                )),
                      ),
                      SizedBox(
                        height: Get.height * 0.04,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
