import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import './pages/home.dart';
import './pages/login.dart';
import './common/store.dart';
import './common/theme.dart';
import './common/routes.dart';

class AppModel extends ChangeNotifier {
  String _apiToken;

  AppModel() : super() {
    _apiToken = Store.prefs.getString(Store.keyMap["API_TOKEN"]);
  }

  get isLoggedIn {
    return !(_apiToken == null || _apiToken.isEmpty);
  }

  void login(BuildContext context, String newApiToken) async {
    this._apiToken = newApiToken;
    await Store.prefs.setString(Store.keyMap["API_TOKEN"], _apiToken);
    notifyListeners();
  }

  void logout(BuildContext context) async {
    this._apiToken = null;
    await Store.prefs.clear();
    Navigator.popUntil(context, ModalRoute.withName("/"));
    notifyListeners();
  }
}

class App extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AppModel())
        ],
        child: CupertinoApp(
          title: "小猴偷米",
          theme: heraldTheme,
          home: Consumer<AppModel>(builder: (context, appModel, child) {
            return appModel.isLoggedIn ? homePage() : LoginPage();
          }),
          routes: heraldRoutes,
        )
    );
  }
}
