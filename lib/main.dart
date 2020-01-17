import 'package:flutter/cupertino.dart';
import './common/store.dart';
import './app.dart';

Future<void> init() async {
  print("应用初始化开始");
  await Store.init();
  return;
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init().then((e) {
    runApp(App());
  });
}

