import 'package:flutter/material.dart';
import 'package:get/get.dart';



class WidgetTextField extends StatelessWidget {
  const WidgetTextField({
    super.key,
    required this.hint,
    required this.tf,
    this.phone = false,
    this.customwidth = false,
    this.width = 10.0
  });
  final String hint;
  final TextEditingController tf;
  final bool phone;
  final double width;
  final  bool customwidth;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:!customwidth? Get.width * 0.44:width,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      ),
      child: TextField(
        controller: tf,
        textAlign: TextAlign.center,
        keyboardType: phone ? TextInputType.phone : null,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 12),
          hintText: hint,
          isDense: true,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
