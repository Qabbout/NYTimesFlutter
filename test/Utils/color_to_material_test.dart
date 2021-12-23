import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nyt_articles/Utils/color_to_material.dart';

void main() {
  test('Color should be converted to MaterialColor', () {
    const Color color = Color.fromRGBO(55, 224, 187, 1);
    final materiaColol = ColorToMaterialColor.getgetMaterialColorFrom(color);

    expect(materiaColol, isInstanceOf<MaterialColor>());
  });
}
