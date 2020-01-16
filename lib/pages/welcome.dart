import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class WelcomeModel extends ChangeNotifier {
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
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WelcomeModel(),
      child: WelcomeView()
    );
  }
}

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text("欢迎"),),
      child:Center(
        child:Text('欢迎页'))
    );
  }
}
