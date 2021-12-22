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
        appBar: AppBar(),
        drawer: const Drawer(),
      ),
    );
  }
}
