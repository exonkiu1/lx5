import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/binding.dart';
import 'package:lx/WidgetUi/BackGroundView.dart';
import 'package:lx/WidgetUi/decoration.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://swrgytwvmqthgtwaqpaa.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN3cmd5dHd2bXF0aGd0d2FxcGFhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDk2NTI5MjIsImV4cCI6MjA2NTIyODkyMn0.se6M3E0UgwlOIUDgSll5KOZGKdtlU1LZfUNvYbKNhmY',
  );
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
            child: Center(
          child: Text(
            'LUX',
            style: TextStyle(
              fontSize: 40,
            ),
          ),
        )),
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
