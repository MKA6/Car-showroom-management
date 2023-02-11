import 'dart:convert';

class Car {
  String? carName;
  String? Color;
  String? details;
  String? manufactureCompany;
  String? image;
  String? price;
  String? power;
  String? range;
  String? seat;
  String? selectCategory;
  int? id;

  Car({
    this.carName,
    this.Color,
    this.details,
    this.manufactureCompany,
    this.image,
    this.price,
    this.power,
    this.range,
    this.seat,
    this.selectCategory,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "carName": carName ?? '',
      "Color": Color ?? '',
      "details": details ?? '',
      "manufactureCompany": manufactureCompany ?? '',
      "image": image ?? '',
      "price": price ?? '',
      "power": power ?? '',
      "range": range ?? '',
      "selectCategory": selectCategory ?? '',
      "seat": seat ?? '',
    };
  }

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      carName: map["carName"] as String,
      Color: map["Color"],
      details: map["details"],
      manufactureCompany: map["manufactureCompany"],
      image: map["image"],
      price: map["price"],
      power: map["power"],
      range: map["range"],
      seat: map["seat"],
      selectCategory: map["selectCategory"],
      id: map["id"],
    );
  }

  String toJson() => json.encode(toMap());

  factory Car.fromJson(String source) =>
      Car.fromMap(json.decode(source) as Map<String, dynamic>);
}
