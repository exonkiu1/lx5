import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerHomePage.dart';
import 'package:lx/Getx/ControllerRelay.dart';
import 'package:lx/Page/Help/Help.dart';
import 'package:lx/Page/Inquiry/Inquiry.dart';
import 'package:lx/SendOrder.dart';
import 'DrawerWidget.dart';

class Homepage extends StatelessWidget {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      endDrawer: DrawerWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    print('object');
                    _globalKey.currentState!.openEndDrawer();
                  },
                  child: Icon(Icons.menu),
                  style: ButtonStyle(),
                ),
              ),
              SizedBox(height: 40),
              Text(
                'SignalAlarm',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Color.fromARGB(255, 45, 64, 66),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Image.asset(
                'assets/image/homepage/remote.jpg',
                height: Get.width * 0.7,
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
