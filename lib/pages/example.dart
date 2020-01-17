import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../app.dart';

class ExampleModel extends ChangeNotifier {
  bool _showLoading = true;
  String _hintText = '请稍候……';

  set showLoading(bool value) {
    this._showLoading = value;
    notifyListeners();
  }

  get showLoading {
    return this._showLoading;
  }

  set hintText(String value) {
    this._hintText = value;
  }

  get hintText {
    return this._hintText;
  }

  void logout(context){
    Provider.of<AppModel>(context, listen:false).logout(context);
  }

  void pushNewRoute(context){
    Navigator.of(context).pushNamed('/example');
  }
}

class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ExampleModel(), child: ExampleView());
  }
}

class ExampleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("示例路由"),
          //actionsForegroundColor: Color(0xFFFFFFFF),
        ),
        child: Center(
          child: Column(children: <Widget>[
CupertinoButton(
          child:Text("打开新路由", style:TextStyle(color:Color(0xFF13ACD9))),
          onPressed: () {
            Provider.of<ExampleModel>(context, listen:false).pushNewRoute(context);
          }
        ),
        CupertinoButton(
          child:Text("点击注销", style:TextStyle(color:Color(0xFF13ACD9))),
          onPressed: () {
            Provider.of<ExampleModel>(context, listen:false).logout(context);
          }
        )
          ],)
          ));
  }
}
