import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'Views/home_screen.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const HomeScreen());
}
