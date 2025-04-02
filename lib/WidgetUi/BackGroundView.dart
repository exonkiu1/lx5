import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Backgroundview extends StatelessWidget {
  const Backgroundview({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/image/bg.png'), fit: BoxFit.cover)),
      child: child,
    );
  }
}
