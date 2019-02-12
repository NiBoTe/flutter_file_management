import 'package:flutter/material.dart';
import 'package:party_building_application/util/index.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  var userAvatar = 'http://pic27.nipic.com/20130329/890845_115317964000_2.jpg';
  var userName = "尼伯特";
  List<String> userListTitles = ['我的收藏', '我的共享', '我的借阅', '我的关注', '我的下载'];
  SliverAppBar _userHeaderHandle(BuildContext context) {
    return new SliverAppBar(
      pinned: false,
      backgroundColor: Colors.blue,
      expandedHeight: 160.0,
      iconTheme: new IconThemeData(color: Colors.transparent),
      flexibleSpace: new InkWell(
        onTap: () {
          print('======');
        },
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            userAvatar == null
                ? new Image.asset("images/shyk.png", width: 60.0, height: 60.0)
                : new Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        image: new DecorationImage(
                            image: new NetworkImage(userAvatar),
                            fit: BoxFit.cover),
                        border:
                            new Border.all(color: Colors.white, width: 2.0)),
                  ),
            new Container(
              margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: new Text(
                userName == null ? '点击头像登录' : userName,
                style: new TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            )
          ],
        ),
      ),
    );
  }

  Column _userItemHandle(BuildContext context, int index) {
    return new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Ink(
            child: new ListTile(
              title: new Text("${userListTitles[index]}"),
              onTap: () {},
              trailing: new Icon(
                Icons.arrow_forward_ios,
                size: TextSizeConst.middleTextSize,
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            ),
            color: ColorConst.color_white,
          ),
          new Divider(
            height: 1.0,
          )
        ]);
  }

  SliverFixedExtentList _userListHandle(BuildContext context) {
    return new SliverFixedExtentList(
        delegate:
            new SliverChildBuilderDelegate((BuildContext context, int index) {
          return _userItemHandle(context, index);
        }, childCount: userListTitles.length),
        itemExtent: 80.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        child: CustomScrollView(
          reverse: false,
          shrinkWrap: false,
          slivers: <Widget>[
            _userHeaderHandle(context),
            _userListHandle(context)
          ],
        ),
      ),
    );
  }
}
