import 'package:flutter/material.dart';

class boxwidgetzon extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double x = size.width, y = size.height;
    path.moveTo(0, 0);
    path.lineTo(x, 0);
    path.lineTo(x, y);
    path.lineTo(x * 0.7, y);
    path.quadraticBezierTo(x * 0.5, y * 0.6, x * 0.3, y);
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
