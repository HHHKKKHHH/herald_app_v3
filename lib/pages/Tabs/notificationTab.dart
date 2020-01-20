import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../main.dart';
import 'package:provider/provider.dart';
import '../../models/base.dart';
import '../../models/toast.dart';
import '../../common/theme.dart';
import '../../app.dart';

class NotificationTabModel extends BaseModel {
  List _officeData = [
    <String, String>{
      "title": "2020年加州大学的报名通知1",
      "type": "国际交流",
      "time": "上周五",
      "isImportant": "true",
      "isAcc": "true",
      "url": "www.baidu.com"
    },
    <String, String>{
      "title": "2020年加州大学欧文分校工程学院本硕联合培养项目的报名通知2",
      "type": "国际交流",
      "time": "上周五",
      "isImportant": "true",
      "isAcc": "false",
    },
    <String, String>{
      "title": "2020年加州大学欧文分校工程学院3+2本硕联合培养项目的报名通知3",
      "type": "国际交流",
      "time": "上周五",
      "isImportant": "true",
      "isAcc": "true",
      "url": "www.baidu.com"
    },
    <String, String>{
      "title": "2020年加州大学欧文分校工程学院3+2本硕联合培养项目的报名通知4",
      "type": "国际交流",
      "time": "上周五",
      "isImportant": "true",
      "isAcc": "false",
    },
    <String, String>{
      "title": "2020年加州大学欧文分校工程学院3+2本硕联合培养项目的报名通知5",
      "type": "国际交流",
      "time": "上周五",
      "isImportant": "true",
      "isAcc": "false"
    },
        <String, String>{
      "title": "2020年加州大学欧文分校工程学院3+2本硕联合培养项目的报名通知5",
      "type": "国际交流",
      "time": "上周五",
      "isImportant": "true",
      "isAcc": "false"
    },
        <String, String>{
      "title": "2020年加州大学欧文分校工程学院3+2本硕联合培养项目的报名通知5",
      "type": "国际交流",
      "time": "上周五",
      "isImportant": "true",
      "isAcc": "false"
    },
        <String, String>{
      "title": "2020年加州大学欧文分校工程学院3+2本硕联合培养项目的报名通知5",
      "type": "国际交流",
      "time": "上周五",
      "isImportant": "true",
      "isAcc": "false"
    },
        <String, String>{
      "title": "2020年加州大学欧文分校工程学院3+2本硕联合培养项目的报名通知5",
      "type": "国际交流",
      "time": "上周五",
      "isImportant": "true",
      "isAcc": "false"
    },
        <String, String>{
      "title": "2020年加州大学欧文分校工程学院3+2本硕联合培养项目的报名通知5",
      "type": "国际交流",
      "time": "上周五",
      "isImportant": "true",
      "isAcc": "false"
    },
        <String, String>{
      "title": "2020年加州大学欧文分校工程学院3+2本硕联合培养项目的报名通知5",
      "type": "国际交流",
      "time": "上周五",
      "isImportant": "true",
      "isAcc": "false"
    },
        <String, String>{
      "title": "2020年加州大学欧文分校工程学院3+2本硕联合培养项目的报名通知5",
      "type": "国际交流",
      "time": "上周五",
      "isImportant": "true",
      "isAcc": "false"
    },
  ];
  List _srtpData = [
    <String, String>{
      "title": "东南大学第二届在校本科生人体解剖与组胚绘图比赛",
      "time": "上周五",
    },
    <String, String>{
      "title": "东南大学第二届在校本科生人体解剖与组胚绘图比赛",
      "time": "上周五",
    },
    <String, String>{
      "title": "东南大学第二届在校本科生人体解剖与组胚绘图比赛",
      "time": "上周五",
    },
    <String, String>{
      "title": "东南大学第二届在校本科生人体解剖与组胚绘图比赛",
      "time": "上周五",
    },
    <String, String>{
      "title": "东南大学第二届在校本科生人体解剖与组胚绘图比赛",
      "time": "上周五",
    },
  ];
  List _data = [];
  int _activity = 1; //1 = office , 2 = srtp

  set officeData(List value) {
    this._officeData = value;
    notifyListeners();
  }

  set srtpData(List value) {
    this._srtpData = value;
    notifyListeners();
  }

  set activity(int value) {
    if (value == 1) {
      this.data = this.officeData;
    } else if (value == 2) {
      this.data = this.srtpData;
    }
    this._activity = value;
    notifyListeners();
  }

  set data(List value) {
    this._data = value;
    notifyListeners();
  }

  get officeData {
    return this._officeData;
  }

  get srtpData {
    return this._srtpData;
  }

  get data {
    return this._data;
  }

  get activity {
    return this._activity;
  }

  Future<void> refresh(BuildContext context) {
    //TODO: 数据处理
  }

  void goto(Map<String,String> item){
    if(item["isAcc"]=="true"){
      //TODO: 打开浏览器下载附件
      }
    else{
      //TODO:打开指定路由,收集数据
      Navigator.of(context, rootNavigator: true).pushNamed("/example");
    }

  }
  NotificationTabModel(BuildContext context) : super(context) {
    data = officeData;
    refresh(context);
  }
}

class NotificationTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => NotificationTabModel(context),
        child: NotificationTabView());
  }
}

class NotificationTabView extends StatelessWidget {
  //列表项构建
  Widget listItem(BuildContext context, Map<String, String> item,NotificationTabModel model) {
    return Container(
        width: MediaQuery.of(context).size.width - 60,
        height: item.containsKey("type") ? 100 : 70,
        child: Column(children: <Widget>[
          heraldDivider,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () {model.goto(item);},
                child: Container(
                    padding: EdgeInsets.only(top: 5, bottom: 0),
                    width: MediaQuery.of(context).size.width - 115,
                    height: item.containsKey("type") ? 90 : 60,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: Text(item["title"],
                                  style: TextStyle(
                                      color: Color(0xFF0000000), fontSize: 16)),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              item["isImportant"] == "true"
                                  ? Container(
                                      margin: EdgeInsets.only(right: 5),
                                      width: 40,
                                      height: 22,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: heraldBlue, width: 1),
                                        borderRadius: BorderRadius.circular(15),
                                        color: heraldBlue,
                                      ),
                                      child: Container(
                                          child: Center(
                                              child: Text("重要",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold)))))
                                  : Container(),
                              item["isAcc"] == "true"
                                  ? Container(
                                      margin: EdgeInsets.only(right: 5),
                                      width: 40,
                                      height: 22,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: heraldBlue, width: 1),
                                        borderRadius: BorderRadius.circular(15),
                                        color: heraldBlue,
                                      ),
                                      child: Container(
                                          child: Center(
                                              child: Text("附件",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold)))))
                                  : Container(),
                              item.containsKey("type")
                                  ? Container(
                                      child: Text(item["type"],
                                          style: TextStyle(
                                              color: Color(0x990000000),
                                              fontSize: 13)),
                                    )
                                  : Container(),
                            ],
                          ),
                        ])),
              ),
              Spacer(),
              Container(
                  padding: EdgeInsets.only(right: 5, top: 8),
                  child: Text(item["time"],
                      style: TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 14,
                          fontWeight: FontWeight.bold)))
            ],
          )
        ]));
  }

  //列表构建
  Widget list(BuildContext context, List data,NotificationTabModel model) {
    List<Widget> li = [];
    for (Map<String, String> item in data) {
      li.add(listItem(context, item,model));
    }
    return Column(children: li);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationTabModel>(builder: (context, model, child) {
      return Scaffold(
          appBar: heraldBar,
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: heraldBackGround,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
                child: Container(
                    // height: 500,
                    margin: EdgeInsets.all(15),
                    decoration: heraldContainerTheme,
                    child: Container(
                        padding: EdgeInsets.only(top:15,left:15,right:15),
                        width: MediaQuery.of(context).size.width - 60,
                        child: Column(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.only(top: 10, bottom: 15),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(right: 5),
                                        width: 60,
                                        height: 27,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: heraldBlue, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: model.activity == 1
                                                ? heraldBlue
                                                : Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color(0x5513ACD9),
                                                  offset: Offset(0, 3),
                                                  blurRadius: 5,
                                                  spreadRadius: 0.1)
                                            ]),
                                        child: GestureDetector(
                                            onTap: () {
                                              model.activity = 1;
                                            },
                                            child: Container(
                                                child: Center(
                                              child: Text("教务处",
                                                  style: TextStyle(
                                                      color: model.activity == 1
                                                          ? Colors.white
                                                          : heraldBlue,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ))),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        width: 60,
                                        height: 27,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: heraldBlue, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: model.activity == 2
                                                ? heraldBlue
                                                : Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color(0x5513ACD9),
                                                  offset: Offset(0, 3),
                                                  blurRadius: 5,
                                                  spreadRadius: 0.1)
                                            ]),
                                        child: GestureDetector(
                                            onTap: () {
                                              model.activity = 2;
                                            },
                                            child: Container(
                                                child: Center(
                                              child: Text("SRTP",
                                                  style: TextStyle(
                                                      color: model.activity == 2
                                                          ? Colors.white
                                                          : heraldBlue,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ))),
                                      ),
                                    ])),
                            this.list(context, model.data,model)
                          ],
                        )))),
          ));
    });
  }
}
