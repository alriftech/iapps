import 'package:flutter/material.dart';

class Moods extends StatefulWidget {
  @override
  _MoodsState createState() => _MoodsState();
}

class _MoodsState extends State<Moods> {
  List<bool> isSelecketed = List.generate(5, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ToggleButtons(
        selectedBorderColor: Colors.blue,
        renderBorder: false,
        fillColor: Colors.transparent,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Icon(
              Icons.sentiment_very_dissatisfied,
              size: 36.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Icon(
              Icons.sentiment_dissatisfied,
              size: 36.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Icon(
              Icons.sentiment_neutral,
              size: 36.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Icon(
              Icons.sentiment_satisfied,
              size: 36.0,
            ),
          ),
          Icon(
            Icons.sentiment_very_satisfied,
            size: 36.0,
          ),
        ],
        isSelected: isSelecketed,
        onPressed: (int index) {
          setState(() {
            isSelecketed[index] = !isSelecketed[index];
          });
        },
      ),
    );
  }
}
