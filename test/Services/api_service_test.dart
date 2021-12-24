import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nyt_articles/Models/most_popular.dart';
import 'package:nyt_articles/Models/result.dart';
import 'package:nyt_articles/Services/api_service.dart';

import 'api_service_test.mocks.dart';

@GenerateMocks([NYTimesAPIService])
Future main() async {
  MockNYTimesAPIService mockNYTimesAPIService = MockNYTimesAPIService();
  var result = Result(
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

  var tMostPopular = MostPopular(
      copyright: "copyright",
      numResults: 1,
      status: "status",
      results: [result]);

  test('should return an instance of Most Popular', () async {
    //arange
    when(mockNYTimesAPIService.getArticles())
        .thenAnswer((_) async => tMostPopular);

    //act
    var mostPopular = await mockNYTimesAPIService.getArticles();

    //asert
    verify(mockNYTimesAPIService.getArticles());
    expect(mostPopular, isInstanceOf<MostPopular>());
    reset(mockNYTimesAPIService);
  });

  test('should return a Most Popular that is not null', () async {
    //arange
    when(mockNYTimesAPIService.getArticles())
        .thenAnswer((_) async => tMostPopular);

    //act
    var mostPopular = await mockNYTimesAPIService.getArticles();

    //asert
    verify(mockNYTimesAPIService.getArticles());
    expect(mostPopular, isNotNull);
    reset(mockNYTimesAPIService);
  });

  test('should return Most Popular model with data', () async {
    //arange
    when(mockNYTimesAPIService.getArticles())
        .thenAnswer((_) async => tMostPopular);

    //act
    var mostPopular = await mockNYTimesAPIService.getArticles();

    //asert
    verify(mockNYTimesAPIService.getArticles());
    expect(mostPopular.numResults, isNonZero);
    reset(mockNYTimesAPIService);
  });
}
