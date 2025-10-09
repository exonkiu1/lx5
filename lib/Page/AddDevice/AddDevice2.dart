import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerOther.dart';
import 'package:lx/Getx/controllerWarenty.dart';
import 'package:lx/Stt/ControllerSttAddDevice.dart';
import 'package:lx/WidgetUi/decoration.dart';
import 'package:permission_handler/permission_handler.dart';
import 'widget.dart' as adddevice;
import '../../Getx/ControllerDatabase.dart';
import '../../SendOrder.dart';
import '../../WidgetUi/Appbar.dart';

class Adddevice2 extends StatefulWidget {
  const Adddevice2({super.key});

  @override
  State<Adddevice2> createState() => _Adddevice2State();
}

class _Adddevice2State extends State<Adddevice2> {
  @override
  void initState() {
    if (Get.find<Controllerdatabase>().Lenght.value == 0) {
      Get.find<Controllersttadddevice>().PlayMusic('welcome');
    }
    CheckPermisionSms();
    // TODO: implement initState
    super.initState();
  }

  CheckPermisionSms() async {
    var status = await Permission.sms.status;
    if (status.isDenied) {
      await Permission.sms.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'افزودن دستگاه'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.find<Controllersttadddevice>().Agent(),
        child: Icon(Icons.support_agent, color: color1),
        backgroundColor: color2,
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/adddevice/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(),
            Center(
              child: Container(
                width: Get.width,
                height: Get.height * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/adddevice/box.png'),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: Get.width * 0.5,
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(height: 20),
                              WidgetTextField(
                                hint: 'نام دستگاه',
                                tf: Get.find<Controllerdatabase>().tfName,
                              ),
                              SizedBox(height: 10),
                              WidgetTextField(
                                tf: Get.find<Controllerdatabase>().tfPhone,
                                hint: 'شماره تلفن دستگاه',
                                phone: true,
                              ),
                              SizedBox(height: 10),
                              InkWell(
                                //
                                onTap: () async {
                                  final FlutterContactPicker _contactPicker =
                                      new FlutterContactPicker();
                                  Contact? contact1 =
                                      await _contactPicker.selectContact();
                                  if (contact1 != null) {
                                    Get.find<Controllerdatabase>().tfName.text =
                                        contact1.fullName.toString();
                                    Get.find<Controllerdatabase>()
                                            .tfPhone
                                            .text =
                                        contact1.phoneNumbers![0]
                                            .replaceAll(' ', '')
                                            .replaceAll('+98', '0');
                                  }
                                },
                                child: Container(
                                  width: Get.width * 0.44,
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  decoration: decoration(
                                    color: true,
                                    colorBG: Color.fromARGB(54, 255, 255, 255),
                                    border: false,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'انتخاب از مخاطبین',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              WidgetSelectedDev(),
                            ],
                          ),
                          Center(
                            child: InkWell(
                              onTap: () async {
                                bool val = 
                                //true;
                                    await Get.find<Controllersttadddevice>()
                                        .Agent();
                                if (val) {
                                  if (Get.find<Controllerother>().Model.value !=
                                      'LX PRO') {
                                    DialogOrder(
                                      context,
                                      () => 
                                      Get.find<Controllerdatabase>().AddLx(),
                                      description:
                                          'از ساخت دستگاه مطمعن هستید؟',
                                    );
                                  } else {
                                    SendInquiry(
                                        context,
                                        () => Get.find<Controllerwarrenty>()
                                            .SendImeiStartWarenty(),
                                        description:
                                            'از ساخت دستگاه مطمعن هستید؟',
                                        code: '6660',
                                        controller: '##',
                                        type: 'imei',
                                        bool_phone: true,
                                        phone:
                                            '${Get.find<Controllerdatabase>().tfPhone.text}');
                                  }
                                }
                              },
                              child: Obx(() {
                                return Visibility(
                                  visible: Get.find<Controllerother>()
                                          .TypeInquiry
                                          .value !=
                                      'imei',
                                  replacement: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: decoration(color: true),
                                    child: Center(
                                      child: Obx(() {
                                        return Text(
                                          Get.find<Controllerother>()
                                              .counter
                                              .value
                                              .toString(),
                                          style: TextStyle(fontSize: 12),
                                        );
                                      }),
                                    ),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 2),
                                    width: Get.width * 0.3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color.fromARGB(54, 255, 255, 255),
                                    ),
                                    child: Center(child: Text('ثبت دستگاه')),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: Get.width * 0.3,
                      height: Get.height,
                      // color: Colors.pink,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WidgetMOdel(model: 'LX 1000'),
                WidgetMOdelpro(model: 'LX PRO'),
                WidgetMOdelpro(model: 'LX PRO MAX'),
              ],
            ),
            SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WidgetMOdel(model: 'UX 80'),
                WidgetMOdelpro(model: 'UX PRO'),
                WidgetMOdelpro(model: 'UX PRO MAX'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Obx(() {
              return Visibility(
                  visible: Get.find<Controllerother>().Model.value == 'LX PRO',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'تک کاربره',
                        style: TextStyle(color: Colors.white),
                      ),
                      Obx(() {
                        return Checkbox(
                            value: Get.find<Controllersttadddevice>()
                                .SingleUser
                                .value,
                            onChanged: (value) {
                              Get.find<Controllersttadddevice>()
                                  .SingleUser
                                  .value = value!;
                            });
                      })
                    ],
                  ));
            })
          ],
        ),
      ),
    );
  }
}

class WidgetMOdel extends StatelessWidget {
  const WidgetMOdel({super.key, required this.model});
  final String model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.find<Controllerother>().Model.value = model,
      child: Obx(() {
        return Container(
          width: Get.width * 0.25,
          decoration: decoration(
            color: Get.find<Controllerother>().Model.value == model,
          ),
          child: Center(child: Text(model, style: TextStyle(fontSize: 13))),
        );
      }),
    );
  }
}

class WidgetMOdelpro extends StatelessWidget {
  const WidgetMOdelpro({super.key, required this.model});
  final String model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.find<Controllerother>().Model.value = 'LX PRO';
        Get.find<Controllerother>().ModelPro.value = model;
      },
      child: Obx(() {
        return Container(
          width: Get.width * 0.25,
          decoration: decoration(
            color: Get.find<Controllerother>().ModelPro.value == model && Get.find<Controllerother>().Model.value == 'LX PRO',
          ),
          child: Center(child: Text(model, style: TextStyle(fontSize: 13))),
        );
      }),
    );
  }
}

class WidgetSelectedDev extends StatelessWidget {
  const WidgetSelectedDev({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Get.bottomSheet(Container(child: adddevice.boxselectedsim())),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        width: Get.width * 0.44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(54, 255, 255, 255),
        ),
        child: Center(
          child: Text('انتخاب سیمکارت دستگاه', style: TextStyle(fontSize: 10)),
        ),
      ),
    );
  }
}

class WidgetTextField extends StatelessWidget {
  const WidgetTextField({
    super.key,
    required this.hint,
    required this.tf,
    this.phone = false,
  });
  final String hint;
  final TextEditingController tf;
  final bool phone;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      ),
      child: TextField(
        controller: tf,
        textAlign: TextAlign.center,
        keyboardType: phone ? TextInputType.phone : null,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 12),
          hintText: hint,
          isDense: true,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
