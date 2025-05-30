import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/binding.dart';
import 'package:lx/WidgetUi/BackGroundView.dart';
import 'package:lx/WidgetUi/decoration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Backgroundview(
            child: Center(
          child: Text(
            'RANGER',
            style: TextStyle(
              fontSize: 40,
            ),
          ),
        )),
      ),
      initialBinding: mybinding(),
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 250, 242),
        dialogTheme: DialogTheme(
          titleTextStyle: TextStyle(color: color2, fontSize: 25),
          contentTextStyle: TextStyle(color: Colors.black, fontSize: 18),
        ),
        /* colorScheme: Theme.of(context).colorScheme.copyWith(primary: colorY),
        dialogBackgroundColor: colorW, */
        hintColor: Colors.black,
        primaryTextTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black, fontFamily: 'A'),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black, fontFamily: 'A'),
          bodySmall: TextStyle(color: Colors.black, fontFamily: 'A'),
          bodyLarge: TextStyle(color: Colors.black, fontFamily: 'A'),
        ),
      ),
    );
  }
}
