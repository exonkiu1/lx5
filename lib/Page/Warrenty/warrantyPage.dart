import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/controllerWarenty.dart';
import 'package:lx/WidgetUi/BackGroundView.dart';
import 'package:lx/WidgetUi/decoration.dart';

import '../../WidgetUi/Appbar.dart';

class Warrantypage extends StatelessWidget {
  const Warrantypage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: ' اطلاعات  گارانتی'),
      body: Backgroundview(
          child: Column(
        children: [
          Obx(() {
            return WidgetInfo(
              title: 'نام مالک',
              description: Get.find<Controllerwarrenty>().NameClinet.value,
            );
          }),
          Obx(() {
            return WidgetInfo(
              title: 'شماره تلفن مالک',
              description: Get.find<Controllerwarrenty>().PhoneClinet.value,
            );
          }),
          Obx(() {
            return WidgetInfo(
              title: 'نشانی مالک',
              description: Get.find<Controllerwarrenty>().Address.value,
            );
          }),
          Obx(() {
            return WidgetInfo(
              title: 'شهر',
              description: Get.find<Controllerwarrenty>().City.value,
            );
          }),
          Obx(() {
            return WidgetInfo(
              title: 'استان',
              description: Get.find<Controllerwarrenty>().Province.value,
            );
          }),
          Obx(() {
            return WidgetInfo(
              title: 'نام تکنیسین',
              description: Get.find<Controllerwarrenty>().NameTechnician.value,
            );
          }),
          Obx(() {
            return WidgetInfo(
              title: 'شماره تلفن تکنیسین',
              description: Get.find<Controllerwarrenty>().PhoneTechnician.value,
            );
          }),
          Obx(() {
            return WidgetInfo(
              title: 'تاریخ شروع گارانتی',
              description: Get.find<Controllerwarrenty>().DateWarrenty.value,
            );
          }),
        ],
      )),
    );
  }
}

class WidgetInfo extends StatelessWidget {
  const WidgetInfo({super.key, required this.title, required this.description});
  final String title, description;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.8,
      decoration: decoration(),
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          Text(
            description,
            textDirection: TextDirection.rtl,
          ),
          Text(
            '${title}:',
            style: TextStyle(color: color2),
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }
}
