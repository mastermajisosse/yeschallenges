import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:yeschallenges/models/games.dart';
import 'package:yeschallenges/models/lawkhmodel.dart';
import 'package:yeschallenges/save.dart';
import 'package:yeschallenges/service/api.dart';

class Getdata {
  static final Getdata postServices = Getdata._internal();
  Getdata._internal();

  factory Getdata() {
    return postServices;
  }

  Api api = Api();

  List<Lawkh> listslawkh;
  List<Games> allgames;

  Future<List<Lawkh>> fetchlawkh() async {
    // listslawkh = List();
    // await api.httpGet('api/lawkh').then((response) {
    //   if (response.statusCode == 200) {
    //     var data = jsonDecode(response.body);
    //     if (data["data"] == null) {
    //       return null;
    //     }
    //     data["data"].forEach((l) {
    //       listslawkh.add(Lawkh.fromJson(l));
    //     });
    //   } else {
    //     throw Exception('Failed to load album ');
    //   }
    // });
    // return listslawkh;
  }

  Future<List<Games>> fetchallg(lang) async {
    allgames = List();
    await api.httpGet('api/allgames').then((response) {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data["data"] == null) {
          return null;
        }
        data["data"].forEach((l) {
          if (l["name"] != Save.app_name && l["lang"] == lang.toString()) {
            allgames.add(Games.fromJson(l));
          }
        });
      } else {
        throw Exception('Failed to load album ');
      }
    });
    print(allgames.length);
    return allgames;
  }

  // //////////////////

  Future addlawkh(String first, String second) async {
    // add comments
    return await api.httpPost('api/lawkh', body: {
      'first': first,
      'second': second,
      'votes': "0",
      'votes2': "0",
      'accepted': "0",
    }).then((reponse) {
      var data = jsonDecode(reponse.body);
      print(data);
      print('Response status: ${reponse.statusCode}');
    });
  }

  ///
  /// votes

  Future voteA(String id) async {
    return await api.httpPut('api/upvote/' + id).then((reponse) {
      // var data = jsonDecode(reponse.body);
      // print(data);
      print('Response status: ${reponse.statusCode}');
    });
  }

  Future voteB(String id) async {
    return await api.httpPut('api/upvoteb/' + id).then((reponse) {
      // var data = jsonDecode(reponse.body);
      // print(data);
      print('Response status: ${reponse.statusCode}');
    });
  }
}
