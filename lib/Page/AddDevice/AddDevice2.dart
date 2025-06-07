import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerOther.dart';
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
                      //  color: const Color.fromARGB(61, 255, 255, 0),
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
                              WidgetSelectedDev(),
                            ],
                          ),
                          Center(
                            child: InkWell(
                              onTap:
                                  () => DialogOrder(
                                    context,
                                    () =>
                                        Get.find<Controllerdatabase>().AddLx(),
                                    description: 'از ساخت دستگاه مطمعن هستید؟',
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
                WidgetMOdel(model: 'LX PRO'),
                WidgetMOdel(model: 'LX 1000'),
                WidgetMOdel(model: 'UX 80'),
              ],
            ),
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

class WidgetSelectedDev extends StatelessWidget {
  const WidgetSelectedDev({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          () => Get.bottomSheet(Container(child: adddevice.boxselectedsim())),
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
