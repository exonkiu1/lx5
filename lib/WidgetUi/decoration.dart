import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerHomePage.dart';

Decoration decoration(
        {bool color = false,
        bool border = true,
        Color colorBG = const Color.fromARGB(255, 88, 70, 70),
        Color color_border = const Color.fromARGB(255, 66, 45, 45)}) =>
    BoxDecoration(
        color: color
            ? colorBG
            : Get.put(Controllerhomepage(), permanent: true).theme.value ==
                    'dark'
                ? Color.fromARGB(196, 37, 44, 36)
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

Color color1 = Color.fromARGB(255, 66, 45, 45);
Color color2 = Color.fromARGB(255, 255, 250, 242);