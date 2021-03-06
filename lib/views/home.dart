import 'package:flutter/material.dart';
import 'package:iapps/widgets/nb.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:iapps/styleguide.dart';
import 'package:iapps/utils.dart';
import 'package:iapps/widgets/moods.dart';
import 'package:iapps/models/news.dart';
import 'package:iapps/models/server.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _news = ".....";
  List<Server> _servers = List<Server>();

  void loadNews() {
    News.getNews().then((val) {
      setState(() {
        _news = val.news;
      });
    });
  }

  void loadServers() {
    _servers.clear();
    Server.getServers().then((val) {
      setState(() {
        _servers.addAll(val);
      });
    });
  }

  @override
  void initState() {
    super.initState();

    loadNews();
    loadServers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBgColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _buildTopStack(),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _buildNotificationCard(),
                  _buildDragonnestServerTitle(),
                  _buildDragonnestServerInfo(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack _buildTopStack() {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      overflow: Overflow.visible,
      children: <Widget>[
        _buildBackgroundCover(),
        _buildGreetings(),
        _buildMoodsHolder(),
      ],
    );
  }

  _buildBackgroundCover() {
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
          gradient: blueGradient,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
    );
  }

  _buildGreetings() {
    return Positioned(
      left: 30.0,
      bottom: 80.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Hai, Selamat datang!", style: greetingsTitleStyle),
          SizedBox(
            height: 5,
          ),
          Text(
            "Dalam aplikasi milik Informate.",
            style: greetingsSubtitleStyle,
          )
        ],
      ),
    );
  }

  _buildMoodsHolder() {
    return Positioned(
      bottom: -45,
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width - 40,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 5.5, blurRadius: 5.5)
          ],
        ),
        child: Moods(),
      ),
    );
  }

  _buildNotificationCard() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: lightColor, borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(
          LineAwesomeIcons.newspaper_o,
          color: Colors.white,
          size: 32,
        ),
        title: Text(
          _news,
          style: notificationCardStyle,
        ),
      ),
    );
  }

  _buildDragonnestServerTitle() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Server Tersedia",
            style: dnServerTitleStyle,
          ),
          GestureDetector(
            onTap: () {
              loadServers();
              _buildDragonnestServerInfo();
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

  _buildDragonnestServerInfo() {
    return Container(
      child: _servers.length == 0
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  _servers[index].longname +
                                      " (" +
                                      _servers[index].shortname.toUpperCase() +
                                      ")",
                                  style: dnServerInfoNameStyle,
                                ),
                                Container(
                                  width: 15,
                                  height: 15,
                                  decoration: (_servers[index].status == 1
                                      ? dnServerOnline
                                      : dnServerMaintenance),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Versi " + _servers[index].version),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Diupdate pada " +
                                  DateFormat("dd-MMM-yyyy hh:mm")
                                      .format(_servers[index].updated),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(_servers[index].IP,
                                style: dnServerInfoIPStyle),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: _servers.length,
              physics: const NeverScrollableScrollPhysics(),
            ),
    );
  }
}
