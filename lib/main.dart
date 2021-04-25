import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yeschallenges/save.dart';
import 'package:provider/provider.dart';
import 'package:yeschallenges/service/base_widget.dart';
import 'package:yeschallenges/service/provider_setup.dart';
import 'package:yeschallenges/service/read_provider.dart';
import 'package:yeschallenges/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
// FlutterPortfolio in github
//english version

main() {
  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ar', 'AR'),
        Locale('fr', 'FR')
      ],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    shared();
  }

  shared() async {
    Save.prefs = await SharedPreferences.getInstance();
    if (Save.prefs.getBool("isfirstRun") != true) {
      print("not true");
      Save.prefs.setBool("isfirstRun", true);
    }
    Save().setonlyonce(false);
  }

  int i = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'yeschallenges',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'TruenoBd',
        ),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: BaseWidget<ReadData>(
          provider: ReadData(),
          onModelReady: (provider) async {
            provider.getall();
          },
          builder: (context, provider, child) {
            return Splashs();
          },
        ),
      ),
    );
  }
}
