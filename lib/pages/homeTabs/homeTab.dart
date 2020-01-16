import 'package:flutter/cupertino.dart';
import '../../main.dart';
import 'package:provider/provider.dart';

Widget homeTabView(BuildContext context){
  return CupertinoPageScaffold(
    navigationBar: CupertinoNavigationBar(
      middle: Text('小猴偷米')
    ),
    child:Center(
      child: CupertinoButton(
        child:Text('打开新路由'),
        onPressed: () {
          Navigator.of(context, rootNavigator:true).pushNamed("/example");
        }
      )
    )
  );
}