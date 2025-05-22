import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      body: Container(
          width: Get.width,
          height: Get.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/image/adddevice/bg.png'),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Center(
                  child: Container(
                width: Get.width,
                height: Get.height * 0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/image/adddevice/box.png'))),
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
                              WidgetTextField(
                                hint: 'نام دستگاه',
                                tf: Get.find<Controllerdatabase>().tfName,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              WidgetTextField(
                                tf: Get.find<Controllerdatabase>().tfPhone,
                                hint: 'شماره تلفن دستگاه',
                                phone: true,
                              ),
                            ],
                          ),
                          Center(
                            child: InkWell(
                              onTap: () => DialogOrder(context,
                                  () => Get.find<Controllerdatabase>().AddLx(),
                                  description: 'از ساخت دستگاه مطمعن هستید؟'),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 2),
                                width: Get.width * 0.3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color.fromARGB(54, 255, 255, 255)),
                                child: Center(child: Text('ثبت دستگاه')),
                              ),
                            ),
                          )
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
              )),
              InkWell(
                onTap: () => Get.bottomSheet(Container(
                  child: adddevice.boxselectedsim(),
                )),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  margin: EdgeInsets.only(bottom: 20),
                  width: Get.width * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(54, 255, 255, 255)),
                  child: Center(
                      child: Text(
                    'انتخاب سیمکارت دستگاه',
                    style: TextStyle(fontSize: 13),
                  )),
                ),
              ),
            ],
          )),
    );
  }
}

class WidgetTextField extends StatelessWidget {
  const WidgetTextField(
      {super.key, required this.hint, required this.tf, this.phone = false});
  final String hint;
  final TextEditingController tf;
  final bool phone;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.44,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.black),
      child: TextField(
        controller: tf,
        textAlign: TextAlign.center,
        keyboardType: phone ? TextInputType.phone : null,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 12),
            hintText: hint,
            isDense: true,
            border: InputBorder.none),
      ),
    );
  }
}
