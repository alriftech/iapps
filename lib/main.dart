import 'package:flutter/material.dart';
import 'package:iapps/styleguide.dart';
import 'package:iapps/utils.dart';
import 'package:iapps/widgets/moods.dart';
import 'package:iapps/widgets/dn/server.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Informate Apps',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void onTapped(int val) {
    setState(() {
      _selectedIndex = val;
    });
  }

  _getServerData() {
    Server.getServers().then((servers) {
      // return _buildDragonnestServerInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    _buildDragonnestServerCard(),
                    // _getServerData(),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                LineAwesomeIcons.home,
                size: 30.0,
              ),
              title: Text('1'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                LineAwesomeIcons.search,
                size: 30.0,
              ),
              title: Text('1'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                LineAwesomeIcons.gratipay,
                size: 30.0,
              ),
              title: Text('1'),
            ),
          ],
          onTap: onTapped,
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
          "Akan ada update pada tanggal\n01 Januari 2021",
          style: notificationCardStyle,
        ),
      ),
    );
  }

  _buildDragonnestServerTitle() {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Server Tersedia",
            style: dnServerTitleStyle,
          ),
          GestureDetector(
//            onTap: () {
//              _getServerData();
//            },
            child: Text(
              "Lihat Semua",
              style: dnServerSubtitleStyle,
            ),
          ),
        ],
      ),
    );
  }

  _buildDragonnestServerInfo() {
    return Container();
  }

  _buildDragonnestServerCard() {
    return Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
      padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
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
                      "Southeast Asia (SEA)",
                      style: dnServerInfoNameStyle,
                    ),
                    Container(
                      width: 15,
                      height: 15,
                      decoration: dnServerOnline,
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text("Versi 123"),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "Diupdate pada 27 Maret 2020 12:00:00",
                ),
                SizedBox(
                  height: 10,
                ),
                Text("127.127.127.127:3000", style: dnServerInfoIPStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
