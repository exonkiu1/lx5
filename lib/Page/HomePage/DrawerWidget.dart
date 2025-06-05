import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerHomePage.dart';
import 'package:lx/Getx/ControllerInfo.dart';
import 'package:lx/Page/Options/Options2.dart';
import 'package:lx/SendOrder.dart';
import 'package:lx/WidgetUi/decoration.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Options/SelectedDev.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 793,
      width: 300,
      decoration: decoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => Get.put(
                    Controllerhomepage(),
                    permanent: true,
                  ).ChangeTheme(),
                  child: Obx(() {
                    return Icon(
                      Get.put(
                                Controllerhomepage(),
                                permanent: true,
                              ).theme.value ==
                              'dark'
                          ? Icons.light
                          : Icons.dark_mode,
                    );
                  }),
                ),
                Image.asset('assets/image/logo.png', height: 60),
                Container(width: 20),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SelectedDevLx(),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                PageOptions2.length,
                (i) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: InkWell(
                    onTap: () =>
                        Get.to(PageOptions2.values.elementAt(i)['page']),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/image/options3/' +
                              PageOptions2.values.elementAt(i)['image'] +
                              '.png',
                          height: 30,
                        ),
                        Text(PageOptions2.keys.elementAt(i)),
                      ],
                    ),
                  ),
                ),
              )..add(Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: InkWell(
                    onTap: () => DialogOrder(
                        context, () => Get.find<Controllerinfo>().Hearing(),
                        description:
                            'فقط مدیر میتواند به محیط شنود داشته باشد آیا مایلید برای شنود به دستگاه تماس بگیرید؟'),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/image/options3/hearing.png',
                          height: 30,
                        ),
                        Text('شنود محیط'),
                      ],
                    ),
                  ),
                )),
            ),
          ],
        ),
      ),
    );
  }
}
