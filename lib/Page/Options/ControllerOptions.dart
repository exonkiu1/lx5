import 'package:get/get.dart';
import 'package:lx/Getx/ControllerInfo.dart';
import 'package:lx/Page/Options/Options2.dart';

class Controlleroptions extends GetxController {
  RxList<RxDouble> OpacityOption = List.generate(30, (i) => 0.0.obs).obs;
  RxInt lenght = 0.obs;
  StartShowing() async {
    await Future.delayed(Duration(milliseconds: 200));
    for (var i = 0;
        i < PageModel[Get.find<Controllerinfo>().Model.value]!.length;
        i++) {
      await Future.delayed(Duration(milliseconds: 70));
      for (var j = 0; j < 10; j++) {
        await Future.delayed(Duration(milliseconds: 10));
        OpacityOption[i].value = OpacityOption[i].value + 0.1;
      }
    }
  }

  StartShowingItem()async {
    lenght.value = 0;
    int j = PageModel[Get.find<Controllerinfo>().Model.value]!.length;
    for (var i = 0; i < j; i++) {
      await Future.delayed(Duration(milliseconds: 300));
      lenght.value +=1;
    }
  }

  DisposeOpacity() {
    OpacityOption = List.generate(30, (i) => 0.0.obs).obs;
  }
}
