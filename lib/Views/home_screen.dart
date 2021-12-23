import 'package:flutter/material.dart';
import 'package:nyt_articles/Constants/theme_const.dart';
import 'package:nyt_articles/Views/article_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeConstant.themData,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == ArticleDetailsScreen.routeName) {
          //TODO: cast object to article when implemented
          final article = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return ArticleDetailsScreen(
                article: article,
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
        body: ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () async {
                await Navigator.pushNamed(
                  context,
                  ArticleDetailsScreen.routeName,
                  //TODO: change object to article when implemented
                  arguments: Object(),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 8.0,
                  bottom: 8.0,
                ),
                child: ListTile(
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
                      "Title",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  subtitle: Stack(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 16.0),
                        child: Text(
                            "subtitleeeeeeeeeeeeeeessssseeeeeesseeeeeeeeeeeeeeeeeeeessssss"),
                      ),
                      Positioned(right: 0, bottom: 0, child: Text("Date")),
                    ],
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.keyboard_arrow_right_rounded)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
