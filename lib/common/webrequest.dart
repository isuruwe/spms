import 'dart:convert';

import 'package:http/http.dart' as http;
class webrequest {


Future<List> getplayers() async {
  String domaine = "135.22.67.71/spms/";
  String linkToPhp = "getplayer.ashx";
  var data = {
    "p1": '15', "p2": '1',
  };
  var response = await http.post(
    Uri.http(domaine, linkToPhp),
    body: data,
  );

  if (response.statusCode == 200) {
    if (response.body.isNotEmpty) {
      var result = jsonDecode(response.body);
      print(result.toString());
      if (result == false) {
        return ["EROOR"];
      }
     // name = result['Table'];
      return result['Table'];
      return [];
    }
    return [];
  } else {
    throw Exception('Erreur connection serveur.');
  }
}
}