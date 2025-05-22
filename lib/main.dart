import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/binding.dart';
import 'package:lx/Page/HomePage/HomePage.dart';
import 'package:lx/Page/SplashScreen.dart/SplashScreen.dart';
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
      home:
      // Homepage(),
      const Scaffold(
        body: Backgroundview(
          child: Center(child: Text('LUX', style: TextStyle(fontSize: 40))),
        ),
      ),
      initialBinding: mybinding(),
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 199, 169, 169),
        dialogTheme: DialogTheme(
          titleTextStyle: TextStyle(color: color2, fontSize: 25),
          contentTextStyle: TextStyle(color: Colors.black, fontSize: 18),
        ),
        /* colorScheme: Theme.of(context).colorScheme.copyWith(primary: colorY),
        dialogBackgroundColor: colorW, */
        hintColor: Colors.white,
        primaryTextTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white, fontFamily: 'A'),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white, fontFamily: 'A'),
          bodySmall: TextStyle(color: Colors.white, fontFamily: 'A'),
          bodyLarge: TextStyle(color: Colors.white, fontFamily: 'A'),
        ),
      ),
    );
  }
}




