import 'dart:convert';
import 'package:http/http.dart' as http;

class News {
  String news;

  News({this.news});

  factory News.fromJson(json) {
    return News(
      news: json['data'].toString()
    );
  }

  static Future getNews() async {
    String apiURL = "https://alriftech.com/api/v2/bot/aisha/news";

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);

    return News.fromJson(jsonObject);
  }
}