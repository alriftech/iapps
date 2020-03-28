import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:iapps/utils.dart';

class News {
  String news;

  News({this.news});

  factory News.fromJson(json) {
    return News(
      news: json['data'].toString()
    );
  }

  static Future getNews() async {
    String apiURL = API_ENDPOINT + "/news";

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);

    print("[INFO] : Get news data.");
    return News.fromJson(jsonObject);
  }
}