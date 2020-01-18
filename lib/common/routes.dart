import 'package:flutter/cupertino.dart';
import '../pages/example.dart';
import '../pages/agreementPages/privacyPolicy.dart';
import '../pages/agreementPages/userAgreement.dart';

Map<String, WidgetBuilder> heraldRoutes =  <String, WidgetBuilder>{
  "/example":(context) => ExamplePage(),
  "/agreement":(context) => UserAgreementPage(),
  "/policy":(context) =>PrivacyPolicyPage(),
};