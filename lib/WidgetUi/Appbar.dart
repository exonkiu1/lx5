import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

AppBar appBar({
  List<Widget> actions = const [],
  String title = '',
}) =>
    AppBar(
      title: Center(
        child: Text(
          title,
          style:
              TextStyle(color: Color.fromARGB(255, 70, 88, 86), fontFamily: 'A'),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 209, 227, 231),
      actions: actions,
    );
