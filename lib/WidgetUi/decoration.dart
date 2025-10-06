import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerHomePage.dart';

Decoration decoration(
        {bool color = false,
        bool border = true,
        Color colorBG = const Color.fromARGB(255, 8, 97, 160),
        Color color_border = const Color.fromARGB(255, 8, 97, 160)}) =>
    BoxDecoration(
        color: color
            ? colorBG
            : Get.put(Controllerhomepage(), permanent: true).theme.value ==
                    'dark'
                ? const Color.fromARGB(255, 8, 97, 160)
                : color2,
        boxShadow: [
          BoxShadow(
              offset: Offset(0.6, 0.6),
              blurRadius: 0.6,
              spreadRadius: 0.6,
              color: color1.withOpacity(0.1)),
          BoxShadow(
              offset: Offset(-0.6, -0.6),
              blurRadius: 0.6,
              spreadRadius: 0.6,
              color: color1.withOpacity(0.1))
        ],
        border: border
            ? Border.all(color: color_border.withOpacity(0.3), width: 0.6)
            : null,
        borderRadius: BorderRadius.circular(20));

Color color1 = Colors.grey;
Color color2 = const Color.fromARGB(255, 116, 110, 66);
