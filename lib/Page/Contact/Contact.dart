import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerContact.dart';
import 'package:lx/Getx/ControllerOther.dart';
import 'package:lx/SendOrder.dart';
import 'package:lx/WidgetUi/Appbar.dart';
import 'package:lx/WidgetUi/BackGroundView.dart';
import 'package:lx/WidgetUi/decoration.dart';
import 'package:lx/WidgetUi/decoration_textfield.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: 'مخاطبین',
      ),
      
      body: Backgroundview(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(() {
                    return Visibility(
                      visible: Get.find<Controllerother>().TypeInquiry.value !=
                          'Contact',
                      replacement: const CircularProgressIndicator(),
                      child: InkWell(
                        onTap: () => SendInquiry(
                            context,
                            () =>
                                Get.find<Controllercontact>().InquiryContact(),
                            code: '91',
                            controller: '*',
                            type: 'Contact'),
                        child: Container(
                          width: Get.width * 0.3,
                          decoration: decoration(),
                          padding: const EdgeInsets.all(8),
                          child: const Center(
                            child: Text('استعلام مخاطبین'),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
             Column(
                  children: List.generate(10, (i) => WidgetContact(i: i)))
            
          ],
        ),
      )),
    );
  }
}

class WidgetContact extends StatelessWidget {
  const WidgetContact({super.key, required this.i});
  final int i;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width*0.8,
        
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration:decoration(),
        margin: const EdgeInsets.symmetric(vertical: 5),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () => Get.find<Controllercontact>()
                            .SelectContact(i),
                        child:  Icon(
                          Icons.account_circle,
                          color: color1,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () => SendOrder(
                            context,
                            () => Get.find<Controllercontact>()
                                .DeleteContact(i)),
                        child:  Icon(
                          Icons.delete,
                          color: color1,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: Get.width * 0.5,
                        child: TextField(
                          controller:
                              Get.find<Controllercontact>().TfName[i],
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            hintText: 'نام مخاطب',
                            hintTextDirection: TextDirection.rtl,
                            isDense: true,
                          ),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.5,
                        child: TextField(
                          controller:
                              Get.find<Controllercontact>().TfPhone[i],
                          keyboardType: TextInputType.phone,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            hintText: 'شماره تلفن مخاطب',
                            hintTextDirection: TextDirection.rtl,
                            isDense: true,
                          ),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WidgetLevel(
                      Name: 'پیامک',
                      count: 1,
                      Value: 'B',
                      i: i,
                    ),
                    WidgetLevel(
                      Name: 'تماس برق',
                      count: 3,
                      Value: 'D',
                      i: i,
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WidgetLevel(
                      Name: 'گزارش گیری',
                      Value: 'C',
                      count: 2,
                      i: i,
                    ),
                    WidgetLevel(
                      Name: 'تماس',
                      Value: 'A',
                      count: 0,
                      i: i,
                    ),
                  ],
                ),
              ],
            ),
           
           
          ],
        ));
  }
}

class WidgetLevel extends StatelessWidget {
  const WidgetLevel(
      {super.key,
      required this.Name,
      this.Value = 'A',
      this.count = 0,
      this.i = 0});
  final String Name, Value;
  final int count, i;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.find<Controllercontact>().Level[i].value = Value;
        //  Get.find<Controllercontact>().ShowPart.value = 'contact';
      },
      child: Obx(() {
        return Container(
          width: Get.width * 0.3,
          padding: const EdgeInsets.symmetric(vertical: 3),
          decoration: BoxDecoration(
              color:
                  Get.find<Controllercontact>().Level[i].value.contains(Value)
                      ? color1
                      : Color.fromARGB(107, 209, 235, 233),
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              Value,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        );
      }),
    );
  }
}

class OldWidgetContact extends StatelessWidget {
  const OldWidgetContact({
    super.key,
    required this.i,
  });

  final int i;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: false,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              //   decoration: decoration(),
              width: Get.width * 0.4,
              child: TextField(
                decoration: const InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: 'نام مخاطب',
                    hintTextDirection: TextDirection.rtl),
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
                controller: Get.find<Controllercontact>().TfName[i],
              ),
            ),
            SizedBox(
              //   decoration: decoration(),
              width: Get.width * 0.4,
              child: TextField(
                decoration: const InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: 'شماره تلفن مخاطب',
                    hintTextDirection: TextDirection.rtl),
                style: const TextStyle(fontSize: 12),
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.center,
                controller: Get.find<Controllercontact>().TfPhone[i],
              ),
            ),
            /* SizedBox(
              width: Get.width * 0.4,
              child: TextField(
                controller: Get.find<Controllercontact>().TfPhone[i],
                decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: ':شماره تلفن مخاطب'),
                style: TextStyle(fontSize: 12),
                keyboardType: TextInputType.phone,
              ),
            ), */
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'سطح دستری مخاطب',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => SendOrder(
                            context,
                            () =>
                                Get.find<Controllercontact>().DeleteContact(i)),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: ['A', 'B', 'C', 'D']
                            .map((String value) => InkWell(
                                  onTap: () => SendOrder(
                                      context,
                                      () => Get.find<Controllercontact>()
                                          .RegisterContact(i: i, value: value)),
                                  child: Obx(() {
                                    return Container(
                                      width: 30,
                                      height: 30,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      decoration: decoration(
                                          color: Get.find<Controllercontact>()
                                                  .Level[i]
                                                  .value ==
                                              value,
                                          colorBG: const Color.fromARGB(
                                              255, 172, 8, 8)),
                                      child: Center(child: Text(value)),
                                    );
                                  }),
                                ))
                            .toList(),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      ' پارت مخاطب',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                        7,
                        (j) => InkWell(
                              onTap: () {
                                Get.find<Controllercontact>().Part[i].value =
                                    '${j + 1}';
                                Get.find<Controllercontact>().ShowPart.value =
                                    'part';
                              },
                              child: Obx(() {
                                return Container(
                                  width: 30,
                                  height: 30,
                                  // margin: EdgeInsets.symmetric(horizontal: 5),
                                  decoration: decoration(
                                      color: Get.find<Controllercontact>()
                                              .Part[i]
                                              .value ==
                                          '${j + 1}'),
                                  child: Center(child: Text('${j + 1}')),
                                );
                              }),
                            )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
