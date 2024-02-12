import 'package:flutter/material.dart';
import 'service_locator.dart';
import 'pages/home_page.dart';

void main() {
   // Initialize GetIt before running the app.
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
