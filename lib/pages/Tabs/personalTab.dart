import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import 'package:provider/provider.dart';
import '../../models/base.dart';
import '../../models/toast.dart';
import '../../common/theme.dart';
import '../../app.dart';

const LOGOUT_ICON = "resources/images/logout.png";
const DOWNLOAD_ICON = "resources/images/download.png";
const EXPAND_ICON = "resources/images/expand.png";

class PersonalTabModel extends BaseModel {
  String _name = '黄开鸿';
  String _studentType = '本科生';

  PersonalTabModel(BuildContext context) : super(context);

  get name {
    return this._name;
  }

  get studentType {
    return this._studentType;
  }

  set name(value) {
    this._name = value;
    notifyListeners();
  }

  set studentType(value) {
    this._studentType = value;
    notifyListeners();
  }

  // TODO: 故障发送跳转
  Future<void> feedBack(BuildContext context) async {
    Toast.toast(context, msg: '小猴偷米: 您的问题已经提交~', position: ToastPostion.bottom);
  }

  // TODO: 各页面跳转函数
  void gotoNewStudentGuide(BuildContext context) {
    //跳转到新生指引
    Navigator.of(context, rootNavigator: true).pushNamed("/example");
  }

  void gotoSchedulePredict(BuildContext context) {
    //跳转到课表预测
    Navigator.of(context, rootNavigator: true).pushNamed("/example");
  }

  void gotoCalendar(BuildContext context) {
    //跳转到校历
    Navigator.of(context, rootNavigator: true).pushNamed("/example");
  }

  void gotoLaundryEnquiry(BuildContext context) {
    //跳转到洗衣房查询
    Navigator.of(context, rootNavigator: true).pushNamed("/example");
  }
  Future<void> refresh(BuildContext context){
      print("personal");
  }
  void gotoSchoolBusAssistant(BuildContext context) {
    //跳转到校车助手
    Navigator.of(context, rootNavigator: true).pushNamed("/example");
  }
}

class PersonalTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PersonalTabModel(context),
        child: PersonalTabView());
  }
}

class PersonalTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PersonalTabModel>(
        builder: (context, personalTabModel, child) {
      return Scaffold(
          appBar: heraldBar(context,personalTabModel.refresh),
          body: Center(
              child: Container(
                  decoration: BoxDecoration(color: heraldBackGround),
                  child: Column(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.all(15),
                          alignment: Alignment(0, 0),
                          height: 110,
                          width: MediaQuery.of(context).size.width - 30,
                          decoration: heraldContainerTheme,
                          child: Container(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, top: 15, bottom: 0),
                              child: Column(children: <Widget>[
                                Row(children: <Widget>[
                                  Container(
                                      padding:
                                          EdgeInsets.only(left: 10, bottom: 10),
                                      child: Text(personalTabModel.name,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xFF000000),
                                          ))),
                                  Container(
                                      padding: EdgeInsets.only(
                                          top: 10, left: 15, bottom: 10),
                                      child: Text(
                                          "东南大学" + personalTabModel.studentType,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0x99000000),
                                          )))
                                ]),
                                heraldDivider,
                                Row(children: <Widget>[
                                  Container(
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  70) /
                                              2,
                                      child: Container(
                                        padding: EdgeInsets.only(top: 17),
                                        child: GestureDetector(
                                            onTap: () {
                                              Provider.of<PersonalTabModel>(
                                                      context,
                                                      listen: false)
                                                  .feedBack(context);
                                            },
                                            child: Column(children: <Widget>[
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text("故障反馈",
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Color(
                                                                0xEE000000))),
                                                    Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 3),
                                                        child: Image(
                                                            image: AssetImage(
                                                                DOWNLOAD_ICON),
                                                            height: 20))
                                                  ])
                                            ])),
                                      )),
                                  Container(
                                      height: 20,
                                      width: 1,
                                      child:
                                          VerticalDivider(color: Colors.grey)),
                                  Container(
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                      70) /
                                                  2 -
                                              1,
                                      child: Container(
                                        padding: EdgeInsets.only(top: 17),
                                        child: GestureDetector(
                                            onTap: () {
                                              Provider.of<AppModel>(context,
                                                      listen: false)
                                                  .logout(context);
                                            },
                                            child: Column(children: <Widget>[
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text("退出登录",
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Color(
                                                                0xEE000000))),
                                                    Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 3),
                                                        child: Image(
                                                            image: AssetImage(
                                                                LOGOUT_ICON),
                                                            height: 20))
                                                  ])
                                            ])),
                                      )),
                                ])
                              ]))),
                      Container(
                          margin: EdgeInsets.only(left: 15, right: 15),
                          alignment: Alignment(0, 0),
                          height: 220,
                          width: MediaQuery.of(context).size.width - 30,
                          decoration: heraldContainerTheme,
                          child: Container(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, top: 5, bottom: 0),
                              child: Column(children: <Widget>[
                                Container(
                                  height: 50,
                                  child: GestureDetector(
                                      onTap: () {
                                        Provider.of<PersonalTabModel>(context,
                                                listen: false)
                                            .gotoNewStudentGuide(context);
                                      },
                                      child: Row(children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Image(
                                              image: AssetImage(
                                                  "resources/images/personalPage/guide.png"),
                                              height: 20),
                                        ),
                                        Container(
                                            padding: EdgeInsets.only(left: 12),
                                            child: Text("新生指引",
                                                style: TextStyle(
                                                    color: Color(0xFF000000),
                                                    fontSize: 15))),
                                        Spacer(),
                                        Container(
                                            child: Image(
                                                image: AssetImage(
                                                    "resources/images/right.png"),
                                                height: 18))
                                      ])),
                                ),
                                heraldDivider,
                                Container(
                                  height: 50,
                                  child: GestureDetector(
                                      onTap: () {
                                        Provider.of<PersonalTabModel>(context,
                                                listen: false)
                                            .gotoSchedulePredict(context);
                                      },
                                      child: Row(children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Image(
                                              image: AssetImage(
                                                  "resources/images/personalPage/predict.png"),
                                              height: 20),
                                        ),
                                        Container(
                                            padding: EdgeInsets.only(left: 12),
                                            child: Text("课表预测",
                                                style: TextStyle(
                                                    color: Color(0xFF000000),
                                                    fontSize: 15))),
                                        Spacer(),
                                        Container(
                                            child: Image(
                                                image: AssetImage(
                                                    "resources/images/right.png"),
                                                height: 18))
                                      ])),
                                ),
                                heraldDivider,
                                Container(
                                  height: 50,
                                  child: GestureDetector(
                                      onTap: () {
                                        Provider.of<PersonalTabModel>(context,
                                                listen: false)
                                            .gotoCalendar(context);
                                      },
                                      child: Row(children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Image(
                                              image: AssetImage(
                                                  "resources/images/personalPage/calendar.png"),
                                              height: 25),
                                        ),
                                        Container(
                                            padding: EdgeInsets.only(left: 9),
                                            child: Text("查看校历",
                                                style: TextStyle(
                                                    color: Color(0xFF000000),
                                                    fontSize: 15))),
                                        Spacer(),
                                        Container(
                                            child: Image(
                                                image: AssetImage(
                                                    "resources/images/right.png"),
                                                height: 18))
                                      ])),
                                ),
                                heraldDivider,
                                Container(
                                  height: 50,
                                  child: GestureDetector(
                                      onTap: () {
                                        Provider.of<PersonalTabModel>(context,
                                                listen: false)
                                            .gotoSchoolBusAssistant(context);
                                      },
                                      child: Row(children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 3, right: 10),
                                          child: Image(
                                              image: AssetImage(
                                                  "resources/images/personalPage/bus.png"),
                                              height: 20),
                                        ),
                                        Container(
                                            padding: EdgeInsets.only(left: 12),
                                            child: Text("校车助手",
                                                style: TextStyle(
                                                    color: Color(0xFF000000),
                                                    fontSize: 15))),
                                        Spacer(),
                                        Container(
                                            child: Image(
                                                image: AssetImage(
                                                    "resources/images/right.png"),
                                                height: 18))
                                      ])),
                                ),
                              ])))
                    ],
                  ))));
    });
  }
}
