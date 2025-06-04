import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerOther.dart';
import 'package:lx/Getx/ControllerRemote.dart';
import 'package:lx/Page/Remote/clippathwidgetremote.dart';
import 'package:lx/SendOrder.dart';
import 'package:lx/WidgetUi/Appbar.dart';
import 'package:lx/WidgetUi/BackGroundView.dart';
import 'package:lx/WidgetUi/decoration.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class Remote extends StatelessWidget {
  const Remote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'ریموت ها'),
      body: Backgroundview(
        image: 'bg.jpg',
        child: SingleChildScrollView(
          child: Column(children: List.generate(20, (i) => WidgetRemote(i: i))),
        ),
      ),
    );
  }
}

class WidgetRemote extends StatelessWidget {
  const WidgetRemote({super.key, required this.i});
  final int i;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.5,
      decoration: decoration(),
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Row(
             children: [
               PopupMenuButton(
                      iconColor: color1,
                      onSelected: (value) {
                        switch (value) {
                          case 'ChangeName':
                            DialogTextFieldSms(context,
                                () => Get.find<Controllerremote>().ChangeNameRemote(i),
                                description: 'نام ریموت',sms: true);
                            break;
                          case 'delete':
                            SendOrder(context, ()=>Get.find<Controllerremote>().DeleteRemote(i));
                          default:
                        }
                      },
                      itemBuilder: (_) => <PopupMenuItem<String>>[
                            const PopupMenuItem(
                              value: 'ChangeName',
                              child: Text(
                                'تغییر نام ریموت',
                              ),
                            ),
                            const PopupMenuItem(
                              value: 'delte',
                              child: Text(
                                'حذف ریموت',
                              ),
                            ),
                          ]),
                           Container(
            width: 30,
            height: 30,
            decoration: decoration(),
            child: Center(child: Text('${i + 1}')),
          ),
             ],
           ),
         
          Obx(() {
            return Text(Get.find<Controllerremote>().Name[i].value);
          }),
        ],
      ),
    );
  }
}
