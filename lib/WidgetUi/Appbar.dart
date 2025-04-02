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
              TextStyle(color: Color.fromARGB(255, 90, 1, 1), fontFamily: 'A'),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 36, 33, 33),
      actions: actions,
    );
