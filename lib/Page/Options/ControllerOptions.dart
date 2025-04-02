import 'package:get/get.dart';
import 'package:lx/Page/Options/Options2.dart';

class Controlleroptions extends GetxController {
  RxList<RxDouble> OpacityOption =
      List.generate(PageOptions2.length, (i) => 0.0.obs).obs;
  StartShowing() async {
    await Future.delayed(Duration(milliseconds: 200));
    for (var i = 0; i < PageOptions2.length; i++) {
      await Future.delayed(Duration(milliseconds: 70));
      for (var j = 0; j < 10; j++) {
        await Future.delayed(Duration(milliseconds: 10));
        OpacityOption[i].value = OpacityOption[i].value + 0.1;
      }
    }
  }

  DisposeOpacity() {
    OpacityOption = List.generate(PageOptions2.length, (i) => 0.0.obs).obs;
  }
}
