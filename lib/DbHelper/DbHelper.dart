import 'dart:developer';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:rentcar/Model/Car.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();

  static DbHelper dbHelper = DbHelper._();
  static const String tableName = "Car";
  static const String carIdColumn = "id";
  static const String carNameColumn = "carName";
  static const String carDetailsColumn = "details";
  static const String carManufactureCompanyColumn = "manufactureCompany";
  static const String carImageColumn = "image";
  static const String carPriceColumn = "price";
  static const String carPowerColumn = "power";
  static const String carRangeColumn = "range";
  static const String carSeatColumn = "seat";
  static const String carSelectCategoryColumn = "selectCategory";
  static const String carColoreColumn = "color";

  late Database database;

  initilizaDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/tasks.db';
    database = await openDatabase(path, version: 1, onCreate: (db, v) {
      db.execute(
          'CREATE TABLE $tableName ($carIdColumn INTEGER PRIMARY KEY AUTOINCREMENT, $carNameColumn TEXT, $carColoreColumn TEXT, $carDetailsColumn TEXT, $carManufactureCompanyColumn TEXT, $carImageColumn TEXT, $carPriceColumn TEXT , $carPowerColumn TEXT, $carRangeColumn TEXT , $carSeatColumn TEXT , $carSelectCategoryColumn TEXT)');
    });
  }

  addNewCar(Car car) async {
    int rowIndex = await database.insert(tableName, car.toMap());
    log('row $rowIndex has been inserted');
  }

  Future<List<Car>> getAllCar() async {
    List<Map<String, Object?>> results = await database.query(tableName);
    List<Car> tasks = results.map((e) => Car.fromMap(e)).toList();
    log(' tasks => ${tasks.length.toString()}');
    return tasks;
  }

  Future<bool> deleteCar(int taskId) async {
    int deletedRowsCount =
        await database.delete(tableName, where: 'id=?', whereArgs: [taskId]);
    return deletedRowsCount > 0 ? true : false;
  }

  Future<bool> updateCar(Car car) async {
    int updatedRowsCount = await database
        .update(tableName, car.toMap(), where: 'id=?', whereArgs: [car.id]);
    return updatedRowsCount > 0 ? true : false;
  }

  getAllTables() async {
    final tables =
        await database.rawQuery('SELECT carName FROM tasks ORDER BY carName;');
    log(tables.toString());
  }
}
