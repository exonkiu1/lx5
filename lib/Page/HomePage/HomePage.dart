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
              Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/homepage/remote.jpg'))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 300,
                      height: 100,
                    //  color: const Color.fromARGB(92, 244, 67, 54),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: ()=> SendOrder(
                                              context,
                                              () =>
                                                  Get.find<Controllerhomepage>()
                                                      .ChangeStateDev('on'),
                                            ),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                //  color: const Color.fromARGB(132, 33, 149, 243),
                                ),
                              ),
                              InkWell(
                             onTap:    ()=> SendOrder(
                                              context,
                                              () =>
                                                  Get.find<Controllerhomepage>()
                                                      .ChangeStateDev('on'),
                                            ),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                 // color: const Color.fromARGB(171, 255, 235, 59),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: ()=> SendOrder(
                                              context,
                                              () =>
                                                  Get.find<Controllerhomepage>()
                                                      .ChangeStateDev('silent'),
                                            ),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                 // color: const Color.fromARGB(171, 255, 235, 59),
                                ),
                              ),
                              InkWell(
                                onTap: ()=> SendOrder(
                                              context,
                                              () =>
                                                  Get.find<Controllerhomepage>()
                                                      .ChangeStateDev('halfon'),
                                            ),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                //  color: const Color.fromARGB(153, 33, 149, 243),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ))
                ],
              ),
            ),
              
            ],
          ),
        ],
      ),
    );
  }
}
