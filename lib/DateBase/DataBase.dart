import 'package:lx/DateBase/Model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseLX {
  static final DatabaseLX instance = DatabaseLX._init();

  static Database? _database;

  DatabaseLX._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('DatabaseLX.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE DatabaseLX(id TEXT,Phone TEXT,Name TEXT,StateDev TEXT,Pass TEXT,Charge TEXT,UrbanElectricity TEXT,Speaker TEXT,BatterPower TEXT,CountContact TEXT,CountRemote TEXT,AntennaStrength TEXT,CommunicationsStatus TEXT,zon1 TEXT,zon2 TEXT,zon3 TEXT,zon4 TEXT,DevLanguage TEXT,EstablishingContactDuringPowerOutage TEXT,SemiActiveStatusRemote TEXT,PeriodicBatteryReport TEXT,InventoryReport TEXT,AlarmTime TEXT,AlarmMode TEXT,Model TEXT,Oprator TEXT,Simcard TEXT)",
        );
      },
      onUpgrade: (db, oldVersion, newVersion) =>
          _onUpgrade(db, oldVersion, newVersion),
    );
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      print('old version 1');
      await db.execute('ALTER TABLE DatabaseLX ADD COLUMN Simcard TEXT');
    }
  }

  //
  Future<void> AddDev(DevLX dev) async {
    final db = await instance.database;

    await db.insert(
      'DatabaseLX',
      dev.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //
  Future<List<DevLX>> GetDevs() async {
    final Database db = await instance.database;

    final List<Map<String, dynamic>> maps = await db.query('DatabaseLX');

    return List.generate(maps.length, (i) {
      return DevLX(
          id: maps[i]['id'],
          Name: maps[i]['Name'],
          Phone: maps[i]['Phone'],
          AlarmMode: maps[i]['AlarmMode'],
          AlarmTime: maps[i]['AlarmTime'],
          AntennaStrength: maps[i]['AntennaStrength'],
          BatterPower: maps[i]['BatterPower'],
          Charge: maps[i]['Charge'],
          CommunicationsStatus: maps[i]['CommunicationsStatus'],
          CountContact: maps[i]['CountContact'],
          CountRemote: maps[i]['CountRemote'],
          DevLanguage: maps[i]['DevLanguage'],
          EstablishingContactDuringPowerOutage: maps[i]
              ['EstablishingContactDuringPowerOutage'],
          InventoryReport: maps[i]['InventoryReport'],
          Pass: maps[i]['Pass'],
          PeriodicBatteryReport: maps[i]['PeriodicBatteryReport'],
          SemiActiveStatusRemote: maps[i]['SemiActiveStatusRemote'],
          Speaker: maps[i]['Speaker'],
          StateDev: maps[i]['StateDev'],
          UrbanElectricity: maps[i]['UrbanElectricity'],
          zon1: maps[i]['zon1'],
          zon2: maps[i]['zon2'],
          zon3: maps[i]['zon3'],
          zon4: maps[i]['zon4'],
          Oprator: maps[i]['Oprator'],
          Model: maps[i]['Model'],
          Simcard: maps[i]['Simcard'] ?? '-1');
    });
  }

  Future<void> UpdateDev(DevLX dev) async {
    final db = await database;

    await db.update(
      'DatabaseLX',
      dev.toMap(),
      where: "id = ?",
      whereArgs: [dev.id],
    );
  }

  ///
  ///
  Future<void> DeleteDev(String id) async {
    final db = await database;

    await db.delete(
      'DatabaseLX',
      where: "id = ?",
      whereArgs: [id],
    );

/*     Get.find<controllertext>(tag: 'first').notes.clear();
    Get.find<controllertext>(tag: 'first').notes = await instance.notes(); */
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
