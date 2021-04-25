import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeschallenges/more.dart';
import 'package:yeschallenges/mystyle.dart';
import 'package:yeschallenges/nonet.dart';
import 'package:yeschallenges/save.dart';
import 'package:yeschallenges/service/base_widget.dart';
import 'package:yeschallenges/service/read_provider.dart';
// import 'package:rate_my_app/rate_my_app.dart';

class Gameplay extends StatefulWidget {
  @override
  _GameplayState createState() => _GameplayState();
}

class _GameplayState extends State<Gameplay>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  var animation;

  Future checkcon() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      }
    } on SocketException catch (_) {
      print('-----not connected');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NoNet()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    // rateiti();
    print("holla");
    controller = AnimationController(
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: const Duration(milliseconds: 3000),
        vsync: this);
    animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    // Ads.hideBannerAd();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(context.locale.languageCode);
    ScreenUtil.init(context);
    return Scaffold(
        backgroundColor: Mystyle.bgcolo,
        body: Container(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              mycolumn(),
            ],
          ),
        ));
  }

  // DateTime date = DateTime.now();
  var today = DateFormat('EEEE').format(DateTime.now());
  mycolumn() {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                color: colors(today), //
              ),
              Positioned(
                top: 25,
                left: 25,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    today,
                    style: Mystyle.tagsTextStyle2,
                  ).tr(),
                ),
              ),
              Positioned(
                top: 25,
                right: 22,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => More()),
                    );
                  },
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    width: 35,
                    height: 35,
                    child: Icon(
                      Icons.games_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: ScreenUtil().setHeight(350),
                left: 33,
                right: 33,
                child: Container(
                  width: double.infinity, // ScreenUtil().setHeight(960),
                  height: ScreenUtil().setHeight(1200),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white.withOpacity(.3),
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(height: 35),
                      Text(
                        "Todaych",
                        style: Mystyle.titleBlTextStyle.copyWith(
                          color: Colors.white,
                        ),
                      ).tr(),
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(36),
                            child: Text(
                              ('challenges.' +
                                      (Save().gethechallenge() ?? 0).toString())
                                  .tr(),
                              style: Mystyle.challengeStyle.copyWith(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 35),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Save().getheDay() == today
                    ? Container(
                        height: 60,
                        color: Colors.grey,
                        alignment: Alignment.center,
                        child: Text("Done").tr(),
                      )
                    : InkWell(
                        onTap: () {
                          print("object2");
                          Save().savechallenge(Save().gethechallenge() ?? 0);
                          Save().savetheDay(today);
                          setState(() {});
                        },
                        child: Container(
                          height: 60,
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: Text("Done").tr(),
                        ),
                      ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Color colors(x) {
    switch (x) {
      case "Monday":
        return Colors.red;
        break;
      case "Tuesday":
        return Colors.orange;
        break;
      case "Wednesday":
        return Colors.yellow[700];
        break;
      case "Thursday":
        return Colors.green;
        break;
      case "Friday":
        return Colors.blue;
        break;
      case "Saturday":
        return Colors.indigo;
        break;
      case "Sunday":
        return Colors.purple;
        break;
    }
  }

  // RateMyApp rateMyApp = RateMyApp(
  //   preferencesPrefix: 'rateMyApp_',
  //   minDays: 3,
  //   minLaunches: 7,
  //   remindDays: 2,
  //   remindLaunches: 7,
  // );

  // rateiti() {
  //   rateMyApp.init().then((_) {
  //     if (rateMyApp.shouldOpenDialog) {
  //       // TODO: Comment out this if statement to test rating dialog (Remember to uncomment)
  //       // if (rateMyApp.shouldOpenDialog) {
  //       rateMyApp.showStarRateDialog(
  //         context,
  //         title: 'Aimez-vous le jeu?',
  //         message:
  //             's il vous plaît laisser un commentaire positif , ça nous aide',
  //         actionsBuilder: (context, stars) {
  //           return [
  //             FlatButton(
  //               child: Text('Ok'),
  //               onPressed: () async {
  //                 if (stars < 3) {
  //                   print('Navigate to Contact Us Screen');
  //                   Navigator.push(
  //                     context,
  //                     MaterialPageRoute(
  //                       builder: (_) => Gameplay(),
  //                     ),
  //                   );
  //                 } else if (stars >= 3) {
  //                   print('Leave a Review Dialog');
  //                   await rateMyApp
  //                       .callEvent(RateMyAppEventType.rateButtonPressed);
  //                   Navigator.pop<RateMyAppDialogButton>(
  //                       context, RateMyAppDialogButton.rate);
  //                 }
  //               },
  //             ),
  //           ];
  //         },
  //         dialogStyle: DialogStyle(
  //           // Custom dialog styles.
  //           titleAlign: TextAlign.center,
  //           messageAlign: TextAlign.center,
  //           messagePadding: EdgeInsets.only(bottom: 20),
  //         ),
  //         starRatingOptions:
  //             StarRatingOptions(), // Custom star bar rating options.
  //         onDismissed: () => rateMyApp.callEvent(RateMyAppEventType
  //             .laterButtonPressed), // Called when the user dismissed the dialog (either by taping outside or by pressing the "back" button).
  //       );
  //     }
  //   });
  // }
}
