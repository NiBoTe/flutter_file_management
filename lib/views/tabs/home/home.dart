import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:party_building_application/util/index.dart';
import 'package:party_building_application/widget/index.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with AutomaticKeepAliveClientMixin{
  ScrollController _scrollController;
  List _getList = [];
  List banners = [
    "1080-1882.png",
    "1080-1882.png",
  ];

  List bannersItems = ["图片", "视频", "文档", "音乐"];
  Widget _appBarTitle = new Text("首页");

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 3000)).then((val) {
      setState(() {
        _getList = [
          '123123',
          '123123',
          '123123',
          '123123',
          '123123',
          '123123',
          '123123',
          '123123',
          '123123',
          '123123',
          '123123',
        ];
      });
    });
  }

  Widget _bannerItem(String str) {
    Image tabItemImage;
    int tabItemIndex= bannersItems.indexOf(str);
    switch(tabItemIndex){
      case 0:
        tabItemImage = new Image.asset("images/icons/image.png");
        break;
      case 1:
        tabItemImage = new Image.asset("images/icons/video.png");
        break;
      case 2:
        tabItemImage = new Image.asset("images/icons/folder.png");
        break;
      case 3:
        tabItemImage = new Image.asset("images/icons/mp3.png");
        break;
      default:
        tabItemImage = new Image.asset("images/icons/unknown.png");
    }
    return new Expanded(
      flex: 1,
      child: new ListTile(
        title: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              width: 40.0,
              height: 40.0,
              child: tabItemImage,
            ),
            new SizedBox(height: 10.0),
            new Text(str)
          ],
        ),
        onTap: () {
          print(str);
          print(bannersItems.indexOf(str));
        },
      ),
    );
  }

  getBody() {
    if (_getList.length != 0) {
      return ListView.separated(
        controller: _scrollController,
        separatorBuilder: (BuildContext context, int index) {
          if (index == 0)
            return new Container(
              height: 5.0,
              color: ColorConst.color_eee,
            );
          return new Divider();
        },
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return new Container(
              width: Common.screenWidth(context),
              height: 100,
              margin: EdgeInsets.only(bottom: 5.0),
              child: new Swiper(
                autoplayDelay: 5000,
                itemWidth: Common.screenWidth(context),
                itemHeight: 100,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: new Flex(

                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      direction: Axis.horizontal,
                      children:
                      bannersItems.map((str) => _bannerItem(str)).toList(),
                    ),
                  );
                },
                itemCount: banners.length,
              ),
            );
          }
          return new ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            title: new Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: new Row(
                children: <Widget>[
                  new Text(
                    "3分钟前",
                    style: new TextStyle(
                        color: ColorConst.color_999,
                        fontSize: TextSizeConst.minTextSize),
                  ),
                  new SizedBox(width: 10.0),
                  new Text(
                    "手机查看",
                    style: new TextStyle(
                        color: ColorConst.color_999,
                        fontSize: TextSizeConst.minTextSize),
                  ),
                ],
              ),
            ),
//            subtitle: new VideoPlayer() ,
            subtitle:new Row(
              children: <Widget>[
                new Container(
                  width:20.0,
                  height:20.0,
                  child: new Image.asset("images/icons/excel.png"),
                ),
                new SizedBox(width: 10.0,),
                new Text("新建文本文档.txt",style: TextStyle(color:ColorConst.color_333,fontSize: TextSizeConst.smallTextSize),)
              ],
            ),
            leading: new Container(
              width: 50.0,
              height: 50.0,
              child: new Image.asset("images/shyk.png"),
            ),
            onTap: () async {
//              Navigator.of(context).push(new MaterialPageRoute(
//                  builder: (BuildContext context) => VideoPlayerPage(
//                      url: "https://res.shiguangkey.com/res/special/video/tanzhou.mp4",
//                  )));
//);
            },
          );
        },
        itemCount: _getList.length + 1,
      );
    } else {
      return CircularProgressIndicator();
    }
  }

  getItem(var list) {
    var item = List.generate(list.length, (int index) {
      return new Text("!2312312312");
    });
  }

  loadData() async {
    var _duration = new Duration(milliseconds: 3000);
    return await Future.delayed(_duration, () {
      return [new Text("12312312312")];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: _appBarTitle,
      ),
      body: new Center(
        child: _getList.length != 0
            ? Content(
                child: getBody(),
                onRefresh: _onRefresh,
                onLoad: _onLoad,
                fontStyle: Colors.blue,
              )
            : getBody(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return new CupertinoAlertDialog(
                  title: new Text("打开文件"),
                  content: new LinearProgressIndicator(),
                  actions: <Widget>[
                    new FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: new Text("取消"))
                  ],
                );
              }).then((val) {
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => FileManager()));
          });
          Navigator.of(context).pop();
        },
        child: new Icon(Icons.add),
      ),
    );
  }

  void _onRefresh(dynamic controller) {
    new Future.delayed(const Duration(milliseconds: 200)).then((val) {
//      currentPage = 1;
//      setState(() {
//        monitorList = _getManageList(currentPage, pageSize);
//      });
      controller.sendBack(true, RefreshStatus.completed);
    });
  }

  void _onLoad(dynamic controller) {
    new Future.delayed(const Duration(milliseconds: 200)).then((val) {
//      currentPage++;
      setState(() {
//        monitorList.addAll(_getManageList(currentPage, pageSize));
      });
      controller.sendBack(false, RefreshStatus.completed);
      controller.sendBack(false, RefreshStatus.idle);
    });
  }

  void _onController(dynamic controller) {
    this._scrollController = controller.scrollController;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
