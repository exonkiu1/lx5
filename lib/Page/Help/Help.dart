import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/WidgetUi/Appbar.dart';
import 'package:lx/WidgetUi/BackGroundView.dart';
import 'package:lx/WidgetUi/decoration.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'راهنمایی'),
      body: Backgroundview(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  final Uri _url = Uri.parse('https://Faradezhco.ir');
                  await launchUrl(_url);
                },
                child: widgethelp(
                  title: 'ارتباط با ما',
                  des: "اطلاعات خواسته شده رو از سایت برداریدFaradezhco.ir",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class widgethelp extends StatelessWidget {
  const widgethelp({super.key, required this.title, required this.des});
  final String title, des;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration(),
      width: Get.width * 0.8,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(des.toPersianDigit(), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
