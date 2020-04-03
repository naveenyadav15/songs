import 'package:flutter/material.dart';
import 'package:songs/UI/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Songs",
      theme: ThemeData(
        primaryColor: Color(0xFF736AB7),
      ),
      home: HomePage(),
    );
  }
}
