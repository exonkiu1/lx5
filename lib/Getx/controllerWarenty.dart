import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lx/DateBase/Model.dart';
import 'package:lx/Getx/ControllerDatabase.dart';
import 'package:lx/Getx/ControllerOther.dart';
import 'package:lx/Page/HomePage/HomePage.dart';
import 'package:lx/Page/Warrenty/Warrenty.dart';
import 'package:lx/WidgetUi/decoration.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
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
  RxString ModelPro = ''.obs;
  ///////////////////////////////////
  RxString SmsImei = ''.obs;
  ////
  GetWarenty(DevLX model) {
    Address.value = model.Address;
    City.value = model.City;
    DateWarrenty.value = model.DateWarrenty;
    NameClinet.value = model.NameClinet;
    NameTechnician.value = model.NameTechnician;
    PhoneClinet.value = model.PhoneClinet;
    PhoneTechnician.value = model.PhoneTechnician;
    Province.value = model.Province;
    ModelPro.value = model.ModelPro;
  }

  TextEditingController Tf_NameClinet = TextEditingController(),
      tf_PhoneClinet = TextEditingController(),
      tf_Address = TextEditingController(),
      Tf_NameTechnician = TextEditingController(),
      tf_PhoneTechnician = TextEditingController();
  RxString drp_city = "تبریز".obs;
  RxString drp_province = "آذربایجان شرقی".obs;
  SendImeiStartWarenty() async {
    final supabase = Supabase.instance.client;
     String imei = '';
    if (Get.find<Controllerother>()
        .TextInuiry
        .value.contains('A')) {
        imei = Get.find<Controllerother>()
        .TextInuiry
        .value
        .split('*A')[1]
        .substring(0, 15);
    } else {
        imei = Get.find<Controllerother>()
        .TextInuiry
        .value
        .split('**')[1]
        .substring(0, 15);
    }
   
    SmsImei.value = imei;
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
      Get.off(Warrenty());
    } else {
      /* final context = Get.context;
      ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          duration: Duration(seconds: 10),
          content: Text('گارانتی از قبل ثبت شده بود'))); */
      bool val = await CheckRegisterDev(imei);
      if (val) {
        Get.off(Homepage());
      } else {
        Get.off(Warrenty());
      }
    }
    //  Get.find<Controllerdatabase>().AddLx();
  }

  Future<bool> CheckRegisterDev(String imei) async {
    bool val = false;
    final supabase = Supabase.instance.client;
    final resultnameclinet = await supabase
        .from('lux')
        .select('name_clinet')
        .eq('imei', '${imei}')
        .maybeSingle();
    final dateStrnameclinet = resultnameclinet?['name_clinet'];
    if (dateStrnameclinet != null) {
      val = true;
      await Get.find<Controllerdatabase>().AddLx();
      GetInfoFromDataBase(imei);
    }
    return val;
  }

  GetInfoFromDataBase(String imei) async {
    final supabase = Supabase.instance.client;
    final model =
        await supabase.from('lux').select().eq('imei', '${imei}').maybeSingle();
    NameClinet.value = model?['name_clinet'];
    PhoneClinet.value = model?['phone_client'];
    Address.value = model?['address_client'];
    City.value = model?['city'];
    Province.value = model?['Province'];
    NameTechnician.value = model?['name_technician'];
    PhoneTechnician.value = model?['phone_technician'];
    ModelPro.value = model?['model'];
    DateWarrenty.value =
        '${DateTime.parse(model?['warranty_start_date']).toPersianDate()} ${DateTime.parse(model?['warranty_start_date']).hour}:${DateTime.parse(model?['warranty_start_date']).minute}';
    Get.find<Controllerdatabase>().UpdateLx();
  }

  RegisterDev() async {
    try {
      String imei = SmsImei.value;
      final supabase = Supabase.instance.client;
      await supabase
          .from('lux')
          .update({
            'name_clinet': Tf_NameClinet.text,
            'phone_client': tf_PhoneClinet.text,
            'address_client': tf_Address.text,
            'city': drp_city.value,
            'Province': drp_province.value,
            'name_technician': Tf_NameTechnician.text,
            'phone_technician': tf_PhoneTechnician.text,
          })
          .eq('imei', '${imei}')
          .maybeSingle();
      GetInfoFromDataBase(imei);
    } catch (e) {
      Get.bottomSheet(Container(
        decoration: decoration(color: true),
        child: Text('خطا:${e}'),
      ));
    }
    await Get.find<Controllerdatabase>().AddLx();
    Get.off(Homepage());
  }

  bool CheckCompliteInfoDev() {
    bool val = false;
    if (Tf_NameClinet.text.length > 2 &&
        tf_PhoneClinet.text.length > 2 &&
        tf_Address.text.length > 2 &&
        Tf_NameTechnician.text.length > 2 &&
        tf_PhoneTechnician.text.length > 2 &&
        drp_city.value.length > 1 &&
        drp_province.value.length > 1) {
      val = true;
    } else {
      final context = Get.context;
      ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          duration: Duration(seconds: 4),
          content: Row(
            children: [
              Icon(
                Icons.error,
                color: Colors.red,
              ),
              Text('همه اطلاعات را تکمیل کنید'),
            ],
          )));
    }
    return val;
  }
}
