import 'package:flutter/material.dart';

Decoration decoration(
        {bool color = false,
        bool border = true,
        Color colorBG = const Color.fromARGB(255, 70, 88, 86),
        Color color_border = const Color.fromARGB(255, 45, 64, 66)}) =>
    BoxDecoration(
        color: color ? colorBG : null,
        boxShadow: [
          BoxShadow(
              offset: Offset(-1, -1),
              blurRadius: 1,
              spreadRadius: 1,
              color: color1.withOpacity(0.3))
        ],
        border: border
            ? Border.all(color: color_border.withOpacity(0.5), width: 4)
            : null,
        borderRadius: BorderRadius.circular(20));

Color color1 = Color.fromARGB(255, 45, 64, 66);
Color color2 = Color.fromARGB(255, 255, 250, 242);
