import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerSyncing.dart';
import 'package:lx/SendOrder.dart';
import 'package:lx/WidgetUi/Appbar.dart';
import 'package:lx/WidgetUi/BackGroundView.dart';

class Syncing extends StatefulWidget {
  const Syncing({super.key});

  @override
  State<Syncing> createState() => _SyncingState();
}

class _SyncingState extends State<Syncing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'همگام سازی'),
      body: Backgroundview(
          child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Stepper(
                  currentStep: Get.find<Controllersyncing>().index.value,
                  controlsBuilder: (context, details) {
                    return Container();
                  },
                  steps: List.generate(
                      4,
                      // Execution_order_list.length,
                      (i) => Step(
                          isActive:
                              Get.find<Controllersyncing>().index.value >= i,
                          title: Text('hi ${i+1}'),
                           //   Text('${Execution_order_list.keys.elementAt(i)}'),
                          content: Obx(() {
                            return Visibility(
                                visible:
                                    Get.find<Controllersyncing>().index.value ==
                                        i,
                                child: CircularProgressIndicator());
                          }))));
            }),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => DialogOrder(
                    context, () => Get.find<Controllersyncing>().StartSyncing(),
                    description:
                        'آیا میخواهید همگام سازی نرم افزار با دستگاه شروع کنید؟'),
                child: Text('همگام سازی'))
          ],
        ),
      )),
    );
  }
}
