import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerHomePage.dart';
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Get.put(Controllerhomepage(), permanent: true).GetTheme();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!),
        home: const Scaffold(
          body: Backgroundview(
              child: Center(
            child: Text(
              'OPTEX',
              style: TextStyle(
                fontSize: 77,
              ),
            ),
          )),
        ),
        initialBinding: mybinding(),
        theme: ThemeData(
          scaffoldBackgroundColor:
              Get.put(Controllerhomepage(), permanent: true).theme.value ==
                      'dark'
                  ? Color.fromARGB(196, 36, 38, 44)
                  : Color.fromARGB(255, 255, 255, 255),
          dialogTheme: DialogTheme(
            titleTextStyle: TextStyle(color: color2, fontSize: 25),
            contentTextStyle: TextStyle(color: Colors.black, fontSize: 18),
          ),
          /* colorScheme: Theme.of(context).colorScheme.copyWith(primary: colorY),
            dialogBackgroundColor: colorW, */
          hintColor: Colors.black,
          primaryTextTheme: const TextTheme(
            bodyLarge:
                TextStyle(color: Colors.white, fontFamily: 'A', fontSize: 13),
          ),
          textTheme: const TextTheme(
            bodyMedium:
                TextStyle(color: Colors.white, fontFamily: 'A', fontSize: 13),
            bodySmall:
                TextStyle(color: Colors.white, fontFamily: 'A', fontSize: 13),
            bodyLarge:
                TextStyle(color: Colors.white, fontFamily: 'A', fontSize: 13),
          ),
        ),
      );
    });
  }
}
