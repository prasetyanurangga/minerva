import 'package:flutter/material.dart';
import 'package:minerva/pages/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Color(0xFFFFFFFF),
        primaryColor:    Color(0xFF302C98)
      ),
      home: MainPage(),
    );
  }
}
