import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yeschallenges/mystyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddPrivate extends StatefulWidget {
  @override
  _AddPrivateState createState() => _AddPrivateState();
}

class _AddPrivateState extends State<AddPrivate> {
  SharedPreferences sharedPreferences;
  final firstc = TextEditingController();
  final secondc = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  var scaffoldKey = new GlobalKey<ScaffoldState>();
  bool busy = false;
  List yeschallenges = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          SizedBox(height: ScreenUtil().setHeight(200)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              "* يمكنك اضافة معلومات زائفة للاستمتاع بما تريد ",
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
                    onPressed: ontap,
                  ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(100),
          ),
          listofthings(yeschallenges, false),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "المجموع : " + yeschallenges.length.toString(),
                  style: Mystyle.greenctexts,
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          listofthings(yeschallenges, true),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  ontap() {
    // String lawkh =
    //     " ${secondc.text} و ${firstc.text} لو خيروك بين";
    setState(() {
      busy = true;
      // Save. savelawkhList();
    });
    FocusScope.of(context).unfocus();

    setState(() {
      busy = false;
    });
  }

  listofthings(List malist, bool approved) {
    return malist.isEmpty
        ? Container()
        : Container(
            decoration: BoxDecoration(
              color: Color(0xFF2b2e36).withOpacity(.7),
              border: BorderDirectional(
                top: BorderSide(
                  color: Colors.white.withOpacity(.2),
                  width: 3,
                ),
              ),
            ),
            child: ListView.builder(
              itemCount: malist.length, //
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.only(right: 4.0, left: 4),
                  decoration: BoxDecoration(
                    border: BorderDirectional(
                      bottom: BorderSide(
                        color: Colors.white.withOpacity(.2),
                        width: 3,
                      ),
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      malist[index],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: approved
                        ? Text(
                            "approved",
                            style: Mystyle.tagsTextStyle.copyWith(
                              color: Colors.green,
                            ),
                            textAlign: TextAlign.right,
                          )
                        : Text("pending",
                            style: Mystyle.tagsTextStyle.copyWith(
                              color: Colors.orange[300],
                            )),
                  ),
                );
              },
            ),
          );
  }
}
