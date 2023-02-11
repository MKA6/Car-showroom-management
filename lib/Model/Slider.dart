import 'dart:convert';

class Sliders {
  String? image1;

  Sliders({
    this.image1,
  });

  Map<String, dynamic> toMap() {
    return {
      'image1': image1,
    };
  }

  factory Sliders.fromMap(Map<String, dynamic> map) {
    return Sliders(
      image1: map['image1'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Sliders.fromJson(String source) =>
      Sliders.fromMap(json.decode(source));
}
