import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/base.dart';
import '../../common/theme.dart';

class TimeTableModel extends BaseModel {
  List _curriculum = [];
  String _select = "周视图";
  set select(String value) {
    if (value == "周视图") {
    } else if (value == "时间轴") {
    } else {}
    this._select = value;
    notifyListeners();
  }

  get select {
    return this._select;
  }

  TimeTableModel(BuildContext context) : super(context) {}
}

class TimeTableComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TimeTableModel(context), child: TimeTableView());
  }
}

class TimeTableView extends StatelessWidget {
  //tab按钮
  Widget tab(BuildContext context, TimeTableModel model, String props) {
    return GestureDetector(
      onTap: () {
        model.select = props;
      },
      child: Container(
          width: (MediaQuery.of(context).size.width - 30) / 3,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            color: model.select == props ? Color(0xFFFFFFFF) : heraldBackGround,
          ),
          child: Center(
              child: Text(props,
                  style: TextStyle(
                      color: model.select == props
                          ? Color(0xFF000000)
                          : Color(0x99000000))))),
    );
  }

  //TabBar
  Widget tabBar(BuildContext context, TimeTableModel model) {
    return Row(
      children: <Widget>[
        this.tab(context, model, "周视图"),
        this.tab(context, model, "时间轴"),
        this.tab(context, model, "课程概览"),
      ],
    );
  }
  //课表（周视图）
  Widget classTable(BuildContext context,TimeTableModel model){
    return Container(
      height: MediaQuery.of(context).size.height - 210,
      decoration:BoxDecoration(
    color: Color(0xFFFFFFFF),
    borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
    boxShadow: [
      BoxShadow(
          color: Color(0x16000000),
          offset: Offset(0, 2),
          blurRadius: 1,
          spreadRadius: 0.1)
    ]),
    );
  }
  //课表（时间轴）
  Widget timeLine(BuildContext context,TimeTableModel model){
    return Container();
  }
  //课程概览
  Widget overView(BuildContext context, TimeTableModel model){
    return Container();
  }
  //具体选项卡
  Widget tabBarView(BuildContext context, TimeTableModel model) {
    if(model.select=="周视图"){
      return classTable(context, model);
    }
    else if (model.select=="时间轴"){
      return timeLine(context, model);
    }
    else {
      return overView(context, model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TimeTableModel>(builder: (context, model, child) {
      return Container(
          margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Column(children: <Widget>[
            tabBar(context, model),
            tabBarView(context, model)
          ]));
    });
  }
}
