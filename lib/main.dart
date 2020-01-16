import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import './common/miscellaneous.dart';
import './pages/homeTabScaffold.dart';
import './pages/welcome.dart';
import './pages/login.dart';
import './common/store.dart';
import './common/theme.dart';
import './common/routes.dart';

Future<void> init() async {
  print("应用初始化开始");
  await Store.init();
  return;
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  print(heraldRoutes['/'](null));
  init().then((e) {
    runApp(App());
  });
}

class AppModel extends ChangeNotifier {
  BuildContext _context;
  String _apiToken;

  AppModel(this._context) : super() {
    _apiToken = Store.prefs.getString(Store.keyMap["api_token"]);
  }

  get isLoggedIn {
    return !(_apiToken == null || _apiToken.isEmpty);
  }

  void login(String newApiToken) async {
    this._apiToken = newApiToken;
    await Store.prefs.setString(Store.keyMap["api_token"], _apiToken);
    notifyListeners();
  }

  void logout() async {
    this._apiToken = null;
    await Store.prefs.clear();
    notifyListeners();
  }
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AppModel(context))
        ],
        child: Consumer<AppModel>(builder: (context, appModel, child) {
          if (appModel.isLoggedIn) {
            return CupertinoApp(
              title: '小猴偷米',
              theme: heraldTheme,
              initialRoute: "/",
              routes: heraldRoutes,
            );
          } else {
            return CupertinoApp(
                title: '小猴偷米', theme: heraldTheme, home: LoginPage());
          }
        }));
  }
}
