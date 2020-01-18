import 'package:flutter/cupertino.dart';
import '../../models/base.dart';
import '../../main.dart';
import 'package:provider/provider.dart';

class HomeTabModel extends BaseModel {
  HomeTabModel(BuildContext context) : super(context);
}

class HomeTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeTabModel(context), child: HomeTabView());
  }
}

class HomeTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text('小猴偷米')),
        child: Center(
            child: CupertinoButton(
                child: Text('打开新路由'),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .pushNamed("/example");
                })));
  }
}
