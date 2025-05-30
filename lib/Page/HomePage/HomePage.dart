import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerHomePage.dart';
import 'package:lx/Getx/ControllerRelay.dart';
import 'package:lx/Page/Help/Help.dart';
import 'package:lx/Page/Inquiry/Inquiry.dart';
import 'package:lx/SendOrder.dart';
import 'package:lx/WidgetUi/decoration.dart';

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
                'RANGER+',
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
                'assets/image/homepage/castel.png',
                height: Get.width * 0.7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () => Get.to(Inquiry()),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/image/homepage/inquiry.png',
                              height: Get.width * 0.1,
                            ),
                            Image.asset(
                              'assets/image/homepage/t inquiry.png',
                              height: Get.width * 0.1,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () => SendOrder(
                          context,
                          () => Get.find<Controllerrelay>().Triger(0),
                        ),
                        child: Column(
                          children: [
                            Align(
                              child: Image.asset(
                                'assets/image/homepage/triger.png',
                                height: Get.width * 0.1,
                              ),
                            ),
                            Image.asset(
                              'assets/image/homepage/t triger.png',
                              height: Get.width * 0.1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Transform.translate(
                    offset: Offset(0, -20),
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/image/homepage/rimot.png',
                          height: Get.width * 0.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: Get.width * 0.1,
                                width: Get.width * 0.3,
                                child: Row(
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                        child: InkWell(
                                          onTap: () {
                                            SendOrder(
                                              context,
                                              () =>
                                                  Get.find<Controllerhomepage>()
                                                      .ChangeStateDev('silent'),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                        child: InkWell(
                                          onTap: () {
                                            SendOrder(
                                              context,
                                              () =>
                                                  Get.find<Controllerhomepage>()
                                                      .ChangeStateDev('off'),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () => SendOrder(
                                  context,
                                  () => Get.find<Controllerhomepage>()
                                      .ChangeStateDev('on'),
                                ),
                                child: Container(
                                  width: Get.width * 0.2,
                                  height: Get.width * 0.2,
                                  // color: const Color.fromARGB(78, 33, 149, 243),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () => SendOrder(
                          context,
                          () => Get.find<Controllerhomepage>()
                              .ChangeStateDev('halfon'),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/image/homepage/halfon.png',
                              height: Get.width * 0.1,
                            ),
                            Image.asset(
                              'assets/image/homepage/t halfon.png',
                              height: Get.width * 0.1,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () => Get.to(Help()),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/image/homepage/help.png',
                              height: Get.width * 0.1,
                            ),
                            Image.asset(
                              'assets/image/homepage/t help.png',
                              height: Get.width * 0.1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
