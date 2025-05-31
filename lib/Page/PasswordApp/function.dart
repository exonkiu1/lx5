import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:lx/Page/HomePage/HomePage.dart';
import 'package:lx/Page/PasswordApp/ControllerPassApp.dart';
import 'package:lx/WidgetUi/decoration.dart';

PagePassApp(BuildContext context) async {
  await Get.find<Controllerpassapp>().CheckLock();
  if (Get.find<Controllerpassapp>().lock.value) {
    screenLock(
        context: context,
        correctString: Get.find<Controllerpassapp>().password.value,
        canCancel: false,
        customizedButtonChild: Icon(
          Icons.fingerprint,
          size: 50,
        ),
        customizedButtonTap: () => biumetric(),
        onUnlocked: () => Get.off(Homepage()),
        title: Text(
          'رمز ورود را وارد کنید',
          style: TextStyle(color: color1, fontFamily: 'A'),
        ));
  } else {
    await Future.delayed(
        Duration(milliseconds: 500), () => Get.off(Homepage()));
  }
}

biumetric() async {
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
