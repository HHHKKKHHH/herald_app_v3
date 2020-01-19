import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import 'package:provider/provider.dart';
import '../../models/base.dart';
import '../../models/toast.dart';
import '../../common/theme.dart';
import '../../app.dart';

const CARD = "resources/images/homePage/card.png";
const LECTURE = "resources/images/homePage/lecture.png";
const SRTP = "resources/images/homePage/srtp.png";
const GPA = "resources/images/homePage/grade.png";

const DISPLAY_PIC_1 = "resources/images/display/1.png";
const DISPLAY_PIC_2 = "resources/images/display/1.png";
const DISPLAY_PIC_3 = "resources/images/display/1.png";
const DISPLAY = [DISPLAY_PIC_1, DISPLAY_PIC_2, DISPLAY_PIC_3];
const TITLE = ["广告投放1", "广告投放2", "广告投放3"];
const URL = ["www.baidu.com", "www.baidu.com", "www.baidu.com"];

//路由表
Map<String, String> routes = <String, String>{
  "card": "/example",
  "gpa": "/example",
  "srtp": "/example",
  "lecture": "/example",
  "pe": "/example",
  "library": "/example",
  "tip":"/example"
};

class HomeTabModel extends BaseModel {
  int _pe = 0;
  double _gpa = 0;
  double _card = 0;
  double _srtp = 0;
  int _library = 0;
  int _lecture = 0;

  set gpa(double value) {
    this._gpa = value;
    notifyListeners();
  }

  set card(double value) {
    this._card = value;
    notifyListeners();
  }

  set pe(int value) {
    this._pe = value;
    notifyListeners();
  }

  set srtp(double value) {
    this._srtp = value;
    notifyListeners();
  }

  set library(int value) {
    this._library = value;
    notifyListeners();
  }

  set lecture(int value) {
    this._lecture = value;
    notifyListeners();
  }

  get pe {
    return this._pe;
  }

  get srtp {
    return this._srtp;
  }

  get library {
    return this._library;
  }

  get card {
    return this._card;
  }

  get gpa {
    return this._gpa;
  }

  get lecture {
    return this._lecture;
  }

  // TODO: 开启相应页面
  void openUrl(url) {
    print(url);
  }

  void goto(BuildContext context, String url) {
    Navigator.of(context, rootNavigator: true).pushNamed(routes[url]);
  }

  HomeTabModel(BuildContext context) : super(context);
}

class HomeTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeTabModel(context), child: HomeTabView());
  }
}

class HomeTabView extends StatelessWidget {
  //广告位
  Widget adv(BuildContext context, HomeTabModel homeTabModel) {
    return new ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: DISPLAY.length,
      itemBuilder: (content, i) {
        return Column(children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 8, right: 8, top: 8),
            child: GestureDetector(
              onTap: () {
                homeTabModel.openUrl(URL[i]);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image(
                  image: AssetImage(DISPLAY[i]),
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width - 66,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(children: <Widget>[
              Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(TITLE[i],
                      style: TextStyle(color: Colors.black, fontSize: 15))),
              Container(
                  height: 25,
                  width: 60,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Color(0x5513ACD9),
                        offset: Offset(0, 3),
                        blurRadius: 5,
                        spreadRadius: 0.1)
                  ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: RaisedButton(
                        onPressed: () {
                          homeTabModel.openUrl(URL[i]);
                        },
                        color: Color(0xFF13ACD9),
                        child: Text("详情",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold))),
                  ))
            ]),
          )
        ]);
      },
    );
  }

  //dashBorad
  Widget dashBorad(BuildContext context, HomeTabModel homeTabModel) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Container(
            height: 50,
            child: Row(children: <Widget>[
              Container(
                  width: (MediaQuery.of(context).size.width - 30) / 2,
                  child: GestureDetector(
                      onTap: () {
                        homeTabModel.goto(context, "card");
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          child: Row(children: <Widget>[
                            Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child:
                                    Image(image: AssetImage(CARD), height: 15)),
                            Text("余额",
                                style: TextStyle(
                                    color: Color(0xAA000000), fontSize: 16)),
                            Spacer(),
                            Container(
                                padding: EdgeInsets.only(right: 8),
                                child: Text(homeTabModel.card.toString(),
                                    style: TextStyle(
                                        color: heraldBlue, fontSize: 25)))
                          ])))),
              Container(
                  height: 50,
                  width: 1,
                  child: VerticalDivider(color: Color(0x33000000))),
              Container(
                  width: (MediaQuery.of(context).size.width - 30) / 2 - 1,
                  child: GestureDetector(
                      onTap: () {
                        homeTabModel.goto(context, "lecture");
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          child: Row(children: <Widget>[
                            Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Image(
                                    image: AssetImage(LECTURE), height: 17)),
                            Text("人文讲座",
                                style: TextStyle(
                                    color: Color(0xAA000000), fontSize: 16)),
                            Spacer(),
                            Container(
                                padding: EdgeInsets.only(right: 8),
                                child: Text(homeTabModel.lecture.toString(),
                                    style: TextStyle(
                                        color: heraldBlue, fontSize: 25)))
                          ])))),
            ])),
        // Container(
        //     height: 1,
        //     width: MediaQuery.of(context).size.width - 30,
        //     child: VerticalDivider(color: Color(0x33000000))),
        Divider(
          height: 1,
          color: Color(0x33000000),
        ),
        Container(
            height: 50,
            child: Row(children: <Widget>[
              Container(
                  width: (MediaQuery.of(context).size.width - 30) / 2,
                  child: GestureDetector(
                      onTap: () {
                        homeTabModel.goto(context, "srtp");
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          child: Row(children: <Widget>[
                            Container(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child:
                                    Image(image: AssetImage(SRTP), height: 25)),
                            Text("SRTP",
                                style: TextStyle(
                                    color: Color(0xAA000000), fontSize: 16)),
                            Spacer(),
                            Container(
                                padding: EdgeInsets.only(right: 8),
                                child: Text(homeTabModel.srtp.toString(),
                                    style: TextStyle(
                                        color: heraldBlue, fontSize: 25)))
                          ])))),
              Container(
                  height: 50,
                  width: 1,
                  child: VerticalDivider(color: Color(0x33000000))),
              Container(
                  width: (MediaQuery.of(context).size.width - 30) / 2 - 1,
                  child: GestureDetector(
                      onTap: () {
                        homeTabModel.goto(context, "gpa");
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          child: Row(children: <Widget>[
                            Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child:
                                    Image(image: AssetImage(GPA), height: 20)),
                            Text("总绩点",
                                style: TextStyle(
                                    color: Color(0xAA000000), fontSize: 16)),
                            Spacer(),
                            Container(
                                padding: EdgeInsets.only(right: 6),
                                child: Text(homeTabModel.gpa.toString(),
                                    style: TextStyle(
                                        color: heraldBlue, fontSize: 25)))
                          ])))),
            ])),
        Divider(
          height: 1,
          color: Color(0x33000000),
        ),
        Container(
            height: 50,
            child: Row(children: <Widget>[
              Container(
                  width: (MediaQuery.of(context).size.width - 30) / 2,
                  child: GestureDetector(
                      onTap: () {
                        homeTabModel.goto(context, "pe");
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          child: Row(children: <Widget>[
                            // Container(
                            //     padding: EdgeInsets.only(left: 10, right: 10),
                            //     child:
                            //         Image(image: AssetImage(SRTP), height: 20)),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Text("跑操",
                                  style: TextStyle(
                                      color: Color(0xAA000000), fontSize: 16)),
                            ),
                            Spacer(),
                            Container(
                                padding: EdgeInsets.only(right: 8),
                                child: Text(homeTabModel.pe.toString(),
                                    style: TextStyle(
                                        color: heraldBlue, fontSize: 25)))
                          ])))),
              Container(
                  height: 50,
                  width: 1,
                  child: VerticalDivider(color: Color(0x33000000))),
              Container(
                  width: (MediaQuery.of(context).size.width - 30) / 2 - 1,
                  child: GestureDetector(
                      onTap: () {
                        homeTabModel.goto(context, "library");
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          child: Row(children: <Widget>[
                            // Container(
                            //     padding: EdgeInsets.only(left: 10, right: 10),
                            //     child:
                            //         Image(image: AssetImage(GPA), height: 20)),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Text("借书",
                                  style: TextStyle(
                                      color: Color(0xAA000000), fontSize: 16)),
                            ),
                            Spacer(),
                            Container(
                                padding: EdgeInsets.only(right: 6),
                                child: Text(homeTabModel.library.toString(),
                                    style: TextStyle(
                                        color: heraldBlue, fontSize: 25)))
                          ])))),
            ])),
        Divider(
          height: 1,
          color: Color(0x33000000),
        ),
        Container(
            width: (MediaQuery.of(context).size.width - 30),
            child: GestureDetector(
                onTap: () {
                  homeTabModel.goto(context, "tip");
                },
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(children: <Widget>[
                      // Container(
                      //     padding: EdgeInsets.only(left: 10, right: 10),
                      //     child:
                      //         Image(image: AssetImage(GPA), height: 20)),
                      Container(
                        padding: EdgeInsets.only(left: 10,top:3),
                        child: Text("实用小板块",
                            style: TextStyle(
                                color: Color(0xAA000000), fontSize: 16)),
                      ),
                      Spacer(),
                      Container(
                          padding: EdgeInsets.only(right: 6,top:3),
                          child: Image(
                              image: AssetImage("resources/images/right.png"),
                              height: 18,
                              color: heraldBlue))
                    ])))),
      ]),
    );
  }

  //主页广告位加dashborad
  Widget dashBoradAndAdv(BuildContext context, HomeTabModel homeTabModel) {
    return Container(
        margin: EdgeInsets.all(15),
        height: 424,
        width: MediaQuery.of(context).size.width - 30,
        decoration: heraldContainerTheme,
        child: Column(children: <Widget>[
          Row(children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Container(
                  height: 195,
                  width: MediaQuery.of(context).size.width - 50,
                  child: adv(context, homeTabModel)),
            )
          ]),
          Row(children: <Widget>[
            Container(
                child: dashBorad(context, homeTabModel))
          ])
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeTabModel>(builder: (context, homeTabModel, child) {
      return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(middle: Text('小猴偷米')),
          child: Container(
              decoration: BoxDecoration(color: Color(0xFFEEEEEE)),
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                this.dashBoradAndAdv(context, homeTabModel),
              ]))));
    });
  }
}
