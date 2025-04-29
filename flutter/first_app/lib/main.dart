import 'package:first_app/first_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// custom Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}
