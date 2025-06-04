import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerRelay.dart';
import 'package:lx/Page/Relay/DialogRelay.dart';
import 'package:lx/Page/Relay/OldWidgetRelay.dart';
import 'package:lx/WidgetUi/Appbar.dart';
import 'package:lx/WidgetUi/BackGroundView.dart';
import 'package:lx/WidgetUi/decoration.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../SendOrder.dart';

class Relay extends StatelessWidget {
  const Relay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'رله ها'),
      body: Backgroundview(
        image: 'bg.jpg',
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              6,
              (i) => WidgetRelayOld(
                    i: i,
                  )),
        ),
      )),
    );
  }
}

class WidgetRelay extends StatelessWidget {
  const WidgetRelay({super.key, required this.i});
  final int i;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: decoration(color: true),
                child: Center(child: Text('${i + 1}')),
              ),
              Obx(() {
                return Image.asset(
                  'assets/image/relay/${Get.find<Controllerrelay>().State[i].value}.png',
                  height: Get.height * 0.15,
                );
              }),
            ],
          ),
          Row(
            children: [
              Obx(() {
                return Text(
                    Get.find<Controllerrelay>().Name[i].value.toPersianDigit());
              }),
              InkWell(
                onTap: () => DialogTextFieldSms(
                    context, () => Get.find<Controllerrelay>().ChangeName(i),
                    description: 'نام رله'),
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
