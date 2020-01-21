import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app.dart';
import '../models/base.dart';
import '../common/theme.dart';

class ExampleModel extends BaseModel {
  bool _showLoading = true;
  String _hintText = '请稍候……';

  ExampleModel(BuildContext context):super(context);

  set showLoading(bool value) {
    this._showLoading = value;
    notifyListeners();
  }

  get showLoading {
    return this._showLoading;
  }

  set hintText(String value) {
    this._hintText = value;
    notifyListeners();
  }

  get hintText {
    return this._hintText;
  }

  Future<void> logout(context) async{
    //hintText = 'zzj-socute';
    await Future.delayed(Duration(seconds:3));
    appModel.logout(context);
  }

  void pushNewRoute(context) {
    Navigator.of(context).pushNamed('/example');
  }
}

class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ExampleModel(context), child: ExampleView());
  }
}

class ExampleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:customBar(context,"示例路由"),
        body: Center(
            child: Column(
          children: <Widget>[
            CupertinoButton(
                child:
                    Text("打开新路由", style: TextStyle(color: Color(0xFF13ACD9))),
                onPressed: () {
                  Provider.of<ExampleModel>(context, listen: false)
                      .pushNewRoute(context);
                }),
            Text( Provider.of<ExampleModel>(context).hintText, style: TextStyle(color: Color(0xFF000000))),
            CupertinoButton(
                child: Text("点击注销", style: TextStyle(color: Color(0xFF13ACD9))),
                onPressed: () {
                  Provider.of<ExampleModel>(context, listen: false)
                      .logout(context);
                })
          ],
        )));
  }
}
