import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Clippathwidgetcontact extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    double x = size.width, y = size.height;
    path.moveTo(0, 0);
    path.lineTo(x * 0.4, 0);
    path.quadraticBezierTo(x * 0.4, y * 0.5, x * 0.6, 0);
    path.lineTo(x, 0);
    path.lineTo(x, y);
    path.lineTo(x * 0.6, y);
    path.quadraticBezierTo(x * 0.6, y * 0.5, x * 0.4, y);
    path.lineTo(0, y);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
