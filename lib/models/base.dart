import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import '../common/config.dart';
import '../common/store.dart';
import '../app.dart';

class BaseModel extends ChangeNotifier {
  BuildContext context;
  AppModel appModel;
  Dio dio = Dio();

  BaseModel(this.context):super(){
    // 获取 AppModel
    appModel = Provider.of<AppModel>(context, listen: false);
    // 初始化 Dio
    dio = new Dio();
    dio.options.baseUrl = Config.baseUrl;
    dio.options.headers['x-api-token'] = appModel.apiToken;
    dio.options.headers['content-type'] = "application/json";
    dio.options.connectTimeout = 30000;
    dio.options.receiveTimeout = 30000;
  }

}