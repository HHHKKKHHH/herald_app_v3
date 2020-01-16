import 'package:flutter/cupertino.dart';
import '../pages/welcome.dart';

Map<String, WidgetBuilder> heraldRoutes =  <String, WidgetBuilder>{
  "/":(context){
    print('in router');
    return WelcomePage();
    }
};