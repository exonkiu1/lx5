import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lx/SendOrder.dart';
import '../../Getx/ControllerDatabase.dart';

class Adddevice extends StatelessWidget {
  const Adddevice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 65, 54),
      body: Stack(
        children: [
          Align(
            child: Column(
              children: [
                Container(
                  width: Get.width,
                  height: Get.height * 0.66,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 232, 232, 232),
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(30))),
                  child: Center(
                    child: Text(
                      'OPTEX',
                      style: TextStyle(
                          color: Color.fromARGB(255, 211, 51, 51),
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Transform.translate(
              offset: Offset(0, -Get.height * 0.05),
              child: Container(
                width: Get.width * 0.8,
                height: Get.height * 0.4,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WidgetTextfieldAddDev(
                      hint: 'نام دستگاه',
                      icon: Icons.home,
                      tf: Get.find<Controllerdatabase>().tfName,
                    ),
                    WidgetTextfieldAddDev(
                      hint: 'شماره تلفن دستگاه',
                      icon: Icons.phone,
                      int: true,
                      tf: Get.find<Controllerdatabase>().tfPhone,
                    ),
                    InkWell(
                      onTap: () => DialogOrder(
                          context, () => Get.find<Controllerdatabase>().AddLx(),
                          description: 'از ساخت دستگاه مطمعن هستید؟'),
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        width: Get.width * 0.7,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 211, 51, 51),
                        ),
                        child: Center(
                            child: Text(
                          'ثبت دستگاه',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class WidgetTextfieldAddDev extends StatelessWidget {
  const WidgetTextfieldAddDev(
      {super.key,
      required this.hint,
      required this.icon,
      this.int = false,
      required this.tf});
  final String hint;
  final IconData icon;
  final bool int;
  final TextEditingController tf;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.7,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(255, 230, 224, 224)),
      child: TextField(
        controller: tf,
        textAlign: TextAlign.center,
        keyboardType: int ? TextInputType.phone : null,
        decoration: InputDecoration(
            isDense: true,
            border: InputBorder.none,
            icon: Icon(icon),
            hintText: hint),
      ),
    );
  }
}
