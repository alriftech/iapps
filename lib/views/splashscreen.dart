import 'package:flutter/material.dart';
import 'dart:async';
import 'package:iapps/utils.dart';
import 'package:iapps/views/index.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _startSplash() async {
    var duration = Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return Index();
      }));
    });
  }

  @override
  void initState() {
    super.initState();
    _startSplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: Center(
        child: Image.asset(
          "images/logo.png",
          width: 200.0,
          height: 100.0,
        ),
      ),
    );
  }
}
