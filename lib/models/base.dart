import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import '../common/config.dart';
import '../common/store.dart';
import '../app.dart';

class BaseModel extends ChangeNotifier {
  BuildContext context;
  AppModel appModel;

  BaseModel(this.context):super(){
    appModel = Provider.of<AppModel>(context, listen: false);
  }

}