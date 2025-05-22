import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerHomePage.dart';
import 'package:lx/Page/Inquiry/Inquiry.dart';
import 'package:lx/Page/Options/Options2.dart';
import 'package:lx/Page/Relay/Relay.dart';
import 'package:lx/SendOrder.dart';
import 'package:lx/Stt/MainStt.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/homepage/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: Get.height * 0.4,
                    child: Stack(
                      children: [
                        Align(
                          child: Transform.translate(
                            offset: Offset(0, -Get.height * 0.2),
                            child: GestureDetector(
                              /*  onPanDown: (details) {
                                print('stop');
                                Get.find<Controllerhomepage>().StateErth.value =
                                    'stop';
                              },
                              onPanEnd: (details) {
                                print('start again');
                                Get.find<Controllerhomepage>().StateErth.value =
                                    Get.find<Controllerhomepage>()
                                        .beforStateErth
                                        .value;
                              }, */
                              onPanEnd: (details) {
                                Get.find<Controllerhomepage>().ChangeState();
                                Get.find<Controllerhomepage>().EndSpead();
                              },
                              onPanStart: (details) {
                                Get.find<Controllerhomepage>().Loc.value =
                                    details.localPosition.dx;
                              },
                              onPanUpdate: (details) {
                                Get.find<Controllerhomepage>().EndLoc.value =
                                    details.localPosition.dx;
                                Get.find<Controllerhomepage>().StartSpead();
                              },
                              child: SizedBox(
                                height: Get.height * 0.37,
                                child: Obx(() {
                                  return Transform.rotate(
                                    angle:
                                        Get.find<Controllerhomepage>()
                                            .Degree
                                            .value *
                                        math.pi /
                                        180,
                                    child: Image.asset(
                                      'assets/image/homepage/earth.png',
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                        ),
                        WidgetSpaceship2(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () => Get.to(() => const Options2()),
                              child: const Icon(
                                Icons.menu,
                                color: Colors.grey,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                        WidgetSpaceShip(),
                      ],
                    ),
                  ),
                  Container(
                    width: Get.width * 0.8,
                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.grey, width: 5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(3, -5),
                            blurRadius: 3,
                            spreadRadius: 3,
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(-3, 5),
                            blurRadius: 3,
                            spreadRadius: 3,
                          ),
                        ],
                        border: Border.all(color: Colors.grey, width: 5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.find<Controllerstt>().type.value = 'HomePage';
                              Stt(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.red),
                              ),
                              child: Icon(Icons.mic, size: 30),
                            ),
                          ),
                          InkWell(
                            onTap: () => Get.to(() => Inquiry()),
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.red),
                              ),
                              child: const Icon(Icons.laptop, size: 30),
                            ),
                          ),
                          InkWell(
                            onTap: () => Get.to(() => const Relay()),
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.red),
                              ),
                              child: const Icon(Icons.light, size: 30),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(() {
                    return Container(
                      height: Get.height * 0.4,
                      width: Get.width * 0.58,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/image/homepage/remote ${Get.find<Controllerhomepage>().Remote.value}.png',
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: Get.height * 0.09),
                          Container(
                            width: Get.width * 0.4,
                            height: Get.height * 0.05,
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: InkWell(
                                    onTap:
                                        () => Get.find<Controllerhomepage>()
                                            .flySpaceship(
                                              context,
                                              () => SendOrder(
                                                context,
                                                () => Get.find<
                                                      Controllerhomepage
                                                    >()
                                                    .ChangeStateDev('on'),
                                                StateDev: true,
                                              ),
                                            ),
                                    child: Container(
                                      //   color: Colors.green.withOpacity(0.3),
                                    ),
                                  ),
                                ),

                                Flexible(
                                  flex: 1,
                                  child: InkWell(
                                    onTap:
                                        () => Get.find<Controllerhomepage>()
                                            .flySpaceship(
                                              context,
                                              () => SendOrder(
                                                context,
                                                () => Get.find<
                                                      Controllerhomepage
                                                    >()
                                                    .ChangeStateDev('off'),
                                                StateDev: true,
                                              ),
                                            ),
                                    child: Container(
                                      //   color: Colors.black.withOpacity(0.3),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: Get.width * 0.4,
                            height: Get.height * 0.05,
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: InkWell(
                                    onTap:
                                        () => Get.find<Controllerhomepage>()
                                            .flySpaceship(
                                              context,
                                              () => SendOrder(
                                                context,
                                                () => Get.find<
                                                      Controllerhomepage
                                                    >()
                                                    .ChangeStateDev('halfon'),
                                                StateDev: true,
                                              ),
                                            ),
                                    child: Container(
                                      //  color: Colors.green.withOpacity(0.3),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: InkWell(
                                    onTap:
                                        () => Get.find<Controllerhomepage>()
                                            .flySpaceship(
                                              context,
                                              () => SendOrder(
                                                context,
                                                () => Get.find<
                                                      Controllerhomepage
                                                    >()
                                                    .ChangeStateDev('silent'),
                                                StateDev: true,
                                              ),
                                            ),
                                    child: Container(
                                      //  color: const Color.fromARGB(255, 175, 76, 76).withOpacity(0.3),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetSpaceship2 extends StatelessWidget {
  const WidgetSpaceship2({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Obx(() {
        return Transform.translate(
          offset: Offset(0, Get.find<Controllerhomepage>().DySpaceship2.value),
          child: Transform.translate(
            offset: Offset(0, -Get.height * 0.4),
            child: Image.asset(
              'assets/image/homepage/Spaceship.png',
              height: Get.height * 0.4,
            ),
          ),
        );
      }),
    );
  }
}

class WidgetSpaceShip extends StatefulWidget {
  const WidgetSpaceShip({super.key});

  @override
  State<WidgetSpaceShip> createState() => _WidgetSpaceShipState();
}

class _WidgetSpaceShipState extends State<WidgetSpaceShip>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> StandingDy;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    StandingDy = Tween(begin: 0.0, end: 10.0).animate(_animationController);
    _animationController.forward();
    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        _animationController.reverse();
      }
      if (_animationController.isDismissed) {
        _animationController.forward();
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Align(
          child: Obx(() {
            return Transform.translate(
              offset: Offset(
                0,
                Get.find<Controllerhomepage>().DySpaceship.value,
              ),
              child: Transform.translate(
                offset: Offset(0, StandingDy.value),
                child: Image.asset(
                  'assets/image/homepage/Spaceship.png',
                  height: Get.height * 0.07,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
