import 'package:flutter/material.dart';
import 'package:iapps/views/splashscreen.dart';
import 'package:iapps/utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MaterialColor colorCustom = MaterialColor(0xFF2CA5A3, colorSwatch);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Informate Apps',
      theme: ThemeData(
        primarySwatch: colorCustom,
      ),
      home: SplashScreen(),
    );
  }
}