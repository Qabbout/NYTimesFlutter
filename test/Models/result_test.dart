import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nyt_articles/Models/result.dart';

import '../fixtures/fixture_reader.dart';

void main() {
  final tResult = Result(
      adxKeywords: "a",
      byline: "as",
      id: 1,
      nytdsection: "das",
      publishedDate: DateTime.parse("2020-10-10"),
      resultAbstract: "abstract",
      section: "section",
      title: "title",
      updated: DateTime.parse("2020-10-11"),
      uri: "uri",
      url: "url");

  test('should be a subclass of Result Model', () {
    var result = tResult;
    expect(result, isInstanceOf<Result>());
  });
  test('should return a valid Result model', () {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('result.json'));

    // act
    final result = Result.fromJson(jsonMap);

    // assert
    expect(result.toString(), tResult.toString());
  });
}
