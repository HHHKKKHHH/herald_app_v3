import 'package:flutter/cupertino.dart';

Widget homeTabView(BuildContext context){
  return CupertinoPageScaffold(
    navigationBar: CupertinoNavigationBar(
      middle: Text('小猴偷米')
    ),
    child:Center(
      child:Text('zzj-home')
    )
  );
}