import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerContact.dart';
import 'package:lx/SendOrder.dart';
import 'package:lx/WidgetUi/decoration.dart';
import 'package:lx/WidgetUi/decoration_textfield.dart';

class WidgetContactOld extends StatelessWidget {
  const WidgetContactOld({super.key, required this.i});
  final int i;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      decoration: decoration(),
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: decoration(),
                width: 30,
                height: 30,
                child: Center(
                  child: Text('${i + 1}'),
                ),
              ),
              InkWell(
                onTap: () => Get.find<Controllercontact>().SelectContact(i),
                child: Icon(
                  Icons.contact_emergency,
                  color: Colors.white,
                  size: 30,
                ),
              )
            ],
          ),
          TextField(
            decoration: inputDecoration(hint: 'نام مخاطب'),
            controller: Get.find<Controllercontact>().TfName[i],
          ),
          TextField(
            decoration: inputDecoration(hint: 'شماره تلفن مخاطب'),
            keyboardType: TextInputType.phone,
            controller: Get.find<Controllercontact>().TfPhone[i],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WidgetSelectLevel(
                i: i,
              ),
              WidgetSelectPart(
                i: i,
              ),
              InkWell(
                onTap: () => SendOrder(context,
                    () => Get.find<Controllercontact>().DeleteContact(i)),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class WidgetSelectPart extends StatelessWidget {
  const WidgetSelectPart({super.key, required this.i});
  final int i;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: decoration(),
      child: Obx(() {
        return DropdownButton(
          value: Get.find<Controllercontact>().Part[i].value == ''
              ? null
              : Get.find<Controllercontact>().Part[i].value,
          dropdownColor: color2,
          items: ['1', '2', '3', '4']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
              child: Text(
                '${value}',
                style: TextStyle(color: Colors.white),
              ),
              value: value,
            );
          }).toList(),
          onChanged: (value) {
            Get.find<Controllercontact>().Part[i].value = value!;
            Get.find<Controllercontact>().ShowPart.value = 'part';
          },
        );
      }),
    );
  }
}

class WidgetSelectLevel extends StatelessWidget {
  const WidgetSelectLevel({super.key, required this.i});
  final int i;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: decoration(),
      child: Obx(() {
        return DropdownButton(
            value: Get.find<Controllercontact>().Level[i].value == ''
                ? null
                : Get.find<Controllercontact>().Level[i].value,
            dropdownColor: Colors.black,
            items: ['A', 'B', 'C', 'D']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem(
                child: Text(
                  '${value}',
                  style: TextStyle(color: Colors.white),
                ),
                value: value,
              );
            }).toList(),
            onChanged: (Value) => SendOrder(
                context,
                () => Get.find<Controllercontact>()
                    .RegisterContact(i: i, value: Value!)));
      }),
    );
  }
}
