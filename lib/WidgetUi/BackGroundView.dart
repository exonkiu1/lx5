import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Backgroundview extends StatelessWidget {
  const Backgroundview({super.key, required this.child,this.image ='bg2.jpg' });
  final Widget child;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/image/${image}'), fit: BoxFit.cover,opacity: 1)),
      child: child,
    );
  }
}
