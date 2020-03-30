import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iapps/models/covid19.dart';
import 'package:iapps/styleguide.dart';
import 'package:iapps/utils.dart';
import 'package:intl/intl.dart';

class Covid extends StatefulWidget {
  @override
  _CovidState createState() => _CovidState();
}

class _CovidState extends State<Covid> {
  Covid19 _covid;
  String _lastUpdate = "---";

  void loadCovid() {
    Covid19.getCovid().then((val) {
      setState(() {
        _covid = val;
        _lastUpdate = DateFormat("dd-MMM-yyyy hh:mm").format(_covid.lastUpdate);
      });
    });
  }

  @override
  void initState() {
    super.initState();

    loadCovid();
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
                  _buildCovidTitle(),
                  _buildCovidInfo(),
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
              Text("Informasi Penyebaran COVID-19", style: pageTitleStyle),
            ],
          ),
        ),
      ],
    );
  }

  _buildCovidTitle() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Update pada",
            style: covidTitleStyle,
          ),
          GestureDetector(
            child: Text(
              _lastUpdate,
              style: covidSubtitleStyle,
            ),
          ),
        ],
      ),
    );
  }

  _buildCovidInfo() {
    return _covid == null ? CircularProgressIndicator() : Container(
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            child: Center(
              child: Card(
                  color: Colors.orange,
                  margin: EdgeInsets.only(right: 10, bottom: 10),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Positif",
                          style: covidCaseTitleStyle,
                        ),
                        Text(
                          _covid.confirmed.toString(),
                          style: covidCaseCountStyle,
                        )
                      ],
                    ),
                  )),
            ),
          ),
          Container(
            child: Center(
              child: Card(
                  color: Colors.yellow,
                  margin: EdgeInsets.only(left: 10, bottom: 10),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Dalam Perawatan",
                          style: covidCaseTitleStyle,
                        ),
                        Text(
                          _covid.activeCare.toString(),
                          style: covidCaseCountStyle,
                        )
                      ],
                    ),
                  )),
            ),
          ),
          Container(
            child: Center(
              child: Card(
                  color: Colors.redAccent,
                  margin: EdgeInsets.only(top: 10, right: 10),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Meninggal",
                          style: covidCaseTitleStyle,
                        ),
                        Text(
                          _covid.deaths.toString(),
                          style: covidCaseCountStyle,
                        )
                      ],
                    ),
                  )),
            ),
          ),
          Container(
            child: Center(
              child: Card(
                  color: Colors.green,
                  margin: EdgeInsets.only(left: 10, top: 10),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Sembuh",
                          style: covidCaseTitleStyle,
                        ),
                        Text(
                          _covid.recovered.toString(),
                          style: covidCaseCountStyle,
                        )
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}