import 'package:flutter/material.dart';

Decoration decoration(
        {bool color = false,
        bool border = true,
        Color colorBG = const Color.fromARGB(255, 70, 88, 86),
        Color color_border = const Color.fromARGB(255, 45, 64, 66)}) =>
    BoxDecoration(
        color: color ? colorBG : color2,
        boxShadow: [
          BoxShadow(
              offset: Offset(0.7, 0.7),
              blurRadius: 0.7,
              spreadRadius: 0.7,
              color: color1.withOpacity(0.1))
        ],
        border: border
            ? Border.all(color: color_border.withOpacity(0.5), width: 1.5)
            : null,
        borderRadius: BorderRadius.circular(20));

Color color1 = Color.fromARGB(255, 45, 64, 66);
Color color2 = Color.fromARGB(255, 255, 250, 242);
