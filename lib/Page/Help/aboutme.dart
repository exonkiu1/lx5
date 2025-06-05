import 'package:flutter/material.dart';
import 'package:lx/Page/Help/Help.dart';
import 'package:lx/WidgetUi/Appbar.dart';
import 'package:url_launcher/url_launcher.dart';

class Aboutme extends StatelessWidget {
  const Aboutme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'درباره ما'),
      body: Center(
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
            SizedBox(height: 20,),
           /*  widgethelp(
              title: 'برنامه نویس',
              des: 'مهندس مرتضی ناجی \n 09053071908',
            ), */
          ],
        ),
      ),
    );
  }
}
