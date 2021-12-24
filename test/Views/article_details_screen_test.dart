import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nyt_articles/Models/result.dart';
import 'package:nyt_articles/Views/ArticleDetailsScreen/article_details_screen.dart';

import '../Fixtures/fixture_reader.dart';

void main() {
  final articleResult = Result.fromRawJson(fixture('result.json'));
  testWidgets(
    "should have an appbar with title description",
    (WidgetTester tester) async {
      //arrange
      await tester.pumpWidget(
        MaterialApp(
          home: ArticleDetailsScreen(
            articleResult: articleResult,
          ),
        ),
      );

      //act
      final appBarTitle = find.text(articleResult.title);

      //assert
      expect(appBarTitle, findsOneWidget);
    },
  );
  testWidgets(
    "should have an center text with abstract description",
    (WidgetTester tester) async {
      //arrange
      await tester.pumpWidget(
        MaterialApp(
          home: ArticleDetailsScreen(
            articleResult: articleResult,
          ),
        ),
      );

      //act
      final appBarTitle = find.text(articleResult.resultAbstract);

      //assert
      expect(appBarTitle, findsOneWidget);
    },
  );
}
