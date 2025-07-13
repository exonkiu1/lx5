import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerDatabase.dart';
import 'package:lx/Getx/controllerWarenty.dart';
import 'widget.dart' as widget;
import '../../WidgetUi/Appbar.dart';
import '../../WidgetUi/BackGroundView.dart';

class Warrenty extends StatelessWidget {
  const Warrenty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'ثبت اطلاعات برای گارانتی'),
      body: Backgroundview(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              widget.WidgetTextField(
                  hint: 'نام مالک',
                  tf: Get.find<Controllerwarrenty>().Tf_NameClinet),
              widget.WidgetTextField(
                hint: 'شماره تلفن مالک',
                tf: Get.find<Controllerwarrenty>().tf_PhoneClinet,
                phone: true,
              ),
            ],
          ),
          widget.WidgetTextField(
              hint: 'نشانی', tf: Get.find<Controllerwarrenty>().tf_Address),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              widget.WidgetTextField(
                  hint: 'نام تکنیسین',
                  tf: Get.find<Controllerwarrenty>().Tf_NameTechnician),
              widget.WidgetTextField(
                hint: 'شماره تلفن تکنیسین',
                tf: Get.find<Controllerwarrenty>().tf_PhoneTechnician,
                phone: true,
              ),
            ],
          ),
          
        ],
      )),
    );
  }
}
