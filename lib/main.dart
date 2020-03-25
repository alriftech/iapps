import 'package:flutter/material.dart';
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
      body: Center(
        child: SingleChildScrollView(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(LineAwesomeIcons.home, size: 30.0,), title: Text('1'),
          ),
          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.search, size: 30.0,), title: Text('1'),
          ),
          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.gratipay, size: 30.0,), title: Text('1'),
          ),
        ],
        onTap: onTapped,
      ),
    );
  }
}
