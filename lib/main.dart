import 'package:flutter/material.dart';
import 'package:iapps/styleguide.dart';
import 'package:iapps/utils.dart';
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
        primarySwatch: Colors.blue,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBgColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.topCenter,
              overflow: Overflow.visible,
              children: <Widget>[
                _buildBackgroundCover(),
                _buildGreetings(),
                _buildMoodsHolder(),
              ],
            ),
            SizedBox(height: 60,),

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
    );
  }

  _buildBackgroundCover() {
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
          gradient: purpleGradient,
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
          Text("Hi, Rifqi", style: greetingsTitleStyle),
          SizedBox(
            height: 5,
          ),
          Text(
            "How are you feeling today?",
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
          boxShadow: [BoxShadow(
            color: Colors.black12,
            spreadRadius: 5.5,
            blurRadius: 5.5
          )],
        ),
      ),
    );
  }
}
