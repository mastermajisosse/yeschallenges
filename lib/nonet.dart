import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeschallenges/mystyle.dart';
import 'package:yeschallenges/splash.dart';

class NoNet extends StatefulWidget {
  @override
  _NoNetState createState() => _NoNetState();
}

class _NoNetState extends State<NoNet> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Splashs()),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   backgroundColor: Mystyle.primarycolo,
        //   elevation: 0.0,
        // ),
        body: Container(
          alignment: Alignment.center,
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          color: Mystyle.primarycolo,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "انترنت غير موجود",
                style: Mystyle.butTextStyle.copyWith(
                  color: Colors.red,
                  fontSize: 33,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 56.0),
                child: Text(
                  "كل البيانات في هدا التطبيق حقيقية لدلك تحتاج اتصال بالانترنت لعرضها ، شكرا على تفهمكم",
                  style: Mystyle.butTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
