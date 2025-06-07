import 'package:get/get.dart';
import 'package:lx/Getx/ControllerInfo.dart';
import 'package:lx/Page/Options/Options2.dart';

class Controlleroptions extends GetxController {
  RxList<RxDouble> OpacityOption =
      List.generate(PageModel[Get.find<Controllerinfo>().Model.value]!.length, (i) => 0.0.obs).obs;
  StartShowing() async {
    await Future.delayed(Duration(milliseconds: 200));
    for (var i = 0; i < PageModel[Get.find<Controllerinfo>().Model.value]!.length; i++) {
      await Future.delayed(Duration(milliseconds: 70));
      for (var j = 0; j < 10; j++) {
        await Future.delayed(Duration(milliseconds: 10));
        OpacityOption[i].value = OpacityOption[i].value + 0.1;
      }
    }
  }

  DisposeOpacity() {
    OpacityOption = List.generate(PageModel[Get.find<Controllerinfo>().Model.value]!.length, (i) => 0.0.obs).obs;
  }
}
