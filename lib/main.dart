import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'Views/HomeScreen/home_screen.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const HomeScreen());
}
