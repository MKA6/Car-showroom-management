import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navKey = GlobalKey();

  static showColorDialog() {
    showDialog(
      context: navKey.currentContext!,
      builder: (context) {
        return AlertDialog(
          actions: [
            MaterialColorPicker(
              onColorChange: (Color color) {},
              onMainColorChange: (coloes) {},
              selectedColor: Colors.red,
              circleSize: 20,
            ),
          ],
        );
      },
    );
  }
}
