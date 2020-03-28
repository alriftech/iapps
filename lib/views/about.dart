import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:iapps/styleguide.dart';
import 'package:iapps/utils.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainBgColor,
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Informate Application v1.0.0", style: aboutTextStyle),
                  SizedBox(height: 20.0,),
                  Text("Aplikasi ini dibuat untuk komunitas gamer \"Informate\".", style: aboutSubtextStyle),
                  SizedBox(height: 50.0,),
                  Text("© 2020 Alrif Technology", style: aboutSubtextStyle,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
