import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:iapps/views/home.dart';
import 'package:iapps/views/about.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    About(),
    About(),
    About(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              LineAwesomeIcons.home,
              size: 30.0,
            ),
            title: Text('Rumah'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              LineAwesomeIcons.search,
              size: 30.0,
            ),
            title: Text('Cari'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              LineAwesomeIcons.gratipay,
              size: 30.0,
            ),
            title: Text('Favorit'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              LineAwesomeIcons.globe,
              size: 30.0,
            ),
            title: Text('Tentang'),
          ),
        ],
        onTap: onTabTapped,
      ),
    );
  }
}