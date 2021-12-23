import 'package:flutter/material.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({
    Key? key,
    required this.article,
  }) : super(key: key);
  //TODO: change object to article when implemented
  final Object? article;
  static const routeName = '/articleDetailsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(),
    );
  }
}
