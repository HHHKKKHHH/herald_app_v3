import 'package:flutter/cupertino.dart';
import './homeTabs/homeTab.dart';
import './homeTabs/notificationTab.dart';

const HOME_TAB_ICON = 'resources/images/tabIcons/home.png';
const HOME_TAB_ICON_ACTIVE = 'resources/images/tabIcons/home-active.png';
const NOTIFICATION_TAB_ICON = 'resources/images/tabIcons/notification.png';
const NOTIFICATION_TAB_ICON_ACTIVE = 'resources/images/tabIcons/notification-active.png';

Widget homeTabScaffold(BuildContext context) {
  return CupertinoTabScaffold(
    tabBar: CupertinoTabBar(
      activeColor:null,
      items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Padding(child:Image(image:AssetImage(HOME_TAB_ICON)), padding: EdgeInsets.only(top: 5.0),),
        activeIcon: Padding(child:Image(image:AssetImage(HOME_TAB_ICON_ACTIVE)), padding: EdgeInsets.only(top:5.0),),
        title: Text('主页'),
      ),
      BottomNavigationBarItem(
        icon: Padding(child:Image(image:AssetImage(NOTIFICATION_TAB_ICON)), padding: EdgeInsets.only(top: 5.0),),
        activeIcon: Padding(child:Image(image:AssetImage(NOTIFICATION_TAB_ICON_ACTIVE)), padding: EdgeInsets.only(top: 5.0),),
        title: Text('通知'),
      )
    ],
    backgroundColor:Color(0xFFFFFFFF),
    ),
    tabBuilder: (BuildContext context, int index) {
      var tabs = [
        homeTabView,
        notificationTabView,
      ];
      return CupertinoTabView(builder: tabs[index]);
    },
  );
}
