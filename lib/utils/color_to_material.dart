import 'package:flutter/material.dart';

class ColorToMaterialColor {
  static MaterialColor getgetMaterialColorFrom(Color color) {
    final Map<int, Color> _colorMap = {
      50: color,
      100: color,
      200: color,
      300: color,
      400: color,
      500: color,
      600: color,
      700: color,
      800: color,
      900: color,
    };

    final MaterialColor _color = MaterialColor(color.value, _colorMap);
    return _color;
  }
}
