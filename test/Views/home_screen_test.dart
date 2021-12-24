import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nyt_articles/Models/most_popular.dart';
import 'package:nyt_articles/Models/result.dart';
import 'package:nyt_articles/Services/api_service.dart';
import 'package:nyt_articles/Views/HomeScreen/most_popular_articles_list_view.dart';

import '../Fixtures/fixture_reader.dart';
import '../Services/api_service_test.mocks.dart';

@GenerateMocks([NYTimesAPIService])
void main() {
  MockNYTimesAPIService mockNYTimesAPIService = MockNYTimesAPIService();
  var result = Result.fromRawJson(fixture('result.json'));

  var tMostPopular = MostPopular(
      copyright: "copyright",
      numResults: 1,
      status: "status",
      results: [
        result,
        result,
      ]);

  testWidgets(
    "should have a listview.builder",
    (WidgetTester tester) async {
      //arrange
      TestWidgetsFlutterBinding.ensureInitialized();
      when(mockNYTimesAPIService.getArticles())
          .thenAnswer((_) async => tMostPopular);
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: FutureBuilder(
            future: mockNYTimesAPIService.getArticles(),
            builder: (context, AsyncSnapshot<MostPopular> snapshot) {
              return MostPopularArticlesListView(snapshot: snapshot);
            },
          ),
        ),
      ));
      final mostPopularArticlesListViewBuilder =
          find.byKey(const Key("mostPopularArticlesListViewBuilder"));

      //act

      //assert
      expect(mostPopularArticlesListViewBuilder, findsOneWidget);
    },
  );
  testWidgets(
    "should show 'failed to load' on error",
    (WidgetTester tester) async {
      //arrange
      TestWidgetsFlutterBinding.ensureInitialized();
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: FutureBuilder(
            future: Future.value(null),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  return MostPopularArticlesListView(
                    snapshot: snapshot as AsyncSnapshot<MostPopular>,
                  );
                } else {
                  return const Center(
                    child: Text("Failed to load"),
                  );
                }
              }
            },
          ),
        ),
      ));
      await tester.pumpAndSettle();
      final failedToLoadText = find.text("Failed to load");

      //act

      //assert
      expect(failedToLoadText, findsOneWidget);
    },
  );
}
