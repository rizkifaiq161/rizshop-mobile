import 'package:flutter/material.dart';
import 'package:rizshop/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rizshop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.blue, // Light blue as primary color
        ).copyWith(secondary: Colors.blue[900]), // Dark blue as secondary color
        useMaterial3: true,
      ),
      home : MyHomePage(),
    );
  }
}

