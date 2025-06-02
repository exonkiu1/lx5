import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerDatabase.dart';
import 'package:lx/Getx/ControllerSetting.dart';
import 'package:lx/SendOrder.dart';
import 'package:lx/WidgetUi/Appbar.dart';
import 'package:lx/WidgetUi/BackGroundView.dart';
import 'package:lx/WidgetUi/decoration.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class Settingdevice extends StatelessWidget {
  const Settingdevice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'تنظیمات دستگاه'),
      body: const Backgroundview(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            WidgetLangDev(),
            WidgetEstablishingContactDuringPowerOutage(),
            //WidgetSemiActiveStatusRemote(),
            /*   WidgetAddRemote(),
              WidgetDeleteRemote(),
            WidgetAddSencor(),
            WidgetDeleteSencor(), */
            WidgetPeriodicBatteryReport(),
            WidgetInventoryReport(),
            WidgetAlarmTime(),
            WidgetModeAlarm(),
            WidgetLine(),
            WidgetDeleteDev(),
            WidgetReset()
          ],
        ),
      )),
    );
  }
}

class WidgetReset extends StatelessWidget {
  const WidgetReset({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => DialogOrder(
                context, () => Get.find<Controllerdatabase>().ResetDevLx(),
                description: 'از بازگرداندن تنظیمات نرم افزار مطمعن هستید؟'),
            child: Container(
              width: Get.width * 0.25,
              decoration: decoration(),
              child: Center(
                child: Text('اعمال'),
              ),
            ),
          ),
          Text('بازگردانی تنظیمات و ویرایشات نرم افزار'),
        ],
      ),
    );
  }
}

class WidgetDeleteDev extends StatelessWidget {
  const WidgetDeleteDev({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => DialogOrder(
          context, () => Get.find<Controllerdatabase>().DeleteDevLx(),
          description: 'از حذف دستگاه مطمعن هستید؟'),
      child: Container(
        width: Get.width * 0.9,
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: Get.width * 0.25,
              decoration: decoration(),
              child: Center(
                child: Text('اعمال'),
              ),
            ),
            Text('حذف دستگاه'),
          ],
        ),
      ),
    );
  }
}

class WidgetLine extends StatelessWidget {
  const WidgetLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 5,
      decoration: BoxDecoration(
        color: color1,
      ),
    );
  }
}

class WidgetModeAlarm extends StatelessWidget {
  const WidgetModeAlarm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: Get.width * 0.6,
            decoration: decoration(),
            child: Obx(() {
              return DropdownButton(
                  value: Get.find<Controllersetting>().AlarmMode.value,
                  underline: Container(),
                  dropdownColor: color2,
                  borderRadius: BorderRadius.circular(20),
                  items: List.generate(
                          ModeAlarm.length, (i) => ModeAlarm.keys.elementAt(i))
                      .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem(
                                child: Text(
                                  '${value}',
                                  style: TextStyle(color: color1),
                                ),
                                value: value,
                              ))
                      .toList(),
                  onChanged: (value) => SendOrder(
                      context,
                      () => Get.find<Controllersetting>()
                          .ChangeModeAlarm(value!)));
            }),
          ),
          Text('مود آلارم')
        ],
      ),
    );
  }
}

class WidgetAlarmTime extends StatelessWidget {
  const WidgetAlarmTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => DialogTextFieldSms(
                context, () => Get.find<Controllersetting>().ChangeAlarmTime(),
                sms: true,
                description: 'زمان آژیر',
                maxlenght: 2,
                KeyboardInt: true),
            child: Container(
              width: Get.width * 0.5,
              decoration: decoration(),
              child: Center(
                child: Column(
                  children: [
                    Text('ویرایش'),
                    Obx(() {
                      return Text(
                          'مقدار فعلی :${Get.find<Controllersetting>().AlarmTime.value}دقیقه'
                              .toPersianDigit());
                    })
                  ],
                ),
              ),
            ),
          ),
          Text('زمان آژیر')
        ],
      ),
    );
  }
}

class WidgetInventoryReport extends StatelessWidget {
  const WidgetInventoryReport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => DialogTextFieldSms(context,
                () => Get.find<Controllersetting>().ChangeInventoryReport(),
                sms: true,
                description: 'گزارش دوره ای موجودی',
                maxlenght: 2,
                KeyboardInt: true),
            child: Container(
              width: Get.width * 0.5,
              decoration: decoration(),
              child: Center(
                child: Column(
                  children: [
                    Text('ویرایش'),
                    Obx(() {
                      return Text(
                          'مقدار فعلی : ${Get.find<Controllersetting>().InventoryReport.value}پیامک'
                              .toPersianDigit());
                    })
                  ],
                ),
              ),
            ),
          ),
          Text('گزارش دوره ای موجودی')
        ],
      ),
    );
  }
}

class WidgetPeriodicBatteryReport extends StatelessWidget {
  const WidgetPeriodicBatteryReport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => DialogTextFieldSms(
                context,
                () =>
                    Get.find<Controllersetting>().ChangePeriodicBatteryReport(),
                sms: true,
                description: 'گزارش دوره ای باتری',
                maxlenght: 2,
                KeyboardInt: true),
            child: Container(
              width: Get.width * 0.5,
              decoration: decoration(),
              child: Center(
                child: Column(
                  children: [
                    Text('ویرایش'),
                    Obx(() {
                      return Text(
                          'مقدار فعلی:${Get.find<Controllersetting>().PeriodicBatteryReport.value}پیامک'
                              .toPersianDigit());
                    })
                  ],
                ),
              ),
            ),
          ),
          Text('گزارش دوره ای باتری')
        ],
      ),
    );
  }
}

class WidgetDeleteSencor extends StatelessWidget {
  const WidgetDeleteSencor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => SendOrder(
              context,
              () => Get.find<Controllersetting>().ChangeDeleteSencor(),
            ),
            child: Container(
              width: Get.width * 0.25,
              decoration: decoration(),
              child: Center(
                child: Text('اعمال'),
              ),
            ),
          ),
          Text('حذف سنسور بی سیم از راه دور')
        ],
      ),
    );
  }
}

class WidgetAddSencor extends StatelessWidget {
  const WidgetAddSencor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => SendOrder(
                context, () => Get.find<Controllersetting>().ChangeAddSencor()),
            child: Container(
              width: Get.width * 0.25,
              decoration: decoration(),
              child: Center(
                child: Text('اعمال'),
              ),
            ),
          ),
          Text('اضافه کردن سنسور بیسیم از راه دور')
        ],
      ),
    );
  }
}

class WidgetDeleteRemote extends StatelessWidget {
  const WidgetDeleteRemote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => DialogTextFieldSms(context,
                () => Get.find<Controllersetting>().ChangeDeleteRemote(),
                sms: true),
            child: Container(
              width: Get.width * 0.25,
              decoration: decoration(),
              child: Center(
                child: Text('اعمال'),
              ),
            ),
          ),
          Text('حذف ریموت از راه دور')
        ],
      ),
    );
  }
}

class WidgetAddRemote extends StatelessWidget {
  const WidgetAddRemote({
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
            onTap: () => SendOrder(
                context, () => Get.find<Controllersetting>().ChangeAddRemote()),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: Get.width * 0.25,
              decoration: decoration(),
              child: Center(
                child: Text('اعمال'),
              ),
            ),
          ),
          Text('اضافه کردن ریموت از راه دور')
        ],
      ),
    );
  }
}

class WidgetSemiActiveStatusRemote extends StatelessWidget {
  const WidgetSemiActiveStatusRemote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: Get.width * 0.55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => SendOrder(
                      context,
                      () => Get.find<Controllersetting>()
                          .ChangeSemiActiveStatusRemote('true')),
                  child: Obx(() {
                    return Container(
                      width: Get.width * 0.25,
                      decoration: decoration(
                          color: Get.find<Controllersetting>()
                                  .SemiActiveStatusRemote
                                  .value ==
                              'true'),
                      child: Center(
                        child: Text('فعال'),
                      ),
                    );
                  }),
                ),
                InkWell(
                  onTap: () => SendOrder(
                      context,
                      () => Get.find<Controllersetting>()
                          .ChangeSemiActiveStatusRemote('false')),
                  child: Obx(() {
                    return Container(
                      width: Get.width * 0.25,
                      decoration: decoration(
                          color: Get.find<Controllersetting>()
                                  .SemiActiveStatusRemote
                                  .value ==
                              'false'),
                      child: Center(
                        child: Text('غیرفعال'),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          Text('حالت نیمه فعال ریموت'),
        ],
      ),
    );
  }
}

class WidgetEstablishingContactDuringPowerOutage extends StatelessWidget {
  const WidgetEstablishingContactDuringPowerOutage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: Get.width * 0.55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => SendOrder(
                      context,
                      () => Get.find<Controllersetting>()
                          .ChangeEstablishingContactDuringPowerOutage('true')),
                  child: Obx(() {
                    return Container(
                      width: Get.width * 0.25,
                      decoration: decoration(
                          color: Get.find<Controllersetting>()
                                  .EstablishingContactDuringPowerOutage
                                  .value ==
                              'on'),
                      child: Center(
                        child: Obx(() {
                          return Text(
                            'فعال',
                            style: TextStyle(
                                color: Get.find<Controllersetting>()
                                            .EstablishingContactDuringPowerOutage
                                            .value ==
                                        'on'
                                    ? color2
                                    : null),
                          );
                        }),
                      ),
                    );
                  }),
                ),
                InkWell(
                  onTap: () => SendOrder(
                      context,
                      () => Get.find<Controllersetting>()
                          .ChangeEstablishingContactDuringPowerOutage('false')),
                  child: Obx(() {
                    return Container(
                      width: Get.width * 0.25,
                      decoration: decoration(
                          color: Get.find<Controllersetting>()
                                  .EstablishingContactDuringPowerOutage
                                  .value ==
                              'false'),
                      child: Center(
                        child: Obx(
                         () {
                            return Text('غیرفعال',style: TextStyle(color:Get.find<Controllersetting>()
                                      .EstablishingContactDuringPowerOutage
                                      .value ==
                                  'false'?color2:null ),);
                          }
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          Text('تماس در قطعی برق'),
        ],
      ),
    );
  }
}

class WidgetLangDev extends StatelessWidget {
  const WidgetLangDev({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: Get.width * 0.55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => SendOrder(context,
                      () => Get.find<Controllersetting>().ChangeLangDev('per')),
                  child: Obx(() {
                    return Container(
                      width: Get.width * 0.25,
                      decoration: decoration(
                          color:
                              Get.find<Controllersetting>().DevLanguage.value ==
                                  'per'),
                      child: Center(
                        child: Obx(() {
                          return Text(
                            'فارسی',
                            style: TextStyle(
                                color: Get.find<Controllersetting>()
                                            .DevLanguage
                                            .value ==
                                        'per'
                                    ? color2
                                    : null),
                          );
                        }),
                      ),
                    );
                  }),
                ),
                InkWell(
                  onTap: () => SendOrder(context,
                      () => Get.find<Controllersetting>().ChangeLangDev('per')),
                  child: Obx(() {
                    return Container(
                      width: Get.width * 0.25,
                      decoration: decoration(
                          color:
                              Get.find<Controllersetting>().DevLanguage.value ==
                                  'eng'),
                      child: Center(
                        child: Obx(() {
                          return Text(
                            'انگلیسی',
                            style: TextStyle(
                                color: Get.find<Controllersetting>()
                                            .DevLanguage
                                            .value ==
                                        'eng'
                                    ? color2
                                    : null),
                          );
                        }),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          Text('زبان دستگاه'),
        ],
      ),
    );
  }
}
