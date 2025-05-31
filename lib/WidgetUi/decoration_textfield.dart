import 'package:flutter/material.dart';

InputDecoration inputDecoration({
  String hint = '',
  bool isDense=false
}) =>
    InputDecoration(
   //   border: InputBorder.none,
      hintText: hint,
      hintStyle: TextStyle(color: Colors.black),
      isDense: isDense
    );
