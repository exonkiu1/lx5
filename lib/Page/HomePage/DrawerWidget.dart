import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Page/Options/Options2.dart';

import '../Options/SelectedDev.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 793,
      width: 300,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 250, 242),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          
          children: [
            SizedBox(height: 10,),
            Image.asset('assets/image/logo.png',height: 60,),
            SizedBox(height: 30,),
            SelectedDevLx(),
            SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             
              children: List.generate(
                PageOptions2.length,
                (i) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: InkWell(
                    onTap: () => Get.to(PageOptions2.values.elementAt(i)['page']),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                         'assets/image/options3/'+ PageOptions2.values.elementAt(i)['image'] + '.png',
                          height: 30,
                        ),
                                            Text(PageOptions2.keys.elementAt(i)),
                    
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
