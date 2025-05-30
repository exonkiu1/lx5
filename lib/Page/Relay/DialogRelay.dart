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
        actions: [
          InkWell(
            onTap: () async {
              String code =
                  await Get.find<Controllerrelay>().ChangeState(true, i);
              SendSms(context, code);
              Navigator.of(context).pop();
            },
            child: Container(
              width: Get.width * 0.2,
              decoration: decoration(
                color: true,
              ),
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
              decoration: decoration(
                color: true,
              ),
              child: Center(child: Text('تریگر')),
            ),
          ),
          InkWell(
            onTap: () async {
              String code =
                  await Get.find<Controllerrelay>().ChangeState(false, i);
              SendSms(context, code);
              Navigator.of(context).pop();
            },
            child: Container(
              width: Get.width * 0.2,
              decoration: decoration(
                color: true,
              ),
              child: Center(child: Text('غیرفعال')),
            ),
          ),
        ],
      );
    });
