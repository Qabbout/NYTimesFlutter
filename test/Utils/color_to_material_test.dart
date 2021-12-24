import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nyt_articles/Utils/color_to_material.dart';

void main() {
  test('Color should be converted to MaterialColor', () {
    //arrange
    const Color color = Color.fromRGBO(55, 224, 187, 1);

    //act
    final materiaColol = ColorToMaterialColor.getgetMaterialColorFrom(color);

    //assert
    expect(materiaColol, isInstanceOf<MaterialColor>());
  });
}
