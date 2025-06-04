import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerHomePage.dart';
import 'package:lx/Getx/ControllerRelay.dart';
import 'package:lx/Page/Inquiry/Inquiry.dart';
import 'package:lx/Page/Options/Options2.dart';
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
      //endDrawer: DrawerWidget(),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 30),

              Text(
                'OPTEX',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Color.fromARGB(255, 120, 70, 70),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print('object');
                  Get.to(() => Options());
                },
                child: Icon(Icons.menu),
                style: ButtonStyle(),
              ),
            ],
          ),
          Image.asset(
            'assets/image/homepage/vila 2.jpg',
            height: Get.height * 0.5,
          ),
          Column(
            children: [
              WidgetStateDev(Name: 'فعال', state: 'on'),
              SizedBox(
                width: Get.width * 0.66,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WidgetStateDev(Name: 'سایلنت', state: 'silent'),
                    WidgetStateDev(Name: 'نیمه فعال', state: 'halfon'),
                  ],
                ),
              ),
              WidgetStateDev(Name: 'غیرفعال', state: 'off'),
            ],
          ),
        ],
      ),
    );
  }
}

class WidgetStateDev extends StatelessWidget {
  const WidgetStateDev({super.key, required this.Name, required this.state});
  final String state, Name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          () => SendOrder(
            context,
            () => Get.find<Controllerhomepage>().ChangeStateDev(state),
          ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/image/homepage/box.png',
                height: Get.height * 0.1,
              ),
              Column(
                children: [
                  Obx(() {
                    return Image.asset(
                      'assets/image/homepage/${state}${Get.find<Controllerhomepage>().StateDev.value == state ? 'True' : ''}.png',
                      height: Get.height * 0.05,
                    );
                  }),
                  Text('${Name}'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
