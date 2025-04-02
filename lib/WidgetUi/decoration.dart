import 'package:flutter/material.dart';

Decoration decoration(
        {bool color = false,
        bool border = true,
        Color colorBG = const Color.fromARGB(255, 195, 27, 15)}) =>
    BoxDecoration(
        color: color ? colorBG : null,
        border: border ? Border.all(color: color1) : null,
        borderRadius: BorderRadius.circular(20));

Color color1 = Colors.white;
Color color2 = const Color.fromARGB(255, 195, 27, 15);
