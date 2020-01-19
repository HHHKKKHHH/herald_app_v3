import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import 'package:provider/provider.dart';
import '../../models/base.dart';
import '../../models/toast.dart';
import '../../common/theme.dart';
import '../../app.dart';
class NotificationTabModel extends BaseModel {

  NotificationTabModel(BuildContext context):super(context);
}

class NotificationTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => NotificationTabModel(context), child: NotificationTabView());
  }
}

class NotificationTabView extends StatelessWidget{
  @override
Widget build(BuildContext context){
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
}