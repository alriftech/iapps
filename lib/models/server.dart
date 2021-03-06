import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:iapps/utils.dart';

class Server {
  int id;
  String shortname;
  String longname;
  String version;
  String IP;
  int status;
  DateTime updated;

  Server({this.id, this.shortname, this.longname, this.version, this.IP, this.status, this.updated});

  factory Server.fromJson(json) {
    return Server(
      id: int.parse(json['id'].toString()),
      shortname: json['shortName'].toString(),
      longname: json['longName'].toString(),
      version: json['version'].toString(),
      IP: json['ip'].toString(),
      status: int.parse(json['server'].toString()),
      updated: DateTime.parse(json['updated_at'].toString()),
    );
  }

  static Future<List<Server>> getServers() async {
    String apiURL = API_ENDPOINT + "/server";

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);

    var servers = List<Server>();
    for (var server in jsonObject)
      servers.add(Server.fromJson(server));

    print("[INFO] : Get server data.");
    return servers;
  }
}
