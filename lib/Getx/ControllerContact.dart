import 'package:flutter/widgets.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:get/get.dart';
import 'package:lx/Getx/ControllerInfo.dart';
import 'package:lx/Getx/ControllerOther.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ControllerDatabase.dart';

int lenghtContact = 26;

class Controllercontact extends GetxController {
  RxList<TextEditingController> TfName =
      List.generate(lenghtContact, (i) => TextEditingController()).obs;
  RxList<TextEditingController> TfPhone =
      List.generate(lenghtContact, (i) => TextEditingController()).obs;
  RxList<RxString> Level = List.generate(lenghtContact, (i) => 'LLLL'.obs).obs;
  RxList<RxString> Part = List.generate(lenghtContact, (i) => '1'.obs).obs;
  // RxList<RxInt> Index = List.generate(lenghtContact, (i) => 1.obs).obs;
  ////
  RxString ShowPart = ''.obs;
  RxBool MainContact = false.obs;
  RxList<int> List_Contact = <int>[].obs;

  ///
  Future<String> RegisterContact({int i = 0, String value = 'A'}) async {
    UpdateContact();
    String code = '';
    for (var i = 0; i < 26; i++) {
      if (TfPhone[i].text.length == 11) {
        code = code + '${i + 1}*${TfPhone[i].text}${Level[i].value}';
      }
    }
    ShowPart.value = '';
    return '31*${code}';
  }

  Future<String> AddOneContact(int i) async {
    UpdateContact();
    String code = '';

    if (TfPhone[i].text.length == 11) {
      code = code + '${i + 1}*${TfPhone[i].text}${Level[i].value}';
    } else {
      Get.snackbar('خطا', 'طول شماره تلفن دستگاه باید 11 رقم باشد');
    }

    ShowPart.value = '';
    return '31*${code}';
  }

  Future<String> ChangePart() async {
    String val = '';
    for (var i = 0; i < lenghtContact; i++) {
      if (Part[i].value != '8') {
        val = val + Part[i].value;
      } else {
        val = val + '0';
      }
    }
    UpdateContact();
    ShowPart.value = '';
    return 'LUXSWS$val';
  }

  Future<String> DeleteContact(int i) async {
    TfName[i].text = '';
    TfPhone[i].text = '';
    Level[i].value = 'LLLL';
    UpdateContact();
    return '${i + 1}*D';
  }

  InquiryContact() {
    List<String> ListContact = Get.find<Controllerother>()
        .TextInuiry
        .value
        .substring(1)
        .replaceAll('#', '')
        .split('*');
    print(ListContact.length);
    List_Contact.value = [];
    for (var i = 0; i < ListContact.length; i++) {
      TfPhone[i].text = '';
    }
    for (var i = 0; i < ListContact.length; i++) {
      TfPhone[i].text = ListContact[i].substring(0, 11);
      Level[i].value = ListContact[i][11];
    }
    for (var i = 0; i < ListContact.length; i++) {
      if (TfPhone[i].text.length != 11) {
        TfName[i].text = '';
      }
    }
    UpdateContact();
  }

  InquiryPart() {
    String message = Get.find<Controllerother>().TextInuiry.value;
    for (var i = 0; i < lenghtContact; i++) {
      Part[i].value = message[i];
    }
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    prefs.setBool('MainContact', true);
    MainContact.value = true;
    List_Contact.value = List.generate(lenghtContact, (i) => i);
    UpdateContact();
  }

  GetContact(String id) async {
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    List<String> copy_contact = await prefs.getStringList('${id}contact') ?? [];

    TfName.value = List.generate(
      lenghtContact,
      (i) => TextEditingController(text: copy_contact[i].split(CodeSplite)[0]),
    ).obs;
    TfPhone.value = List.generate(
      lenghtContact,
      (i) => TextEditingController(text: copy_contact[i].split(CodeSplite)[1]),
    ).obs;
    Level.value = List.generate(
      lenghtContact,
      (i) => copy_contact[i].split(CodeSplite)[2].obs,
    ).obs;

    Part.value = List.generate(
      lenghtContact,
      (i) => copy_contact[i].split(CodeSplite)[3].obs,
    ).obs;
    MainContact.value = await prefs.getBool('MainContact') ?? false;
    List<String> copylistcontact =
        await prefs.getStringList('${id}ListContact') ?? [];
    List_Contact.value = List.generate(
      copylistcontact.length,
      (i) => int.parse(copylistcontact[i]),
    );
  }

  AddContact(String id) async {
    List<String> ValueContact = [];
    for (var i = 0; i < lenghtContact; i++) {
      ValueContact.add('$CodeSplite${CodeSplite}${CodeSplite}1');
    }

    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    await prefs.setBool('MainContact', false);
    await prefs.setStringList('${id}ListContact', []);
    await prefs.setStringList('${id}contact', ValueContact);
  }

  SelectContact(int i) async {
    final FlutterContactPicker _contactPicker = new FlutterContactPicker();
    Contact? contact1 = await _contactPicker.selectContact();
    if (contact1 != null) {
      TfName[i].text = contact1.fullName.toString();
      TfPhone[i].text =
          contact1.phoneNumbers![0].replaceAll(' ', '').replaceAll('+98', '0');
    }
  }

  UpdateContact() async {
    List<String> valueContact = [];
    for (var i = 0; i < lenghtContact; i++) {
      valueContact.add(
        '${TfName[i].text}${CodeSplite}${TfPhone[i].text}${CodeSplite}${Level[i].value}${CodeSplite}${Part[i].value}',
      );
    }

    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    await prefs.setStringList(
      '${Get.find<Controllerinfo>().id.value}ListContact',
      List.generate(List_Contact.length, (i) => '${List_Contact[i]}'),
    );
    await prefs.setStringList(
      '${Get.find<Controllerinfo>().id.value}contact',
      valueContact,
    );
  }
}
