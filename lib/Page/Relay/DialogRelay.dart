import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lx/Getx/ControllerRelay.dart';
import 'package:lx/SendOrder.dart';
import 'package:lx/WidgetUi/decoration.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

DialogRelay(BuildContext context, {int i = 0}) => showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: Text(
        '${Get.find<Controllerrelay>().Name[i].value}'.toPersianDigit(),
        style: TextStyle(color: Colors.black),
      ),

      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () async {
                  String code = await Get.find<Controllerrelay>().ChangeState(
                    true,
                    i,
                  );
                  SendSms(context, code);
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: Get.width * 0.2,
                  decoration: decoration(color: true),
                  child: Center(child: Text('فعال')),
                ),
              ),
              InkWell(
                onTap: () async {
                  String code = await Get.find<Controllerrelay>().Triger(i);
                  SendSms(context, code);
                  Navigator.of(context).pop();
                  Get.find<Controllerrelay>().StartTriger(i);
                  final music = AudioPlayer();
                  music.setAsset('assets/music/relay/true.mp3');
                  await music.play();
                  music.setAsset('assets/music/relay/false.mp3');
                  await music.play();
                },
                child: Container(
                  width: Get.width * 0.2,
                  decoration: decoration(color: true),
                  child: Center(child: Text('تریگر')),
                ),
              ),
              InkWell(
                onTap: () async {
                  String code = await Get.find<Controllerrelay>().ChangeState(
                    false,
                    i,
                  );
                  SendSms(context, code);
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: Get.width * 0.2,
                  decoration: decoration(color: true),
                  child: Center(child: Text('غیرفعال')),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Obx(() {
              return DropdownButton(
                value:
                    Get.find<Controllerrelay>().Zon[i].value == -1
                        ? null
                        : Get.find<Controllerrelay>().Zon[i].value,
                items:
                    List.generate(
                          Get.find<Controllerrelay>().listzon.length,
                          (i) => i,
                        )
                        .map<DropdownMenuItem<int>>(
                          (int value) => DropdownMenuItem(
                            alignment: Alignment.centerRight,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                '${Get.find<Controllerrelay>().listzon[value]['label']}'
                                    .toPersianDigit(),
                              textAlign: TextAlign.left,
                              textDirection: TextDirection.rtl,
                              ),
                            ),
                            value: value,
                          ),
                        )
                        .toList(),
                onChanged:
                    (value) => SendOrder(
                      context,
                      () => Get.find<Controllerrelay>().ChangeZon(
                        i,
                        int.parse('${value}'),
                      ),
                    ),
              );
            }),
          ),
        ],
      ),
    );
  },
);
