import 'package:flutter/cupertino.dart';

Widget notificationTabView(BuildContext context){
  return CupertinoPageScaffold(
    navigationBar: CupertinoNavigationBar(
      middle: Text('通知公告')
    ),
    child:Center(
      child:CupertinoButton(
        child: Text('打开新的路由'),
        onPressed: () {
        }
      )
    )
  );
}