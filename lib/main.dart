import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/binding.dart';
import 'package:lx/WidgetUi/BackGroundView.dart';
import 'package:lx/WidgetUi/decoration.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // فقط حالت عمودی (Portrait)
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!),
      home: const Scaffold(
        body: Backgroundview(
            child: Center(
          child: Text(
            'RANGER+',
            style: TextStyle(
              fontSize: 77,
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
          bodyLarge:
              TextStyle(color: Colors.black, fontFamily: 'A', fontSize: 13),
        ),
        textTheme: const TextTheme(
          bodyMedium:
              TextStyle(color: Colors.black, fontFamily: 'A', fontSize: 13),
          bodySmall:
              TextStyle(color: Colors.black, fontFamily: 'A', fontSize: 13),
          bodyLarge:
              TextStyle(color: Colors.black, fontFamily: 'A', fontSize: 13),
        ),
      ),
    );
  }
}
