import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/WidgetUi/Appbar.dart';
import '/WidgetUi/BackGroundView.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'راهنمایی'),
      body: Backgroundview(child: Column()),
    );
  }
}
