import 'package:flutter/cupertino.dart';
import './miscellaneous.dart';
import 'package:flutter/material.dart';
ThemeData heraldTheme = new ThemeData(
    cupertinoOverrideTheme:CupertinoThemeData(
    barBackgroundColor:
        ColorWithFakeLuminance(Color(0xFF13ACD9), withLightLuminance: true),
    primaryColor:
        ColorWithFakeLuminance(Color(0xFF13ACD9), withLightLuminance: false),
    primaryContrastingColor: Color(0xFF000000),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xFFFFFFFF),
    textTheme: CupertinoTextThemeData(primaryColor: Color(0xFFFFFFFF))));

BoxDecoration heraldContainerTheme = new BoxDecoration(
    color: Color(0xFFFFFFFF),
    borderRadius: BorderRadius.all(Radius.circular(8)),
    boxShadow: [
      BoxShadow(
          color: Color(0x16000000),
          offset: Offset(0, 2),
          blurRadius: 1,
          spreadRadius: 0.1)
    ]);

Divider heraldDivider= new Divider(
          height: 1,
          color: Color(0x33000000),
        );

Color heraldBlue = new Color(0xFF13ACD9);
Color heraldBackGround = new Color(0xFFEEEEEE);

// CupertinoNavigationBar heraldBar= new CupertinoNavigationBar(
//   backgroundColor: Colors.white,
//   leading:Image(image:AssetImage("resources/images/App2.png"),height: 50)
// );

PreferredSize heraldBar = new PreferredSize(
  preferredSize: Size.fromHeight(60.0),
  child: AppBar(
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    flexibleSpace: 
    Container(
      padding:EdgeInsets.only(top:32,left:10),
      child: 
    Row(
      children: <Widget>[
        Image(image:AssetImage("resources/images/App2.png"),height: 45),
      ],
    )),
  )
);