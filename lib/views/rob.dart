import 'package:flutter/material.dart';
import 'package:iapps/styleguide.dart';
import 'package:iapps/models/robs.dart';
import 'package:iapps/utils.dart';

class Rob extends StatefulWidget {
  @override
  _RobState createState() => _RobState();
}

class _RobState extends State<Rob> {
  List<Robs> _robs = List<Robs>();

  void loadRobs() {
    _robs.clear();
    Robs.getRob().then((val) {
      setState(() {
        _robs.addAll(val);
      });
    });
  }

  @override
  void initState() {
    super.initState();

    loadRobs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBgColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildPageTitle(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  _buildRobTitle(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildPageTitle() {
    return Stack(
      children: <Widget>[
        Container(
          height: 100.0,
          decoration: BoxDecoration(
              color: lightColor,
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(50))),
        ),
        Positioned(
          left: 30.0,
          bottom: 30.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Rock of Blessing (7-hari)", style: pageTitleStyle),
            ],
          ),
        ),
      ],
    );
  }

  _buildRobTitle() {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Daftar RoB",
            style: dnServerTitleStyle,
          ),
          GestureDetector(
            onTap: () {
              loadRobs();
              // _buildDragonnestServerInfo();
            },
            child: Text(
              "Muat Ulang",
              style: dnServerSubtitleStyle,
            ),
          ),
        ],
      ),
    );
  }
}
