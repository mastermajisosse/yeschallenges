import 'dart:async';

import 'package:http/http.dart' as http;

class Api {
  static final Api _api = Api._internal();

  // String appId = '081cd11ae3fdedee63c10a027b03dff5';
  // final String url = "api.openweathermap.org";

  final String url = "games.marsadpro.com";

//https://raw.githubusercontent.com/mastermajisosse/PalWeat/master/json.json
  //6077a3ce319a0b8acd55d08f087660da
  // i need to test = http://api.openweathermap.org/data/2.5/forecast?q=rabat&appid=081cd11ae3fdedee63c10a027b03dff5&units=metric
  factory Api() {
    return _api;
  }
  Api._internal();

  Future<http.Response> httpGet(String endPath, {Map<String, String> query}) {
    Uri uri = Uri.https(url, "$endPath");
    if (query != null) {
      uri = Uri.https(url, "$endPath", query);
    }
    return http.get(
      uri,
      headers: {
        'Accept': 'application/json',
      },
    );
  }

  Future<http.Response> httpPost(String endPath,
      {Map<String, String> query, Object body}) {
    Uri uri = Uri.http(url, "$endPath", null);
    print(uri);
    return http.post(
      uri,
      body: body,
      headers: {
        'Accept': 'application/json',
      },
    );
  }

  Future<http.Response> httpPut(String endPath,
      {Map<String, String> query, Object body, bool put}) {
    Uri uri = Uri.http(url, "$endPath", null);
    print(uri);

    return http.put(
      uri,
      body: body,
      headers: {
        'Accept': 'application/json',
      },
    );
  }
}
