import 'dart:async';

import 'package:http/http.dart' as http;

class Api {
  static final Api _api = Api._internal();

  final String url = "games.marsadpro.com";

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
