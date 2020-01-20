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

//路由表
Map<String, String> routes = <String, String>{
  "card": "/example",
  "gpa": "/example",
  "srtp": "/example",
  "lecture": "/example",
  "pe": "/example",
  "library": "/example",
  "tip": "/example"
};

class HomeTabModel extends BaseModel {
  List _data = [
    <String, String>{
      "title": "广告投放1",
      "url": "www.baidu.com",
      "pic": "resources/images/display/1.png"
    },
    <String, String>{
      "title": "广告投放1",
      "url": "www.baidu.com",
      "pic": "resources/images/display/1.png"
    },
    <String, String>{
      "title": "广告投放1",
      "url": "www.baidu.com",
      "pic": "resources/images/display/1.png"
    },
  ];
  int _pe = -1;
  double _gpa = -1;
  double _card = -1;
  double _srtp = -1;
  int _library = -1;
  int _lecture = -1;

  Future<void> refresh(BuildContext context) async {
    //TODO: 数据获取
  }
  set data(List value) {
    this._data = value;
    notifyListeners();
  }

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

  get data {
    return this._data;
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
  void goto(BuildContext context, String url) {
    Navigator.of(context, rootNavigator: true).pushNamed(routes[url]);
  }

  void openUrl(Map<String, String> item) {
    if (item.containsKey("url"))
      print(item["url"]);
    else {
      Toast.toast(context, msg: "该活动没有详情页哦~", position: ToastPostion.bottom);
    }
  }

  HomeTabModel(BuildContext context) : super(context) {
    refresh(context);
  }
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
  Widget adv(BuildContext context, HomeTabModel model) {
    return new ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: model.data.length,
      itemBuilder: (content, i) {
        Map data = model.data[i];
        return Column(children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 8, right: 8, top: 8),
            child: GestureDetector(
              onTap: () {
                model.openUrl(data);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image(
                  image: AssetImage(data["pic"]),
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
                  child: Text(data["title"],
                      style: TextStyle(color: Colors.black, fontSize: 15))),
              Container(
                margin: EdgeInsets.only(right: 5),
                width: 55,
                height: 25,
                decoration: BoxDecoration(
                    border: Border.all(color: heraldBlue, width: 1),
                    borderRadius: BorderRadius.circular(20),
                    color: heraldBlue,
                    boxShadow: [
                      BoxShadow(
                          color: Color(0x5513ACD9),
                          offset: Offset(0, 3),
                          blurRadius: 5,
                          spreadRadius: 0.1)
                    ]),
                child: GestureDetector(
                    onTap: () {
                      model.openUrl(data);
                    },
                    child: Container(
                        child: Center(
                      child: Text("详情",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ))),
              ),
            ]),
          )
        ]);
      },
    );
  }

  //dashBorad
  Widget dashBorad(BuildContext context, HomeTabModel model) {
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
                        model.goto(context, "card");
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
                                child: Text(
                                    model.card == -1
                                        ? "暂无"
                                        : model.card.toString(),
                                    style: TextStyle(
                                        color: heraldBlue, fontSize: 20)))
                          ])))),
              Container(
                  height: 50,
                  width: 1,
                  child: VerticalDivider(color: Color(0x33000000))),
              Container(
                  width: (MediaQuery.of(context).size.width - 30) / 2 - 1,
                  child: GestureDetector(
                      onTap: () {
                        model.goto(context, "lecture");
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
                                padding: EdgeInsets.only(right: 7),
                                child: Text(
                                    model.lecture == -1
                                        ? "暂无"
                                        : model.lecture.toString(),
                                    style: TextStyle(
                                        color: heraldBlue, fontSize: 20)))
                          ])))),
            ])),
        // Container(
        //     height: 1,
        //     width: MediaQuery.of(context).size.width - 30,
        //     child: VerticalDivider(color: Color(0x33000000))),
        heraldDivider,
        Container(
            height: 50,
            child: Row(children: <Widget>[
              Container(
                  width: (MediaQuery.of(context).size.width - 30) / 2,
                  child: GestureDetector(
                      onTap: () {
                        model.goto(context, "srtp");
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          child: Row(children: <Widget>[
                            Container(
                                padding: EdgeInsets.only(left: 6, right: 8),
                                child:
                                    Image(image: AssetImage(SRTP), height: 25)),
                            Text("SRTP",
                                style: TextStyle(
                                    color: Color(0xAA000000), fontSize: 16)),
                            Spacer(),
                            Container(
                                padding: EdgeInsets.only(right: 8),
                                child: Text(
                                    model.srtp == -1
                                        ? "暂无"
                                        : model.srtp.toString(),
                                    style: TextStyle(
                                        color: heraldBlue, fontSize: 20)))
                          ])))),
              Container(
                  height: 50,
                  width: 1,
                  child: VerticalDivider(color: Color(0x33000000))),
              Container(
                  width: (MediaQuery.of(context).size.width - 30) / 2 - 1,
                  child: GestureDetector(
                      onTap: () {
                        model.goto(context, "gpa");
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
                                child: Text(
                                    model.gpa == -1
                                        ? "暂无"
                                        : model.gpa.toString(),
                                    style: TextStyle(
                                        color: heraldBlue, fontSize: 20)))
                          ])))),
            ])),
        heraldDivider,
        Container(
            height: 50,
            child: Row(children: <Widget>[
              Container(
                  width: (MediaQuery.of(context).size.width - 30) / 2,
                  child: GestureDetector(
                      onTap: () {
                        model.goto(context, "pe");
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
                                child: Text(
                                    model.pe == -1 ? "暂无" : model.pe.toString(),
                                    style: TextStyle(
                                        color: heraldBlue, fontSize: 20)))
                          ])))),
              Container(
                  height: 50,
                  width: 1,
                  child: VerticalDivider(color: Color(0x33000000))),
              Container(
                  width: (MediaQuery.of(context).size.width - 30) / 2 - 1,
                  child: GestureDetector(
                      onTap: () {
                        model.goto(context, "library");
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
                                child: Text(
                                    model.library == -1
                                        ? "暂无"
                                        : model.library.toString(),
                                    style: TextStyle(
                                        color: heraldBlue, fontSize: 20)))
                          ])))),
            ])),
        heraldDivider,
        Container(
            width: (MediaQuery.of(context).size.width - 30),
            child: GestureDetector(
                onTap: () {
                  model.goto(context, "tip");
                },
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(children: <Widget>[
                      // Container(
                      //     padding: EdgeInsets.only(left: 10, right: 10),
                      //     child:
                      //         Image(image: AssetImage(GPA), height: 20)),
                      Container(
                        padding: EdgeInsets.only(left: 10, top: 3),
                        child: Text("实用小板块",
                            style: TextStyle(
                                color: Color(0xAA000000), fontSize: 16)),
                      ),
                      Spacer(),
                      Container(
                          padding: EdgeInsets.only(right: 6, top: 3),
                          child: Image(
                              image: AssetImage("resources/images/right.png"),
                              height: 18,
                              color: heraldBlue))
                    ])))),
      ]),
    );
  }

  //主页广告位加dashborad
  Widget dashBoradAndAdv(BuildContext context, HomeTabModel model) {
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
                  child: adv(context, model)),
            )
          ]),
          Row(children: <Widget>[Container(child: dashBorad(context, model))])
        ]));
  }
  //课表

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeTabModel>(builder: (context, model, child) {
      return Scaffold(
          appBar: heraldBar,
          body: Container(
              decoration: BoxDecoration(color: heraldBackGround),
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                this.dashBoradAndAdv(context, model),
              ]))));
    });
  }
}
