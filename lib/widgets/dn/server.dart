import 'dart:convert';
import 'package:http/http.dart' as http;

class Server {
  int id;
  String shortname;
  String longname;
  String IP;

  Server({this.id, this.shortname, this.longname, this.IP});

  factory Server.createServer(object) {
    return Server(
      id: int.parse(object['id'].toString()),
      shortname: object['shortName'].toString(),
      longname: object['longName'].toString(),
      IP: object['ip'].toString(),
    );
  }

  static Future<List<Server>> getServers() async {
    String apiURL = "https://alriftech.com/api/v2/bot/aisha/server";

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);

    List<Server> servers = [];
    for (var server in jsonObject)
      servers.add(Server.createServer(server));

    return servers;
  }
}
