import 'package:flutter/material.dart';
import 'package:lx/Page/Help/Help.dart';
import 'package:lx/WidgetUi/Appbar.dart';

class Aboutme extends StatelessWidget {
  const Aboutme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'درباره ما'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widgethelp(
              title: 'برنامه نویس',
              des: 'مهندس مرتضی ناجی \n 09053071908',
            ),
          ],
        ),
      ),
    );
  }
}
