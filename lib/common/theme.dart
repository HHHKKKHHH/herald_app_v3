import 'package:flutter/cupertino.dart';
import './miscellaneous.dart';
import 'package:flutter/material.dart';

ThemeData heraldTheme = new ThemeData(
    cupertinoOverrideTheme: CupertinoThemeData(
        barBackgroundColor:
            ColorWithFakeLuminance(Color(0xFFFFFFFF), withLightLuminance: true),
        primaryColor: ColorWithFakeLuminance(Color(0xFF13ACD9),
            withLightLuminance: false),
        primaryContrastingColor: Color(0xFF000000),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        textTheme: CupertinoTextThemeData(primaryColor: Color(0xFFFFFFFF)))
    );

//标准块样式定义
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

//标准水平分割线
Divider heraldDivider = new Divider(
  height: 1,
  color: Color(0x33000000),
);

//常用标准色
Color heraldBlue = new Color(0xFF13ACD9);
Color heraldBackGround = new Color(0xFFEEEEEE);
 


//根页面使用该appbar（具有小猴app头图）
Widget heraldBar(BuildContext context, refresh) {
  return PreferredSize(
      preferredSize: Size.fromHeight(60.0),
      child: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        flexibleSpace: Container(
            padding: EdgeInsets.only(top: 32, left: 10),
            child: Row(
              children: <Widget>[
                Image(
                    image: AssetImage("resources/images/App2.png"), height: 45),
              ],
            )),
        actions: <Widget>[
            Container(
              height:50,
              padding: EdgeInsets.all(10),
              child: IconButton(
              onPressed:(){refresh(context);},
              icon: Image(
                  image: AssetImage("resources/images/refresh.png"), height: 30),
          ),
            )
        ],
      ));
}

//非根路径页面使用该appbar以已自定义路由显示名称
Widget customBar(BuildContext context, String _title) {
  return PreferredSize(
      preferredSize: Size.fromHeight(60.0),
      child: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: Image(
                image: AssetImage("resources/images/Left.png"), height: 20),
            onPressed: () {
              Navigator.of(context).pop();
            },
          );
        }),
        title: Text(_title,
            style: TextStyle(
                color: Color(0xBB000000), fontWeight: FontWeight.bold)),
      ));
}
