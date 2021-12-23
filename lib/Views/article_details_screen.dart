import 'package:flutter/material.dart';
import 'package:nyt_articles/Models/most_popular.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({
    Key? key,
    required this.articleResult,
  }) : super(key: key);
  final Result articleResult;
  static const routeName = '/articleDetailsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(articleResult.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(articleResult.resultAbstract),
        ),
      ),
    );
  }
}
