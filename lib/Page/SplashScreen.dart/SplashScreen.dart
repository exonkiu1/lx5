import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:lx/Getx/ControllerDatabase.dart';
import 'package:lx/Page/HomePage/HomePage.dart';
import 'package:lx/Page/PasswordApp/function.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    PagePassApp(context);
    // TODO: implement initState
    super.initState();
  }

 

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'RANGER',
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}

biumetric() async {
  await Future.delayed(Duration(milliseconds: 500));
  if (Get.find<Controllerdatabase>().Lenght.value != 0) {
    final LocalAuthentication localAuthentication = LocalAuthentication();
    bool isBiometricSupported = await localAuthentication.isDeviceSupported();
    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

    bool isAuthenticated = false;

    if (isBiometricSupported && canCheckBiometrics) {
      isAuthenticated = await localAuthentication.authenticate(
        localizedReason: 'لطفا اثر انگشت خود را وارد کنید',
      );
    }
    if (isAuthenticated) {
      Get.offAll(() => Homepage());
    } else {
      Get.snackbar('خطا', 'دوباره وارد کنید');
    }
  }
}
