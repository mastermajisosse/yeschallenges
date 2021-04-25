import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Mystyle {
  static const Color primarycolo = Color(0xFF0165ff);
  static const Color secondrycolo = Color(0xFFffc940);
  static const Color secondrycolo2 = Color(0xFF10a58b);
  static const Color thirdcolo = Color(0xFF424a5f);
  static const Color bgcolo = Color(0xFFeeeff6);
  static String fontf = "Gobold";
  static String fontf2 = "CarterOne";
  static String fontyes = "TruenoBd";

  static TextStyle titleTextStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w800,
    fontSize: 32,
  );
  static TextStyle titleBlTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w800,
    fontSize: ScreenUtil().setSp(82),
  );

  static TextStyle tagsTextStyle = TextStyle(
    color: Colors.white,
    fontSize: ScreenUtil().setSp(64),
  );
  static TextStyle tagsTextStyle2 = TextStyle(
    color: Colors.white,
    fontFamily: fontf,
    fontWeight: FontWeight.w200,
    fontSize: ScreenUtil().setSp(54),
  );

  static TextStyle butTextStyle = TextStyle(
    color: Colors.white,
    fontSize: ScreenUtil().setSp(38),
    fontWeight: FontWeight.w600,
  );

  static TextStyle descextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: ScreenUtil().setSp(42),
    color: Colors.black87,
  );
  static TextStyle challengeStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: ScreenUtil().setSp(55),
    color: Colors.black87,
  );

  static TextStyle titlebodyStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: ScreenUtil().setSp(64),
  );

  static TextStyle subtitlebodyStyle = TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontSize: ScreenUtil().setSp(54),
  );

  static TextStyle greenctexts = TextStyle(
    fontWeight: FontWeight.bold,
    color: thirdcolo,
  );

  // -------------

  static homecardDecotation2(link) {
    return BoxDecoration(
      // color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: primarycolo.withBlue(200).withOpacity(.3),
          blurRadius: 10.0,
        ),
      ],
      image: DecorationImage(
        image: AssetImage(link),
        fit: BoxFit.fitHeight,
      ),
    );
  }

  static circleDecotationEmpty() {
    return BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
      border: Border.all(
        color: primarycolo.withOpacity(.4),
      ),
    );
  }

  static buttDecotatio() {
    return BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(223, 5, 113, 1),
          Color.fromRGBO(143, 41, 124, 1)
        ]),
        color: Color.fromRGBO(204, 14, 116, 1));
  }

  static delevmyselfDecotatio() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color.fromRGBO(151, 193, 217, 1));
  }

  static delevthemDecotatio() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        border: Border.all(
          color: Color.fromRGBO(151, 193, 217, 1),
        ));
  }

  static imagedeco(img) {
    return BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.white, width: 6),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(.1),
          blurRadius: 5.0,
        ),
      ],
      image: DecorationImage(
        image: NetworkImage(img),
        fit: BoxFit.cover,
      ),
    );
  }

  static cardhome() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
          color: Colors.lightBlueAccent[100].withOpacity(0.1),
          spreadRadius: 3,
          blurRadius: 4,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
    );
  }

  static imgshhome(url) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(50),
      image: DecorationImage(image: AssetImage(url)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey[300].withOpacity(0.3),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
    );
  }

  static imgshnet(url) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(100),
      image: DecorationImage(
        image: NetworkImage(
          isNullEmptyOrFalse(url)
              ? "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
              : url,
        ),
        fit: BoxFit.cover,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey[300].withOpacity(0.3),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
    );
  }

  // -------------

  static loadingWidget() {
    return Center(
      child: SpinKitChasingDots(
        color: Colors.white,
      ),
    );
  }

  // -------------

  static inputregular(hint, {icon}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        fontSize: 13,
        color: Colors.white,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      fillColor: Color(0xFF808286),
      suffixIcon: icon,
      filled: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      labelStyle: butTextStyle,
      errorStyle: butTextStyle,
    );
  }

  static snack(scaffoldKey, ico, colo, txt) {
    scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(txt, style: butTextStyle),
            Icon(ico),
          ],
        ),
        backgroundColor: colo,
      ),
    );
  }

  static diaglo(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: ScreenUtil().setHeight(500),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Mystyle.primarycolo,
                    size: 42,
                  ),
                  SizedBox(height: 10),
                  Text(
                    " تم الاضافة بنجاح",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: ScreenUtil().setWidth(400),
                    child: RaisedButton(
                      onPressed: () {
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (BuildContext context) {
                        //       return TabsHome(ind: 4);
                        //     },
                        //   ),
                        // );
                      },
                      child: Text(
                        "رجوع",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Mystyle.primarycolo,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static validate(value) {
    String sanitizedVal = value.trim();
    if (Mystyle.isNullEmptyFalseOrZero(value) || sanitizedVal.isEmpty) {
      return 'الخانة فارغة';
    } else if (value.length < 7) {
      return 'اضف سبع حروف على الأقل';
    } else
      return null;
  }

  // -------------
  static bool isNullEmptyOrFalse(Object o) =>
      o == null || false == o || "" == o;

  static bool isNullEmptyFalseOrZero(Object o) =>
      o == null || false == o || 0 == o || "" == o;
}
