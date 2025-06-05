import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lx/WidgetUi/decoration.dart';
import 'package:lx/WidgetUi/decoration_textfield.dart';
import 'package:permission_handler/permission_handler.dart';
import 'widget.dart' as adddevice;
import '../../Getx/ControllerDatabase.dart';
import '../../SendOrder.dart';
import '../../WidgetUi/Appbar.dart';

class Adddevice2 extends StatefulWidget {
  const Adddevice2({super.key});

  @override
  State<Adddevice2> createState() => _Adddevice2State();
}

class _Adddevice2State extends State<Adddevice2> {
  @override
  void initState() {
    play_welcome();
    CheckPermisionSms();
    // TODO: implement initState
    super.initState();
  }

  CheckPermisionSms() async {
    var status = await Permission.sms.status;
    if (status.isDenied) {
      await Permission.sms.request();
    }
  }

  play_welcome() async {
    if (Get.find<Controllerdatabase>().Lenght.value == 0) {
      AudioPlayer welcome = AudioPlayer();
      await welcome.setAsset('assets/music/welcome.mp3');
      await welcome.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: appBar(title: 'افزودن دستگاه'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Get.width * 0.8,
              height: Get.width * 0.9,
              decoration: decoration(border: true, color: true),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/image/homepage/castel.png',
                    height: Get.width * 0.4,
                  ),
                  Text('افزودن دستگاه', style: TextStyle(fontSize: 20)),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: decoration(color_border: color2),
                    child: TextField(
                      controller: Get.find<Controllerdatabase>().tfName,
                      textAlign: TextAlign.center,
                      decoration: inputDecoration(
                        hint: 'نام دستگاه',
                        isDense: true,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: decoration(color_border: color2),
                    child: TextField(
                      controller: Get.find<Controllerdatabase>().tfPhone,
                      keyboardType: TextInputType.phone,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        if (value.length > 11) {
                          Get.find<Controllerdatabase>().tfPhone.text =
                              value.substring(0, 11);
                        }
                      },
                      decoration: inputDecoration(
                        hint: 'شماره تلفن دستگاه',
                        isDense: true,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => DialogOrder(
                      context,
                      () => Get.find<Controllerdatabase>().AddLx(),
                      description: 'از ساخت دستگاه مطمئن هستید؟',
                    ),
                    child: Container(
                      width: Get.width * 0.4,
                      decoration: decoration(color: true, colorBG: color1),
                      child: Center(child: Text('ثبت',style: TextStyle(color: color2),)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetTextField extends StatelessWidget {
  const WidgetTextField({
    super.key,
    required this.hint,
    required this.tf,
    this.phone = false,
  });
  final String hint;
  final TextEditingController tf;
  final bool phone;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      ),
      child: TextField(
        controller: tf,
        textAlign: TextAlign.center,
        keyboardType: phone ? TextInputType.phone : null,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 12),
          hintText: hint,
          isDense: true,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
