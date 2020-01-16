import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class LoginModel extends ChangeNotifier {
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

  void handleLogin(BuildContext context){
    Provider.of<AppModel>(context, listen:false).login("fake_token");
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginModel(),
      child: LoginView()
      );
  }
}

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return CupertinoPageScaffold(
      child: Center(
        child:Column(
          children: <Widget>[
            Text('登录页', style: TextStyle(color: Color(0xFF13ACD9)),), 
            CupertinoButton(child: Text('登录'), onPressed:(){
              Provider.of<LoginModel>(context, listen:false).handleLogin(context);
            })
          ],
        )
      ),
    );
  }
}
