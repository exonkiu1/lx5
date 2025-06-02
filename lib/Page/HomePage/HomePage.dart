import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerHomePage.dart';
import 'package:lx/Getx/ControllerRelay.dart';
import 'package:lx/Page/Inquiry/Inquiry.dart';
import 'package:lx/SendOrder.dart';
import 'package:lx/WidgetUi/decoration.dart';
import 'package:widget_mask/widget_mask.dart';

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
                'OPTEX',
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
              Stack(
                alignment: Alignment.center,
                children: [
                  WidgetMask(
                    blendMode: BlendMode.srcATop,
                    childSaveLayer: true,
                    mask: Center(
                      child: Container(decoration: decoration(color: true)),
                    ),
                    child: Icon(Icons.shield, size: Get.width * 0.8),
                    /*  Image.asset(
                      'assets/image/homepage/mask2.png',
                      width: 400,
                    ), */
                  ),
                  WidgetMask(
                    blendMode: BlendMode.srcATop,
                    childSaveLayer: true,
                    mask: Center(
                      child: Image.asset(
                        'assets/image/homepage/home.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Icon(Icons.shield, size: 350),
                    /* Image.asset(
                      'assets/image/homepage/mask2.png',
                      width: 350,
                    ), */
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    'assets/image/homepage/remote3.png',
                    height: Get.width * 0.5,
                  ),
                  Column(
                    children: [
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          SendOrder(
                            context,
                            () => Get.find<Controllerhomepage>().ChangeStateDev(
                              'halfon',
                            ),
                            description: 'دستگاه نیمه فعال شود؟',
                          );
                        },
                        child: Container(width: 20, height: 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap:
                                () => SendOrder(
                                  context,
                                  () => Get.find<Controllerhomepage>()
                                      .ChangeStateDev('off'),
                                  description: 'دستگاه غیرفعال شود؟',
                                ),
                            child: Container(
                              width: 30,
                              height: 30,
                              // color: const Color.fromARGB(78, 33, 149, 243),
                            ),
                          ),
                          SizedBox(width: 30),
                          InkWell(
                            onTap: () {
                              SendOrder(
                                context,
                                () => Get.find<Controllerhomepage>()
                                    .ChangeStateDev('on'),
                                description: 'دستگاه فعال شود؟',
                              );
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              // color: const Color.fromARGB(78, 33, 149, 243),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          SendOrder(
                            context,
                            () => Get.find<Controllerhomepage>().ChangeStateDev(
                              'silent',
                            ),
                            description: 'دستگاه سایلنت شود؟',
                          );
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          // color: const Color.fromARGB(78, 33, 149, 243),
                        ),
                      ),
                      /*  Flexible(
                              flex: 1,
                              child: Container(
                                child: 
                              ),
                            ), */
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
