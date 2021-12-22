import 'package:flutter/material.dart';
import 'package:nyt_articles/utils/color_to_material.dart';

class ThemeConstant {
  static final themData = ThemeData(
    primarySwatch: ColorToMaterialColor.getgetMaterialColorFrom(
        const Color.fromRGBO(55, 224, 187, 1)),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.white,
          actionsIconTheme: IconThemeData(
            color: Colors.white,
          )
      )
  );
}
