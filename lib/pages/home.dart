import 'package:flutter/cupertino.dart';
import './Tabs/homeTab.dart';
import './Tabs/notificationTab.dart';
import './Tabs/personalTab.dart';

const HOME_TAB_ICON = 'resources/images/tabIcons/home.png';
const HOME_TAB_ICON_ACTIVE = 'resources/images/tabIcons/home-active.png';
const NOTIFICATION_TAB_ICON = 'resources/images/tabIcons/notification.png';
const NOTIFICATION_TAB_ICON_ACTIVE = 'resources/images/tabIcons/notification-active.png';
const PERSONAL_TAB_ICON='resources/images/tabIcons/personal.png';
const PERSONAL_TAB_ICON_ACTIVE = 'resources/images/tabIcons/personal-active.png';

Widget homePage() {
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
      ),
      BottomNavigationBarItem(
        icon: Padding(child:Image(image:AssetImage(PERSONAL_TAB_ICON)), padding: EdgeInsets.only(top: 5.0),),
        activeIcon: Padding(child:Image(image:AssetImage(PERSONAL_TAB_ICON_ACTIVE)), padding: EdgeInsets.only(top: 5.0),),
        title: Text('我的'),
      ),
    ],
    backgroundColor:Color(0xFFFFFFFF),
    ),
    tabBuilder: (BuildContext context, int index) {
      var tabs = [
        HomeTabPage(),
        NotificationTabPage(),
        PersonalTabPage()
      ];
      return CupertinoTabView(builder: (context){return tabs[index];});
    },
  );
}
