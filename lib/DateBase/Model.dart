import 'package:get/get_connect/http/src/request/request.dart';

class DevLX {
  String id;
  String Phone;
  String Name;
  String StateDev;
  String Pass;
  String Charge;
  //
  String UrbanElectricity;
  String Speaker;
  String BatterPower;
  String CountContact;
  String CountRemote;
  String AntennaStrength;
  String CommunicationsStatus;
  String zon1;
  String zon2;
  String zon3;
  String zon4;
  //
  String DevLanguage;
  String EstablishingContactDuringPowerOutage;
  String SemiActiveStatusRemote;
  String PeriodicBatteryReport;
  String InventoryReport;
  String AlarmTime;
  String AlarmMode;
  String Model;
  String Oprator;
  String Simcard;
  DevLX(
      {required this.id,
      required this.Phone,
      required this.Name,
      required this.Oprator,
      this.Model = '1000',
      this.StateDev = 'on',
      this.Pass = '0000',
      this.Charge = '0',
      this.UrbanElectricity = 'روشن',
      this.Speaker = 'روشن',
      this.BatterPower = '',
      this.CountContact = '',
      this.CountRemote = '',
      this.AntennaStrength = '',
      this.CommunicationsStatus = '',
      this.zon1 = 'بسته',
      this.zon2 = 'بسته',
      this.zon3 = 'بسته',
      this.zon4 = 'بسته',
      this.DevLanguage = 'per',
      this.EstablishingContactDuringPowerOutage = 'false',
      this.SemiActiveStatusRemote = 'false',
      this.PeriodicBatteryReport = '10',
      this.InventoryReport = '12',
      this.AlarmTime = '10',
      this.AlarmMode = 'ابتدا پیامک سپس تماس با تکرار',
      this.Simcard = '-1'});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'Phone': Phone,
      'Name': Name,
      'StateDev': StateDev,
      'Pass': Pass,
      'Charge': Charge,
      'UrbanElectricity': UrbanElectricity,
      'Speaker': Speaker,
      'BatterPower': BatterPower,
      'CountContact': CountContact,
      'CountRemote': CountRemote,
      'AntennaStrength': AntennaStrength,
      'CommunicationsStatus': CommunicationsStatus,
      'zon1': zon1,
      'zon2': zon2,
      'zon3': zon3,
      'zon4': zon4,
      'DevLanguage': DevLanguage,
      'EstablishingContactDuringPowerOutage':
          EstablishingContactDuringPowerOutage,
      'SemiActiveStatusRemote': SemiActiveStatusRemote,
      'PeriodicBatteryReport': PeriodicBatteryReport,
      'InventoryReport': InventoryReport,
      'AlarmTime': AlarmTime,
      'AlarmMode': AlarmMode,
      'Model': Model,
      'Oprator': Oprator,
      'Simcard': Simcard
    };
  }

  @override
  String toString() {
    return 'DevLX{id:$id,Phone:$Phone,Name:$Name,StateDev:$StateDev,Pass:$Pass,Charge:$Charge,UrbanElectricity:$UrbanElectricity,Speaker:$Speaker,BatterPower:$BatterPower,CountContact:$CountContact,CountRemote:$CountRemote,AntennaStrength:$AntennaStrength,CommunicationsStatus:$CommunicationsStatus,zon1:$zon1,zon2:$zon2,zon3:$zon3,zon4:$zon4,DevLanguage:$DevLanguage,EstablishingContactDuringPowerOutage:$EstablishingContactDuringPowerOutage,EstablishingContactDuringPowerOutage:$EstablishingContactDuringPowerOutage,PeriodicBatteryReport:$PeriodicBatteryReport,InventoryReport:$InventoryReport,AlarmTime:$AlarmTime,AlarmMode:$AlarmMode,Model:$Model,Oprator:$Oprator,Simcard:$Simcard}';
  }
}
