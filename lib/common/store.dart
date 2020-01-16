import 'package:shared_preferences/shared_preferences.dart';

class Store {
  static SharedPreferences prefs;
  static Future<void> init() async {
    Store.prefs = await SharedPreferences.getInstance();
    print('初始化完成');
  }
  static Map<String, String> keyMap = {
    "API_TOKEN":"HERLAD_APP_API_TOKEN"
  };
  
}

