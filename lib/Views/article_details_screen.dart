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
      appBar: AppBar(),
      body: const Center(),
    );
  }
}
