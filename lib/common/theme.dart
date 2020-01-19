import 'package:flutter/cupertino.dart';
import './miscellaneous.dart';

CupertinoThemeData heraldTheme = new CupertinoThemeData(
    barBackgroundColor:
        ColorWithFakeLuminance(Color(0xFF13ACD9), withLightLuminance: true),
    primaryColor:
        ColorWithFakeLuminance(Color(0xFF13ACD9), withLightLuminance: false),
    primaryContrastingColor: Color(0xFF000000),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xFFFFFFFF),
    textTheme: CupertinoTextThemeData(primaryColor: Color(0xFFFFFFFF)));

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

Color heraldBlue = new Color(0xFF13ACD9);
