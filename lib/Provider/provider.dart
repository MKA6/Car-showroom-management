import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rentcar/DbHelper/DbHelper.dart';
import 'package:rentcar/Model/Car.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class AppProvider extends ChangeNotifier {
  ThemeData themeData = ThemeData.light();
  ThemeData get getTheme => themeData;

  AppProvider(bool isDark) {
    Dark(isDark);
    DbHelper.dbHelper.initilizaDb().then((x) {
      getAllCars();
    });
  }

  void theme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (themeData == ThemeData.light()) {
      themeData = ThemeData.dark();
      sharedPreferences.setBool('isDark', true);
    } else {
      themeData = ThemeData.light();
      sharedPreferences.setBool('isDark', false);
    }
    notifyListeners();
  }

  Dark(bool isDark) {
    if (isDark) {
      // themeData = ThemeData.dark();
    } else {
      // themeData = ThemeData.light();
    }
    notifyListeners();
  }

  TextEditingController textCarNameController = TextEditingController();
  TextEditingController textCarColorController = TextEditingController();
  TextEditingController textCarDetailsController = TextEditingController();
  TextEditingController textCarManufactureCompanyController =
      TextEditingController();
  TextEditingController textCarImageController = TextEditingController();
  TextEditingController textPriceController = TextEditingController();
  TextEditingController textPowerController = TextEditingController();
  TextEditingController textRangeController = TextEditingController();
  TextEditingController textSeatController = TextEditingController();

  List<Car> allCar = [];
  Color mycolor = Colors.lightBlue;

  GlobalKey<FormState> formKey = GlobalKey();

  File? pickedImage;
  Uint8List? bytes;
  String? imsges64String;

  List<String>? item = [
    'Sold',
    'UnSold',
  ];
  String? selectedValue = 'Sold';

  selectedValues(String v) {
    selectedValue = v;
    notifyListeners();
  }

  pickImages() async {
    XFile? image;
    image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image!.path.isEmpty == false) {
      pickedImage = File(image.path);
      bytes = File(image.path).readAsBytesSync();
      imsges64String = base64Encode(bytes!);
    }
    log('imsges64String => ${imsges64String}');
    log('images2 => ${imsges64String.toString().length}');
    notifyListeners();
  }

  addNewCar() async {
    if (formKey.currentState!.validate()) {
      Car car = Car(
        carName: textCarNameController.text,
        Color: textCarColorController.text,
        details: textCarDetailsController.text,
        manufactureCompany: textCarManufactureCompanyController.text,
        image: imsges64String,
        price: textPriceController.text,
        power: textPowerController.text,
        range: textRangeController.text,
        seat: textSeatController.text,
        selectCategory: selectedValue,
      );
      pickedImage = null;
      textCarNameController.clear();
      textCarColorController.clear();
      textCarDetailsController.clear();
      textCarManufactureCompanyController.clear();
      textCarImageController.clear();
      textPriceController.clear();
      textPowerController.clear();
      textRangeController.clear();
      textSeatController.clear();

      await DbHelper.dbHelper.addNewCar(car);
      allCar.add(car);
    }
    // log('Car Add ${allCar.toString().length}');
    // log('Car image  => ${allCar[1].image}');
    notifyListeners();
  }

  getAllCars() async {
    List<Car> car = await DbHelper.dbHelper.getAllCar();
    allCar = car;
    log('get All Cars => ${allCar.toString().length}');
    notifyListeners();
    return car.remove(allCar.length);
  }

  Delete(int carId) async {
    await DbHelper.dbHelper.deleteCar(carId);
    getAllCars();
    log('message $carId this delete');
    notifyListeners();
    return allCar;
  }

  deleteCar(int recipeId) async {
    bool result = await DbHelper.dbHelper.deleteCar(recipeId);
    getAllCars();
    notifyListeners();
    log(result.toString());
    return result;
  }

  myColors(Color color) {
    mycolor = color;
    notifyListeners();
  }

  updateProductInCart(Car car) async {
    await DbHelper.dbHelper.updateCar(car);

    notifyListeners();
  }
}
