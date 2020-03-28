import 'dart:convert';
import 'package:http/http.dart' as http;

class Robs {
  String nama;
  String job;
  DateTime waktu;

  Robs({this.nama, this.job, this.waktu});

  factory Robs.fromJson(json) {
    return Robs(
        nama: json['name'].toString(),
        job: json['class'].toString(),
        waktu: DateTime.parse(json['date'].toString()),
    );
  }

  static Future<List<Robs>> getRob() async {
    String apiURL = "https://alriftech.com/api/v2/bot/aisha/rob";

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);

    var robs = List<Robs>();
    for (var server in jsonObject)
      robs.add(Robs.fromJson(server));

    print("[INFO] : Get rob data.");
    return robs;
  }
}