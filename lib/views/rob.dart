import 'package:flutter/material.dart';
import 'package:iapps/styleguide.dart';
import 'package:iapps/models/robs.dart';
import 'package:iapps/utils.dart';
import 'package:intl/intl.dart';

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
                  _buildRobInfo(),
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
      margin: EdgeInsets.only(top: 20.0),
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
              _buildRobInfo();
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

  _buildRobInfo() {
    return Container(
      child: _robs.length == 0
          ? CircularProgressIndicator()
          : ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
                  decoration: BoxDecoration(
                    color: _robs[index].nama == "BOT" ? Colors.black12 : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Nickname: " + _robs[index].nama, style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 2,),
                      Text("Class: " + _robs[index].job),
                      SizedBox(height: 10,),
                      Text("Didapatkan pada: " + DateFormat("dd-MMM-yyyy")
                          .format(_robs[index].waktu), style: dnServerInfoIPStyle),
                    ],
                  ),
                );
              },
              itemCount: _robs.length,
            ),
    );
  }
}
