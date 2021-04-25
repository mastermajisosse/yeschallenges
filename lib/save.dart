import 'package:yeschallenges/models/games.dart';
import 'package:yeschallenges/models/lawkhmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
// remember to replace the first 2

class Save {
  static const String app_name = 'YesChallenges';
  static const String lang = 'en';
  static const String app_version = 'version 1.0.0';
  static const int app_v_code = 1;
  static const bool testingads = false;

  static SharedPreferences prefs;

  bool getonlyonce() {
    return prefs.getBool("adsonce");
  }

  Future<bool> setonlyonce(booll) async {
    print(booll);
    return await prefs.setBool("adsonce", booll);
  }

  Future<bool> savelawkhList(List<String> list) async {
    return await prefs.setStringList("lawkhList", list);
  }

  List<String> getlawkhList() {
    return prefs.getStringList("lawkhList");
  }

  Future<bool> savegamelist(List<Games> list) async {
    // return await prefs.setStringList("gamelist", list);
  }

  List<String> getgamelist() {
    return prefs.getStringList("gamelist");
  }

  savechallenge(dd) {
    return prefs.setInt("day", dd + 1);
  }

  gethechallenge() {
    return prefs.getInt("day");
  }

  savetheDay(dd) {
    return prefs.setString("today", dd);
  }

  getheDay() {
    return prefs.getString("today");
  }

  List<String> challenges = [
    "Meditate for 5-10 Minutes a Day",
    "Write down 3 things you're grateful for",
    "Do at least 15 jumping jacks",
    "Read for 10 minutes before bed at night",
    "Cook a meal for yourself ",
    "Take a walk rain or shine ",
    "Get up 20 minutes earlier than your regular time",
    "organize a space in your home ",
    "Write a letter to your future self ",
    "Do a Random acts of kindness",
    "Complete a Crossword or Sudoku Puzzle",
    "Do a How To Videos",
    "10 min Solo Dance Parties",
    "Sitting in nature",
    "Cuddling with a pet",
    "Watch funny YouTube videos",
    "Skype a family member",
    "Watch sunset or sunrise",
    "Take a photo of something that makes you happy",
    "Donate one thing from your home",
    "Work on an art project",
    "Paint a rock",
    "Watch a TED Talk",
    "Stretch",
    "Eat meals without your phone or TV",
    "Take a walk without your phone",
    "Sweat",
    "Visit a new coffee shop",
    "Get in touch with one former classmate or childhood friend per day",
    "Visit a new coffee store",
    "Eat dinner with your family/friends",
    "Visit a new coffee area of your town",
    "Answer questions left by people in reddit.",
    "Tell a family member you love them",
    "Do a home makeover",
    "Grow an herb or vegetable garden",
    "Drink only water",
    "walk 5000 steps",
    "Eat fresh fruits ",
    "No screen time an hour before bedtime",
  ];

  List<String> challenges2 = [
//
    "Turn off all electronics after 7pm",
    "Donate one item from your house",
    "Compliment a stranger",
    "Take a walk together with your family",
    "Walk 10,000 steps",
    "Start a conversation with a stranger",
    "Do something nice for your neighborhood",
    "Buy a meal for someone less fortunate",
  ];
}
