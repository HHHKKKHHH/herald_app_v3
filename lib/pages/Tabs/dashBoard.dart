import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './homeTab.dart';
import '../../common/theme.dart';
const CARD = "resources/images/homePage/card.png";
const LECTURE = "resources/images/homePage/lecture.png";
const SRTP = "resources/images/homePage/srtp.png";
const GPA = "resources/images/homePage/grade.png";


//主页上端选项卡
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
                                padding: EdgeInsets.only(left : 5, right: 10),
                                child:
                                    Image(image: AssetImage(CARD), height: 15)),
                            Text("余额",
                                style: TextStyle(
                                    color: Color(0xAA000000), fontSize: 14)),
                            Spacer(),
                            Container(
                                padding: EdgeInsets.only(right: 8),
                                child: Text(
                                    model.card == -1
                                        ? "暂无"
                                        : model.card.toString(),
                                    style: TextStyle(
                                        color: heraldBlue, fontSize: 17)))
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
                                padding: EdgeInsets.only(left : 6, right: 10),
                                child: Image(
                                    image: AssetImage(LECTURE), height: 17)),
                            Text("人文讲座",
                                style: TextStyle(
                                    color: Color(0xAA000000), fontSize: 14)),
                            Spacer(),
                            Container(
                                padding: EdgeInsets.only(right: 7),
                                child: Text(
                                    model.lecture == -1
                                        ? "暂无"
                                        : model.lecture.toString(),
                                    style: TextStyle(
                                        color: heraldBlue, fontSize: 17)))
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
                                padding: EdgeInsets.only(left: 3, right: 8),
                                child:
                                    Image(image: AssetImage(SRTP), height: 25)),
                            Text("SRTP",
                                style: TextStyle(
                                    color: Color(0xAA000000), fontSize: 14)),
                            Spacer(),
                            Container(
                                padding: EdgeInsets.only(right: 8),
                                child: Text(
                                    model.srtp == -1
                                        ? "暂无"
                                        : model.srtp.toString(),
                                    style: TextStyle(
                                        color: heraldBlue, fontSize: 17)))
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
                                padding: EdgeInsets.only(left : 5, right: 10),
                                child:
                                    Image(image: AssetImage(GPA), height: 20)),
                            Text("总绩点",
                                style: TextStyle(
                                    color: Color(0xAA000000), fontSize: 14)),
                            Spacer(),
                            Container(
                                padding: EdgeInsets.only(right: 6),
                                child: Text(
                                    model.gpa == -1
                                        ? "暂无"
                                        : model.gpa.toString(),
                                    style: TextStyle(
                                        color: heraldBlue, fontSize: 17)))
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
                            //     padding: EdgeInsets.only(left : 5, right: 10),
                            //     child:
                            //         Image(image: AssetImage(SRTP), height: 20)),
                            Container(
                              padding: EdgeInsets.only(left : 5),
                              child: Text("跑操",
                                  style: TextStyle(
                                      color: Color(0xAA000000), fontSize: 14)),
                            ),
                            Spacer(),
                            Container(
                                padding: EdgeInsets.only(right: 8),
                                child: Text(
                                    model.pe == -1 ? "暂无" : model.pe.toString(),
                                    style: TextStyle(
                                        color: heraldBlue, fontSize: 17)))
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
                            //     padding: EdgeInsets.only(left : 5, right: 10),
                            //     child:
                            //         Image(image: AssetImage(GPA), height: 20)),
                            Container(
                              padding: EdgeInsets.only(left : 5),
                              child: Text("借书",
                                  style: TextStyle(
                                      color: Color(0xAA000000), fontSize: 14)),
                            ),
                            Spacer(),
                            Container(
                                padding: EdgeInsets.only(right: 6),
                                child: Text(
                                    model.library == -1
                                        ? "暂无"
                                        : model.library.toString(),
                                    style: TextStyle(
                                        color: heraldBlue, fontSize: 17)))
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
                      //     padding: EdgeInsets.only(left : 5, right: 10),
                      //     child:
                      //         Image(image: AssetImage(GPA), height: 20)),
                      Container(
                        padding: EdgeInsets.only(left : 5, top: 3),
                        child: Text("实用小板块",
                            style: TextStyle(
                                color: Color(0xAA000000), fontSize: 14)),
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