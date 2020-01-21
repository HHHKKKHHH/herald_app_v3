import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herald_app/models/base.dart';
import 'package:provider/provider.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:dio/dio.dart';

class LoginModel extends BaseModel {
  bool _showLoading = false;
  String _hintText = '';
  FlutterWebviewPlugin _webview;

  LoginModel(BuildContext context) : super(context) {
    print("创建 LoginModel");
  }
  void showpolicy(context) {
    Navigator.of(context).pushNamed('/policy');
  }
  void showAgreement(context) {
    Navigator.of(context).pushNamed('/agreement');
  }
  set showLoading(bool value) {
    this._showLoading = value;
    notifyListeners();
  }

  get showLoading {
    return this._showLoading;
  }

  set hintText(String value) {
    this._hintText = value;
    notifyListeners();
  }

  get hintText {
    return this._hintText;
  }

  void testLogin(){
    String url="www.daidu.com";
    appModel.login(context, url);
  }
  void handleLogin() async {
    showLoading = true;
    hintText = "";
    if (_webview != null) {
      _webview.dispose();
    }
    await initWebview();
    // 点击登录按钮时，ids页面应该已经加载好了，直接展示即可
  }

  Future<void> initWebview() async {
    print('初始化 Webview');
    showLoading = true;
    _webview = new FlutterWebviewPlugin();
    // 为了防止调试过程中出现的打不开的问题，首先先关闭 webview
    _webview.close();
    // 创建一个隐藏的 webview 并等待其加载完毕
    _webview.launch(
      'https://newids.seu.edu.cn/authserver/logout?goto=https://tommy.seu.edu.cn/app-ids-logout',
      clearCache: true,
      clearCookies: true,
      debuggingEnabled: true,
      hidden: true,
    );
    _webview.onProgressChanged.listen((double progress) {
      print(progress);
      if (progress == 1.0) {
        _webview.show();
      }
    });
    _webview.onUrlChanged.listen((String url) {
      print(url);
      if (url.startsWith("https://tommy.seu.edu.cn/app-ids-login")) {
        idsLogin(url);
        _webview.close();
      }
    });
    _webview.onHttpError.listen((WebViewHttpError e) {
      if (e.code != "404") {
        // 忽略 404 错误
        showLoading = false;
        hintText = "统一身份认证系统加载出错：" + e.code;
      }
    });
  }

  Future<void> idsLogin(url) async {
    // TODO: 使用 url 换取 Token
    // Fake 一下先
    // Future.delayed(Duration(seconds: 3), (){
    //   Provider.of<AppModel>(_context, listen: false).login(_context, url);
    // });
    Dio dio = Dio();
    Response response;
    response=await dio.get("https://www.baidu.com/");
    print(response.data.toString());
    // Provider.of<AppModel>(_context, listen: false).login(_context, url);
    _webview.dispose();
    appModel.login(context, url);
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LoginModel(context), child: LoginView());
  }
}

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // navigationBar: CupertinoNavigationBar(
        //   backgroundColor: Color(0xffffffff),
        //   border: null,
        // ),
        body: SafeArea(
            child: Container(
              color:Color(0xFFFFFFFF),
              child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
              flex: 1,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 40),
                      child: Image(
                          image: AssetImage('resources/images/ids.png'),
                          width: 240.0)))),
        Expanded(
              flex: 1,
              child: Consumer<LoginModel>(builder: (context, loginModel, child) {
                return Column(
                  children: <Widget>[
                    loginModel.hintText.isEmpty
                        ? Container()
                        : Text(loginModel.hintText,
                            style: TextStyle(color: Color(0xFFFF8F8F))),
                    loginModel.showLoading
                        ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Color(0xFF13ACD9)),
                          )
                        : CupertinoButton(
                            child: Text("统一身份认证登录",
                                style: TextStyle(color: Color(0xFFFFFFFF))),
                            onPressed: () {
                              Provider.of<LoginModel>(context, listen: false)
                                  .testLogin();
                            },
                            color: Color(0xFF13ACD9),
                          ),
                    loginModel.showLoading
                        ? Container()
                        : Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('登录即表示您同意我们的',
                                    style: TextStyle(
                                        color: Color(0xFF333333),
                                        fontSize: 13.0)),
                                GestureDetector(
                                  onTap: () {
                                       Provider.of<LoginModel>(context, listen: false)
                                        .showAgreement(context);
                                  },
                                  child: Text(
                                    '用户协议、',
                                    style: TextStyle(
                                        color: Color(0xFF13ACD9), fontSize: 13.0),   
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Provider.of<LoginModel>(context, listen: false)
                                        .showpolicy(context);
                                  },
                                  child: Text(
                                    '隐私政策',
                                    style: TextStyle(
                                        color: Color(0xFF13ACD9), fontSize: 13.0),
                                  ),
                                ),
                              ],
                            )),
                    Spacer(),
                    Padding(
                        padding: EdgeInsets.only(bottom: 0.0),
                        child: Text('东南大学信使计划工作室出品 版权所有 2019-2020',
                            style: TextStyle(
                                color: Color(0xFFA0A0A0), fontSize: 13.0)))
                  ],
                );
              })),
      ],
    ),
            )));
  }
}
