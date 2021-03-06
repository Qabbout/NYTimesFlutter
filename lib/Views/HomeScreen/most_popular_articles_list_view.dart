import 'package:flutter/material.dart';
import 'package:nyt_articles/Models/most_popular.dart';
import 'package:nyt_articles/Views/ArticleDetailsScreen/article_details_screen.dart';

import '../ArticleDetailsScreen/article_details_screen.dart';

class MostPopularArticlesListView extends StatelessWidget {
  const MostPopularArticlesListView({Key? key, required this.snapshot})
      : super(key: key);
  final AsyncSnapshot<MostPopular> snapshot;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const Key("mostPopularArticlesListViewBuilder"),
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
                padding: const EdgeInsets.only(top: 6.0, bottom: 10.0),
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
                        snapshot.data?.results[index].byline ?? "subtitle"),
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
                        Text(snapshot.data?.results[index].publishedDate
                                .toIso8601String()
                                .substring(0, 10) ??
                            "Date"),
                      ])),
                ],
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.keyboard_arrow_right_rounded)),
            ),
          ),
        );
      },
    );
  }
}
