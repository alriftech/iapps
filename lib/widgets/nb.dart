import 'package:flutter/material.dart';
import 'package:iapps/styleguide.dart';

class Nb extends StatefulWidget {
  @override
  _NbState createState() => _NbState();
}

class _NbState extends State<Nb> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ListTile(
        title: Text(
//          "Akan ada Noblesse Buff di Saint's Haven. Tanggal 01 Januari 2020 pukul 16:00:00 (GMT+8)",
          "Data noblesse belum ditemukan!",
          style: notificationCardBlackStyle,
        ),
      ),
    );
  }
}
