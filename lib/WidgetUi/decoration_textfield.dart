import 'package:flutter/material.dart';

InputDecoration inputDecoration({
  String hint = '',
  bool isDense=false,
  bool border = false
}) =>
    InputDecoration(
     border:border? InputBorder.none:null,
      hintText: hint,
      hintStyle: TextStyle(color: Colors.black),
      isDense: isDense
    );
