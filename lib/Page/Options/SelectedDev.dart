import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerDatabase.dart';

import '../../Getx/ControllerInfo.dart';
import '../../WidgetUi/decoration.dart';

class SelectedDevLx extends StatelessWidget {
  const SelectedDevLx({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.bottomSheet(Container(
          width: Get.width,
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: decoration(color: true, colorBG: color2),
          child: Obx(() {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                  Get.find<Controllerdatabase>().Lenght.value,
                  (i) => InkWell(
                        onTap: () {
                          Get.find<Controllerdatabase>().GetLx(i: i);
                          Get.back();
                        },
                        child: Container(
                          width: Get.width * 0.9,
                          decoration: decoration(),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Visibility(
                                  visible: Get.find<Controllerdatabase>()
                                          .Index
                                          .value ==
                                      i,
                                  child: Icon(
                                    Icons.check,
                                    color: color1,
                                  )),
                              Text(Get.find<Controllerdatabase>().Devs[i].Name),
                              Text(Get.find<Controllerdatabase>().Devs[i].Phone)
                            ],
                          ),
                        ),
                      )),
            );
          }),
        ));
      },
      child: Container(
          width: Get.width * 0.9,
          height: Get.height * 0.05,
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.only(right: 10),
          decoration: decoration(color: true,colorBG: color2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
              //Image.asset('assets/image/options2/profile-circle-2.png'),
              Obx(() {
                return Text('${Get.find<Controllerinfo>().Name.value}');
              }),
              Obx(() {
                return Text('${Get.find<Controllerinfo>().Phone.value}');
              })
            ],
          )),
    );
  }
}
