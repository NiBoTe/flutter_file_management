import 'package:flutter/material.dart';
import 'package:party_building_application/router/routes.dart';
import 'package:party_building_application/util/index.dart';
import 'package:party_building_application/config/index.dart';
import 'views/tabs/index.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

import 'package:flutter_jpush/flutter_jpush.dart';

import 'package:flutter_app_badger/flutter_app_badger.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Common().SystemUiOverlayStyles(); //沉浸式状态栏
    return MaterialApp(
      title: '文档管理系统',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      initialRoute: Const.INITIAL_ROUTE,
      routes: Routes.routerList,
//      home: MyHomePage(title: '首页'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with AutomaticKeepAliveClientMixin<MyHomePage> {
  List<BottomNavigationBarItem> _bottomTabList = [
    new BottomNavigationBarItem(
        icon: new Icon(GroovinMaterialIcons.home), title: new Text("首页")),
    new BottomNavigationBarItem(
        icon: new Icon(Icons.insert_drive_file), title: new Text("文件")),
    new BottomNavigationBarItem(
        icon: new Icon(Icons.record_voice_over), title: new Text("日志")),
    new BottomNavigationBarItem(
        icon: new Icon(GroovinMaterialIcons.google_circles_communities),
        title: new Text("通讯录")),
    new BottomNavigationBarItem(
        icon: new Icon(Icons.person), title: new Text("我的")),
  ];
  int _tabIndex = 0;
  PageController _pageController;

  void _currentTap(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void _onPageChanged(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = new PageController(initialPage: _tabIndex);
    _startupJpush();
    _ConnectionChange();
    _AppBadger();//设置小红点
  }
  void _AppBadger() async{

    bool isAppBadgeSupported = await FlutterAppBadger.isAppBadgeSupported();
    if(isAppBadgeSupported){
//      FlutterAppBadger.removeBadge();
      FlutterAppBadger.updateBadgeCount(99);
    }

  }
  void _startupJpush() async {
    print("初始化jpush");
    await FlutterJPush.startup();
    print("初始化jpush成功");
    var registrationID = await FlutterJPush.getRegistrationID();
    print(registrationID);

    _ReceiveNotification();
    _OpenNotification();
  }

  /*
  * 是否链接
  * */
  void _ConnectionChange() async {
    FlutterJPush.addConnectionChangeListener((bool connected) {
      setState(() {
        print("连接状态改变：${connected}");
        if (connected) {

        }
      });
    });
  }

/*
* 收到推送提醒
* */
  void _ReceiveNotification() async {
    FlutterJPush.addReceiveNotificationListener(
            (JPushNotification notification) {
          setState(() {
            /// 收到推送
            print("收到推送提醒: $notification");
          });
        });
  }

  /*
  * 打开推送提醒
  * */

  void _OpenNotification() async {
    FlutterJPush.addReceiveOpenNotificationListener(
            (JPushNotification notification) {
          setState(() {
            print("打开了推送提醒: $notification");
          });
        });
  }


  /*
  * 监听接收自定义消息
  * */

  void _ReceiveCustomMsg() async {
    FlutterJPush.addReceiveCustomMsgListener((JPushMessage msg) {
      setState(() {
        print("收到推送消息提醒: $msg");

        /// 打开了推送提醒
//        notificationList.add(msg);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return
      new WillPopScope(
          child: Scaffold(
            body: new PageView(
              controller: _pageController,
              children: <Widget>[
                new MyHome(),
                new MyFile(),
                new MyTransmission(),
                new MyAddress(),
                new MyPage()
              ],
              onPageChanged: _onPageChanged,
            ),
            bottomNavigationBar: new BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: _bottomTabList,
              onTap: _currentTap,
              currentIndex: _tabIndex,
            ),
          ),
          onWillPop: Common().onWillPop);
  }

  @override
  bool get wantKeepAlive => true;
}
