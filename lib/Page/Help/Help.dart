import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/WidgetUi/Appbar.dart';
import 'package:lx/WidgetUi/BackGroundView.dart';

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
