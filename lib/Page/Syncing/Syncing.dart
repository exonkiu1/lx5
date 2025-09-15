import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerOther.dart';
import 'package:lx/Getx/ControllerSyncing.dart';
import 'package:lx/Page/AddDevice/AddDevice2.dart';
import 'package:lx/SendOrder.dart';
import 'package:lx/WidgetUi/Appbar.dart';
import 'package:lx/WidgetUi/BackGroundView.dart';
import 'package:lx/WidgetUi/decoration.dart';

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
                  onStepTapped: (value) {
                    Get.find<Controllersyncing>().index.value = value;
                  },
                  steps: List.generate(
                      4,

                      // Execution_order_list.length,
                      (i) => Step(
                          isActive:
                              Get.find<Controllersyncing>().index.value >= i,
                          title:
                              //Text('hi ${i + 1}'),
                              Text('${Execution_order_list.keys.elementAt(i)}'),
                          
                          content: 
                          //Text('${i}')
                          widgetontentSteper(i: i,)
                          
                          )));
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

class widgetontentSteper extends StatelessWidget {
  const widgetontentSteper({
    super.key,required this.i
  });
  final int i;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Visibility(
          visible: (Get.find<Controllersyncing>()
                  .index
                  .value) ==
              i?true:true,
          child: Column(
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () => SendSms(
                        context,
                        Execution_order_list.values
                            .elementAt(i)['code']),
                    child: Container(
                      width: Get.width * 0.3,
                      decoration: decoration(),
                      child: Center(
                        child: Text('دریافت پیامک'),
                      ),
                    ),
                  ),
                  WidgetTextField(
                    hint: 'پیامک استعلام',
                    tf: Get.find<Controllerother>().tf,
                    color: color2,
                  )
                ],
              ),
              InkWell(
                onTap: () {
                  Get.find<Controllerother>()
                          .TextInuiry
                          .value =
                      Get.find<Controllerother>().tf.text;
                  Get.find<Controllerother>().tf.text =
                      '';
                  Get.find<Controllersyncing>()
                      .index
                      .value += 1;
                  print(Get.find<Controllersyncing>()
                      .index
                      .value);
                  Execution_order_list.values
                      .elementAt(i)['function']();
                },
                child: Container(
                  width: Get.width * 0.3,
                  margin:
                      EdgeInsets.symmetric(vertical: 5),
                  decoration: decoration(),
                  child: Center(
                    child: Text('ثبت استعلام'),
                  ),
                ),
              ),
            ],
          ));
    });
  }
}
