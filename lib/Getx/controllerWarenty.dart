import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerDatabase.dart';
import 'package:lx/Getx/ControllerOther.dart';
import 'package:lx/Page/HomePage/HomePage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Controllerwarrenty extends GetxController {
  RxString NameClinet = ''.obs;
  RxString PhoneClinet = ''.obs;
  RxString City = ''.obs;
  RxString Province = ''.obs;
  RxString Address = ''.obs;
  RxString DateWarrenty = ''.obs;
  RxString NameTechnician = ''.obs;
  RxString PhoneTechnician = ''.obs;
  ///////////////////////////////////
  TextEditingController Tf_NameClinet = TextEditingController(),
      tf_PhoneClinet = TextEditingController(),
      tf_Address = TextEditingController(),
      Tf_NameTechnician = TextEditingController(),
      tf_PhoneTechnician = TextEditingController();
  SendImeiStartWarenty() async {
    final supabase = Supabase.instance.client;

    String imei = Get.find<Controllerother>()
        .TextInuiry
        .value
        .replaceAll('*', '')
        .replaceAll('#', '');
    final result = await supabase
        .from('lux')
        .select('warranty_start_date')
        .eq('imei', '${imei}')
        .maybeSingle();
    final dateStr = result?['warranty_start_date'];
    if (dateStr == null || dateStr.toString().isEmpty) {
      final now = DateTime.now().toIso8601String();
      await supabase
          .from('lux')
          .update({'warranty_start_date': now}).eq('imei', '${imei}'); //
      final context = Get.context;
      ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          duration: Duration(seconds: 10), content: Text('گارانتی ثبت شد')));
      Get.off(Homepage());
    } else {
      final context = Get.context;
      ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          duration: Duration(seconds: 10),
          content: Text('گارانتی از قبل ثبت شده بود')));

      Get.off(Homepage());
    }
    Get.find<Controllerdatabase>().AddLx();
  }
}
