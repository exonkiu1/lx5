import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/WidgetUi/Appbar.dart';
import 'package:lx/WidgetUi/BackGroundView.dart';
import 'package:lx/WidgetUi/decoration.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpLXPRO extends StatefulWidget {
  const HelpLXPRO({super.key});

  @override
  State<HelpLXPRO> createState() => _HelpLXPROState();
}

class _HelpLXPROState extends State<HelpLXPRO> {
  @override
  void initState() {
    GetPDf();
    // TODO: implement initState
    super.initState();
  }

  GetPDf() async {
    final Uri _url = Uri.parse(
      'https://s21.uupload.ir/files/luxsecurity/Vangard/Pdf%20lux%20pro%20max/Image%20to%20PDF%2020250122%2014.14.24.pdf',
    );
    await launchUrl(_url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'راهنمایی'),
      body: Backgroundview(child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => GetPDf(),
                child: widgethelp(
                  title: 'دفترچه راهنمایی',
                  des: "برای دریافت دفترچه راهنمایی کلیک نمایید",
                ),
              ),
            ],
          ),
        ),),
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
      width: Get.width * 0.9,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
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