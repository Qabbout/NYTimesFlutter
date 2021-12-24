import 'package:flutter/material.dart';
import 'package:nyt_articles/Constants/theme_const.dart';
import 'package:nyt_articles/Models/most_popular.dart';
import 'package:nyt_articles/Models/result.dart';
import 'package:nyt_articles/Services/api_service.dart';
import 'package:nyt_articles/Views/article_details_screen.dart';

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
                  return ListView.builder(
                    itemCount: snapshot.data?.numResults,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () async {
                          await Navigator.pushNamed(
                            context,
                            ArticleDetailsScreen.routeName,
                            arguments: snapshot.data?.results[index],
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                            left: 8.0,
                            bottom: 8.0,
                          ),
                          child: ListTile(
                            key: Key(
                              index.toString(),
                            ),
                            leading: const Padding(
                              padding: EdgeInsets.only(
                                top: 8.0,
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                              ),
                            ),
                            title: Padding(
                              padding:
                                  const EdgeInsets.only(top: 6.0, bottom: 10.0),
                              child: Text(
                                snapshot.data?.results[index].title ?? "title",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            subtitle: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Text(
                                      snapshot.data?.results[index].byline ??
                                          "subtitle"),
                                ),
                                Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Row(children: [
                                      const Icon(
                                        Icons.calendar_today,
                                        size: 14,
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text(snapshot.data?.results[index]
                                              .publishedDate
                                              .toIso8601String()
                                              .substring(0, 10) ??
                                          "Date"),
                                    ])),
                              ],
                            ),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                    Icons.keyboard_arrow_right_rounded)),
                          ),
                        ),
                      );
                    },
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
