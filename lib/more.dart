import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:yeschallenges/mystyle.dart';
import 'package:yeschallenges/nonet.dart';
import 'package:yeschallenges/service/base_widget.dart';
import 'package:yeschallenges/service/read_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yeschallenges/splash.dart';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> with SingleTickerProviderStateMixin {
  launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    // _radioValue = 'en'; // context.locale.languageCode;
    super.initState();
    checkcon();
    // print(context.locale.toString());
  }

  String _radioValue;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    setState(() {
      _radioValue = context.locale.languageCode;
    });
  }

  var scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<bool> checkcon() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      }
      return true;
    } on SocketException catch (_) {
      print('not connected');

      Future.delayed(Duration(seconds: 1)).then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NoNet()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    // var data = EasyLocalizationProvider.of(context).data;
    // print(context.locale.languageCode);

    return BaseWidget<ReadData>(
      provider: ReadData(),
      onModelReady: (provider) async {
        provider.getallgame(context.locale.languageCode);
      },
      builder: (context, provider, child) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Mystyle.bgcolo,
          appBar: AppBar(
            backgroundColor: Colors.black87,
            elevation: 0.0,
            leading: BackButton(),
            title: Text(
              "Setting",
              style: Mystyle.butTextStyle,
            ).tr(),
            centerTitle: true,
            bottom: PreferredSize(
                child: Container(
                  color: Colors.transparent,
                  height: 1.0,
                ),
                preferredSize: Size.fromHeight(6.0)),
          ),
          body: ListView(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: ListTile(
                        title: Text(
                          'english',
                          style: Mystyle.subtitlebodyStyle,
                        ).tr(),
                        trailing: Radio(
                          value: 'en',
                          groupValue: _radioValue,
                          onChanged: (val) {
                            print(val);
                            this.setState(() {
                              _radioValue = val;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    height: 0,
                  ),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: ListTile(
                        title: Text(
                          'french',
                          style: Mystyle.subtitlebodyStyle,
                        ).tr(),
                        trailing: Radio(
                          value: 'fr',
                          groupValue: _radioValue,
                          onChanged: (val) {
                            print(val);
                            this.setState(() {
                              _radioValue = val;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    height: 0,
                  ),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 5,
                      ),
                      child: ListTile(
                        title: Text(
                          'arabic',
                          style: Mystyle.subtitlebodyStyle,
                        ).tr(),
                        trailing: Radio(
                          value: 'ar',
                          groupValue: _radioValue,
                          onChanged: (val) {
                            print(val);
                            this.setState(() {
                              _radioValue = val;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.only(right: 8, top: 3),
                child: FlatButton(
                  child: Text("save", style: Mystyle.butTextStyle).tr(),
                  color: Colors.black87,
                  onPressed: () {
                    if (_radioValue == 'ar') {
                      context.locale = Locale("ar", "AR");
                    } else if (_radioValue == 'en') {
                      context.locale = Locale("en", "US");
                    } else {
                      context.locale = Locale("fr", "FR");
                    }
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Splashs()));
                    // this.setState(() {});
                  },
                ),
              ),
              SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Games&Apps",
                  style: Mystyle.challengeStyle,
                ).tr(),
              ),
              provider.busy
                  ? SpinKitDoubleBounce(
                      color: Mystyle.primarycolo,
                      size: 50.0,
                      controller: AnimationController(
                          vsync: this,
                          duration: const Duration(milliseconds: 1200)),
                    )
                  // : Expanded(
                  //     child:
                  //   )
                  : mybody(provider),
            ],
          ),
        );
      },
    );
  }

  mybody(provider) {
    return ListView.builder(
        itemCount: provider.allgame.length,
        physics: ClampingScrollPhysics(),
        primary: true,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            // onTap: () => launchURL(provider.allgame[index].link),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200],
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: ScreenUtil().setHeight(160),
                                height: ScreenUtil().setHeight(160),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      provider.allgame[index].icon,
                                    ),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: ScreenUtil().setWidth(500),
                                    child: Text(
                                      provider.allgame[index].name,
                                      style: Mystyle.descextStyle.copyWith(
                                        fontSize: ScreenUtil().setSp(48),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                  Text(
                                    provider.allgame[index].downloads
                                            .toString() +
                                        " " +
                                        "downloads".tr(),
                                    style: Mystyle.descextStyle.copyWith(
                                      fontSize: ScreenUtil().setSp(32),
                                      color: Mystyle.primarycolo,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    // textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "clickhere",
                                style: Mystyle.descextStyle.copyWith(
                                  fontSize: ScreenUtil().setSp(32),
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ).tr(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
