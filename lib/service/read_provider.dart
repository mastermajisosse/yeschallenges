import 'dart:math';

import 'package:yeschallenges/models/games.dart';
import 'package:yeschallenges/models/lawkhmodel.dart';
import 'package:yeschallenges/service/getdata.dart';
import 'package:yeschallenges/service/provider_basemodel.dart';

class ReadData extends BaseModel {
  int muchtime = 0;
  get muchtimes => muchtime;

  int i = 0;
  get index => i;

  List<Lawkh> lawkhList = List();
  get lawlist => lawkhList;

  List<Games> allgame = List();
  Getdata getdata = Getdata();

  getall() async {
    setBusy(true);
    // if (lawkhList.length < 1) {
    lawkhList = await getdata.fetchlawkh().whenComplete(() {
      setBusy(false);
    });
    lawkhList..shuffle();
    // print(lawkhList.toString());
    notifyListeners();
    // }
  }

  getallgame(lang) async {
    setBusy(true);
    allgame = await getdata.fetchallg(lang).whenComplete(() {
      print("hila");

      setBusy(false);
    });
    notifyListeners();
  }

  next() {
    can = 0;
    i++;
    notifyListeners();
  }

  setmuch({bool azero = false}) {
    muchtime += 1;
    if (azero == true) {
      muchtime = 0;
    }
    print("setmuch" + muchtime.toString());
    notifyListeners();
  }

  /////////////
  /// gameplay fun
  get getdone => can;
  int can = 0;

  clicke(controller, x, id) async {
    if (can == 0) {
      if (x == 1) {
        print("a");
        await getdata.voteA(id.toString());
      } else {
        print("b");
        await getdata.voteB(id.toString());
      }
      controller.forward();
      can = 1;
    } else if (can == 1) {
      tap(controller);
    }
    notifyListeners();
  }

  tap(controller) {
    can = 3;
    controller.reverse();
    Future.delayed(Duration(seconds: 2)).then((value) {
      next();
    });
  }

  int compare(votes, votes2) {
    if (votes < votes2) {
      return 2;
    } else {
      return 1;
    }
  }

  String pourcentagee(votes, votes2) {
    if (votes == 0 && votes2 == 0) {
      return "0%";
    } else {
      var total = votes + votes2;
      var numb = (votes / total) * 100;
      var percent = double.parse(numb.toStringAsFixed(2));

      return percent.toString() + "%";
    }
  }
}
