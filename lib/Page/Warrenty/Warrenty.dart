import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/controllerWarenty.dart';
import 'package:lx/Page/Warrenty/ListCity.dart';
import 'package:lx/WidgetUi/decoration.dart';
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
            hint: 'نشانی',
            tf: Get.find<Controllerwarrenty>().tf_Address,
            width: Get.width * 0.8,
            customwidth: true,
          ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: Get.width * 0.4,
                decoration: decoration(),
                child: Obx(() {
                  return DropdownButton(
                      value: Get.find<Controllerwarrenty>()
                                  .drp_province
                                  .value
                                  .length >
                              2
                          ? Get.find<Controllerwarrenty>().drp_province.value
                          : null,
                      underline: Container(),
                      items: List.generate(ListCity.length,
                              (i) => ListCity.keys.elementAt(i))
                          .map<DropdownMenuItem<String>>(
                              (String value) => DropdownMenuItem(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      value,
                                      style: TextStyle(color: Colors.white),
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ))
                          .toList(),
                      onChanged: (value) {
                        Get.find<Controllerwarrenty>().drp_province.value =
                            value!;
                        Get.find<Controllerwarrenty>().drp_city.value =
                            ListCity[Get.find<Controllerwarrenty>()
                                .drp_province
                                .value]![0];
                      });
                }),
              ),
              Obx(() {
                return Visibility(
                  visible:
                      Get.find<Controllerwarrenty>().drp_province.value.length >
                          2,
                  child: Container(
                    width: Get.width * 0.4,
                    decoration: decoration(),
                    child: Obx(() {
                      return DropdownButton(
                          value: Get.find<Controllerwarrenty>()
                                      .drp_city
                                      .value
                                      .length >
                                  2
                              ? Get.find<Controllerwarrenty>().drp_city.value
                              : null,
                          underline: Container(),
                          items: ListCity[Get.find<Controllerwarrenty>()
                                  .drp_province
                                  .value]!
                              .map<DropdownMenuItem<String>>(
                                  (String value) => DropdownMenuItem(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          value,
                                          style: TextStyle(color: Colors.white),
                                          textDirection: TextDirection.rtl,
                                        ),
                                        value: value,
                                      ))
                              .toList(),
                          onChanged: (value) => Get.find<Controllerwarrenty>()
                              .drp_city
                              .value = value!);
                    }),
                  ),
                );
              })
            ],
          ),
          Visibility(
            child: InkWell(
              onTap: () {
                bool val = Get.find<Controllerwarrenty>().CheckCompliteInfoDev();
                if (val) {
                  Get.find<Controllerwarrenty>().RegisterDev();
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 2),
                margin: EdgeInsets.symmetric(vertical: 20),
                width: Get.width * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(54, 255, 255, 255),
                ),
                child: Center(child: Text('ثبت اطلاعات')),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
