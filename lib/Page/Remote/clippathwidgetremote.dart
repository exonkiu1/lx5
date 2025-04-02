import 'package:flutter/material.dart';

class Clippathwidgetremote extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    double x = size.width, y = size.height;

    path.moveTo(0, 0);
    path.lineTo(x, 0);
    path.lineTo(x, y * 0.8);
    path.lineTo(x * 0.5, y);
    path.lineTo(0, y * 0.8);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
