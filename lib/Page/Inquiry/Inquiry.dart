import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerHomePage.dart';
import 'package:lx/Getx/ControllerInquiry.dart';
import 'package:lx/Getx/ControllerOther.dart';
import 'package:lx/Getx/ControllerRelay.dart';
import 'package:lx/Getx/ControllerZon.dart';
import 'package:lx/SendOrder.dart';
import 'package:lx/WidgetUi/Appbar.dart';
import 'package:lx/WidgetUi/BackGroundView.dart';
import 'package:lx/WidgetUi/decoration.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class Inquiry extends StatelessWidget {
  const Inquiry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'استعلام دستگاه'),
      body: Backgroundview(
        image: 'bg.jpg',
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() {
            return Visibility(
              visible:
                  Get.find<Controllerother>().TypeInquiry.value != 'Inquiry',
              replacement: CircularProgressIndicator(),
              child: InkWell(
                onTap: () => SendInquiry(
                    context, () => Get.find<Controllerinquiry>().inquiry(),
                    code: '90', type: 'Inquiry', controller: ';'),
                child: Container(
                  width: Get.width * 0.3,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration: decoration(),
                  child: Center(
                    child: Text('استعلام'),
                  ),
                ),
              ),
            );
          }),
          Column(
            children: [
              Obx(() {
                return WidgetItemInquiry(
                  title: 'وضعیت دستگاه',
                  value: MapstateDev2[
                      Get.find<Controllerhomepage>().StateDev.value]!,
                );
              }),
              Obx(() {
                return WidgetItemInquiry(
                  title: 'برق شهر',
                  value: Get.find<Controllerinquiry>().UrbanElectricity.value,
                );
              }),
              Obx(() {
                return WidgetItemInquiry(
                  title: 'بلندگو',
                  value: Get.find<Controllerinquiry>().Speaker.value,
                );
              }),
              Obx(() {
                return WidgetItemInquiry(
                  title: 'درصد باتری',
                  value: Get.find<Controllerinquiry>().BatterPower.value,
                );
              }),
              Obx(() {
                return WidgetItemInquiry(
                  title: 'تعداد مخاطبین',
                  value: Get.find<Controllerinquiry>().CountContact.value,
                );
              }),
              Obx(() {
                return WidgetItemInquiry(
                  title: 'تعداد ریموت',
                  value: Get.find<Controllerinquiry>().CountRemote.value,
                );
              }),
              Obx(() {
                return WidgetItemInquiry(
                  title: 'قدرت آنتن',
                  value: Get.find<Controllerinquiry>().AntennaStrength.value,
                );
              }),
              Obx(() {
                return WidgetItemInquiry(
                  title: 'وضعیت شبکه',
                  value:
                      Get.find<Controllerinquiry>().CommunicationsStatus.value,
                );
              }),
              Obx(() {
                return WidgetItemInquiry(
                  title: '${Get.find<Controllerzon>().Name[0].value}'
                      .toPersianDigit(),
                  value: Get.find<Controllerinquiry>().zon1.value,
                );
              }),
              Obx(() {
                return WidgetItemInquiry(
                  title: '${Get.find<Controllerzon>().Name[1].value}'
                      .toPersianDigit(),
                  value: Get.find<Controllerinquiry>().zon2.value,
                );
              }),
              Obx(() {
                return WidgetItemInquiry(
                  title: '${Get.find<Controllerzon>().Name[2].value}'
                      .toPersianDigit(),
                  value: Get.find<Controllerinquiry>().zon3.value,
                );
              }),
              Obx(() {
                return WidgetItemInquiry(
                  title: '${Get.find<Controllerzon>().Name[3].value}'
                      .toPersianDigit(),
                  value: Get.find<Controllerinquiry>().zon4.value,
                );
              }),
              Column(
                children: List.generate(
                    2,
                    (i) => WidgetRelayItemInquiry(
                          i: i,
                        )),
              )
            ],
          )
        ],
      )),
    );
  }
}

class WidgetRelayItemInquiry extends StatelessWidget {
  const WidgetRelayItemInquiry({super.key, required this.i});
  final int i;
  @override
  Widget build(BuildContext context) {
    return WidgetItemInquiry(
        title: '${Get.find<Controllerrelay>().Name[i].value}'.toPersianDigit(),
        value:
            '${Get.find<Controllerrelay>().State[i].value ? 'فعال' : 'غیرفعال'}');
  }
}

class WidgetItemInquiry extends StatelessWidget {
  const WidgetItemInquiry(
      {super.key, required this.title, required this.value});
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          SizedBox(
            width: Get.width * 0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${value}'),
                Text('${title}'),
              ],
            ),
          ),
          Container(
            width: Get.width * 0.5,
            height: 1,
            color: color1.withOpacity(0.5),
          )
        ],
      ),
    );
  }
}
