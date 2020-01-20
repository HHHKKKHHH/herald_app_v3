import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import './common/store.dart';
import './app.dart';

Future<void> init() async {
  print("应用初始化开始");
  //设置状态栏与状态栏字体颜色
  if (Platform.isAndroid) {//
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Color(0xFFFFFFFF),  
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  else{
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }
  await Store.init();
  return;
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init().then((e) {
    runApp(App());
  });
}

