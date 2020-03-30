import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:iapps/utils.dart';

class Covid19 {
  DateTime lastUpdate;
  int confirmed;
  int deaths;
  int recovered;
  int activeCare;

  Covid19({this.lastUpdate, this.confirmed, this.deaths, this.recovered, this.activeCare});

  factory Covid19.fromJson(json) {
    return Covid19(
      lastUpdate: DateTime.parse(json['metadata']['lastUpdatedAt'].toString()),
      confirmed: int.parse(json['confirmed']['value'].toString()),
      deaths: int.parse(json['deaths']['value'].toString()),
      recovered: int.parse(json['recovered']['value'].toString()),
      activeCare: int.parse(json['activeCare']['value'].toString()),
    );
  }

  static Future getCovid() async {
    String apiURL = "https://kawalcovid19.harippe.id/api/summary";

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);

    print("[INFO] : Get covid data.");
    print(jsonObject['metadata']['lastUpdatedAt'].toString());
    return Covid19.fromJson(jsonObject);
  }
}