import 'package:flutter/material.dart';
import 'package:nyt_articles/Constants/theme_const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeConstant.themData,
      debugShowCheckedModeBanner: false,
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
            return Padding(
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
            );
          },
        ),
      ),
    );
  }
}
