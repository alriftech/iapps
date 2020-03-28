import 'package:flutter/material.dart';

Map<int, Color> colorSwatch =
{
  50:Color.fromRGBO(44, 165, 163, .1),
  100:Color.fromRGBO(44, 165, 163, .2),
  200:Color.fromRGBO(44, 165, 163, .3),
  300:Color.fromRGBO(44, 165, 163, .4),
  400:Color.fromRGBO(44, 165, 163, .5),
  500:Color.fromRGBO(44, 165, 163, .6),
  600:Color.fromRGBO(44, 165, 163, .7),
  700:Color.fromRGBO(44, 165, 163, .8),
  800:Color.fromRGBO(44, 165, 163, .9),
  900:Color.fromRGBO(44, 165, 163, 1),
};

const mainBgColor = Color(0xFFf2f2f2);
const darkColor = Color(0xFF0B3535);
const midColor = Color(0xFF235251);
const lightColor = Color(0xFF2CA5A3);
const darkRedColor = Color(0xFFFA695C);
const lightRedColor = Color(0xFFFD685A);

const blueGradient = LinearGradient(
  colors: <Color>[darkColor, midColor, lightColor],
  stops: [0.0, 0.5, 1.0],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight
);

const redGradient = LinearGradient(
    colors: <Color>[darkRedColor, lightRedColor],
    stops: [0.0, 1.0],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight
);

const API_ENDPOINT  = "https://alriftech.com/api/v2/bot/aisha";
const USER_IMAGE    = "https://avatars3.githubusercontent.com/u/13685481";