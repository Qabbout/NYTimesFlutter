import 'package:flutter/material.dart';
import 'package:nyt_articles/Constants/theme_const.dart';
import 'package:nyt_articles/Models/most_popular.dart';
import 'package:nyt_articles/Models/result.dart';
import 'package:nyt_articles/Services/api_service.dart';
import 'package:nyt_articles/Views/ArticleDetailsScreen/article_details_screen.dart';
import 'package:nyt_articles/Views/HomeScreen/most_popular_articles_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeConstants.themData,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == ArticleDetailsScreen.routeName) {
          final articleResult = settings.arguments as Result;
          return MaterialPageRoute(
            builder: (context) {
              return ArticleDetailsScreen(
                articleResult: articleResult,
              );
            },
          );
        }
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "NY Times Most Popular",
            overflow: TextOverflow.visible,
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        drawer: const Drawer(),
        body: RefreshIndicator(
          onRefresh: NYTimesAPIService.instance.getArticles,
          child: FutureBuilder(
            future: NYTimesAPIService.instance.getArticles(),
            builder:
                (BuildContext context, AsyncSnapshot<MostPopular> snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  return MostPopularArticlesListView(
                    snapshot: snapshot,
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
      ),
    );
  }
}
