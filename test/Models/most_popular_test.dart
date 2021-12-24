import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nyt_articles/Models/most_popular.dart';
import 'package:nyt_articles/Models/result.dart';

import '../fixtures/fixture_reader.dart';

void main() {
  final result = Result(
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

  final tMostPopular = MostPopular(
      copyright: "copyright",
      numResults: 1,
      status: "status",
      results: [result]);

  test('should be a subclass of MostPopular Model', () async {
    var mostPopular = tMostPopular;
    expect(mostPopular, isInstanceOf<MostPopular>());
  });
  test('should return a valid MostPopular model', () async {
    // arrange
    final Map<String, dynamic> jsonMap =
        json.decode(fixture('most_popular.json'));

    // act
    final mostPopular = MostPopular.fromJson(jsonMap);

    // assert
    expect(mostPopular.toString(), tMostPopular.toString());
  });
}
