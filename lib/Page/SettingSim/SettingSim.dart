import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerDatabase.dart';
import 'package:lx/Getx/ControllerInfo.dart';
import 'package:lx/Getx/ControllerOther.dart';
import 'package:lx/SendOrder.dart';
import 'package:lx/WidgetUi/Appbar.dart';
import 'package:lx/WidgetUi/BackGroundView.dart';
import 'package:lx/WidgetUi/decoration.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class Settingsim extends StatelessWidget {
  const Settingsim({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'تنظیمات سیمکارت'),
      body: Backgroundview(
          child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          WidgetCharge(),
          WidgetNameDev(),
          WidgetPhoneDev(),
          Container(
            width: Get.width * 0.9,
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: decoration(),
            child: Column(
              children: [
                Text('انتخاب سیمکارت برای ارسال دستورات'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WidgetSim(
                      sim: 0,
                    ),
                    WidgetSim(
                      sim: 1,
                    ),
                  ],
                ),
                WidgetSim(
                  sim: -1,
                  name: 'سیم پیش فرض موبایل',
                ),
                WidgetSim(
                  sim: -2,
                  name: 'ارسال از طریق پیامرسان',
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}

class WidgetSim extends StatelessWidget {
  const WidgetSim({super.key, required this.sim, this.name = ''});
  final int sim;
  final String name;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.find<Controllerinfo>().Simcard.value = sim;

        Get.find<Controllerdatabase>().UpdateLx();
      },
      child: Obx(() {
        return Container(
          width: sim >= 0 ? Get.width * 0.3 : Get.width * 0.5,
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.symmetric(vertical: 5),
          decoration: decoration(
              color: Get.find<Controllerinfo>().Simcard.value == sim),
          child: Center(child: Text(sim >= 0 ? 'sim ${sim + 1}' : name)),
        );
      }),
    );
  }
}

class WidgetPhoneDev extends StatelessWidget {
  const WidgetPhoneDev({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => DialogTextFieldSms(
                context, () => Get.find<Controllerinfo>().ChangePhone(),
                maxlenght: 11, description: 'شماره تلفن دستگاه'),
            child: Container(
              width: Get.width * 0.25,
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: decoration(),
              child: Center(
                child: Text('اعمال'),
              ),
            ),
          ),
          Text('ویرایش شماره تلفن دستگاه')
        ],
      ),
    );
  }
}

class WidgetNameDev extends StatelessWidget {
  const WidgetNameDev({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => DialogTextFieldSms(
                context, () => Get.find<Controllerinfo>().ChangeName(),
                description: 'نام دستگاه'),
            child: Container(
              width: Get.width * 0.25,
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: decoration(),
              child: Center(
                child: Text('اعمال'),
              ),
            ),
          ),
          Text('ویرایش نام دستگاه')
        ],
      ),
    );
  }
}

class WidgetCharge extends StatelessWidget {
  const WidgetCharge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 100),
      width: Get.width * 0.5,
      decoration: decoration(),
      child: Column(
        children: [
          Obx(() {
            return Text('${Get.find<Controllerinfo>().Charge.value} ریال'
                .toPersianDigit());
          }),
          Obx(() {
            return Visibility(
              visible:
                  Get.find<Controllerother>().TypeInquiry.value != 'Charge',
              replacement: CircularProgressIndicator(),
              child: InkWell(
                onTap: () => SendInquiry(
                    context, () => Get.find<Controllerinfo>().InquiryCharge(),
                    code:
                        '60${codeInquiryCharge[Get.find<Controllerinfo>().Oprator.value]}',
                    controller: '',
                    type: 'Charge'),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  width: Get.width * 0.25,
                  decoration: decoration(),
                  child: Center(child: Text('استعلام')),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
