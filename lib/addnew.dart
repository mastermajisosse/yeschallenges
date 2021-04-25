import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeschallenges/service/getdata.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yeschallenges/mystyle.dart';

class Add extends StatefulWidget {
  // List dares;
  // List turths;
  // Add(this.dares, this.turths);
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  Getdata getdata = Getdata();
  SharedPreferences sharedPreferences;
  final firstc = TextEditingController();
  final secondc = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  var scaffoldKey = new GlobalKey<ScaffoldState>();
  bool busy = false;

  Future<bool> checkcon() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      }
      return true;
    } on SocketException catch (_) {
      print('not connected');
      Future.delayed(Duration(seconds: 4)).then(
        (value) => Mystyle.snack(
          scaffoldKey,
          Icons.error,
          Colors.red,
          'not connected',
        ),
      );
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF23252b),
        appBar: AppBar(
          backgroundColor: Color(0xFF2b2e36),
          title: Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 16),
            child: Text(
              "اضافة",
              style: Mystyle.greenctexts.copyWith(fontSize: 24),
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: Size(0, 10),
            child: Container(padding: null),
          ),
          // bottom: TabBar(
          //   indicatorColor: Color(0xFF70c13c),
          //   labelColor: Color(0xFF70c13c),
          //   indicatorWeight: 4,
          //   unselectedLabelColor: Colors.white70,
          //   labelStyle: TextStyle(
          //     fontSize: 16,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.blue,
          //   ),
          //   // tabs: [Tab(text: 'عام'), Tab(text: 'خاص')],
          // ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: first(),
          // TabBarView(
          //   children: [
          //     first(),
          //     AddPrivate(),
          //     // second(),
          //   ],
          // ),
        ),
      ),
    );
  }

  first() {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          SizedBox(height: ScreenUtil().setHeight(200)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              " * المرجوا اضافة اشياء ممتعة ولا تضر بالآخرين",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              "وجود النت ضروري لتتم الاضافة ، يتم الموافقة بعد التحقق",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              "لو خيروك بين :",
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
            child: Container(
                child: TextFormField(
              controller: firstc,
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.white),
              decoration: Mystyle.inputregular("متال : كرة القدم"),
              validator: (value) {
                return Mystyle.validate(value);
              },
            )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
            child: Container(
                child: TextFormField(
              controller: secondc,
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.white),
              decoration: Mystyle.inputregular("متال : كرة الطائرة"),
              validator: (value) {
                return Mystyle.validate(value);
              },
            )),
          ),
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: busy
                ? Mystyle.loadingWidget()
                : MaterialButton(
                    minWidth: double.infinity,
                    padding: EdgeInsets.all(20),
                    color: Color(0xFFff135c),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'اضافة',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        // String lawkh =
                        //     " ${secondc.text} و ${firstc.text} لو خيروك بين";
                        setState(() {
                          busy = true;
                        });
                        getdata
                            .addlawkh(firstc.text, secondc.text)
                            .whenComplete(() {
                          FocusScope.of(context).unfocus();

                          setState(() {
                            busy = false;
                            firstc.clear();
                            secondc.clear();
                          });
                          Mystyle.snack(
                            scaffoldKey,
                            Icons.done_outline,
                            Colors.green,
                            'succ',
                          );
                        });
                      }
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
