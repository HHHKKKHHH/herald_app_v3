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
        textTheme: CupertinoTextThemeData(primaryColor: Color(0xFFFFFFFF))
      );