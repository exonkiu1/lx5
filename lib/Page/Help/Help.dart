import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/WidgetUi/Appbar.dart';
import 'package:lx/WidgetUi/BackGroundView.dart';
import 'package:lx/WidgetUi/decoration.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  void initState() {
    GetPDf();
    // TODO: implement initState
    super.initState();
  }

  GetPDf() async {
    final Uri _url = Uri.parse(
        'https://faradezhco.ir/wp-content/uploads/2025/05/rahnama.pdf');
    await launchUrl(_url);
  }

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
                onTap: () => GetPDf(),
                child: widgethelp(
                  title: 'دفترچه راهنمایی',
                  des: "برای دریافت دفترچه راهنمایی کلیک نمایید",
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
