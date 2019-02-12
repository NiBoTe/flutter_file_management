import 'package:flutter/material.dart';
import 'package:party_building_application/util/index.dart';
import 'package:party_building_application/widget/index.dart';


class MyFile extends StatefulWidget {
  @override
  _MyFileState createState() => _MyFileState();
}

class _MyFileState extends State<MyFile> with AutomaticKeepAliveClientMixin{
  final TextStyle styles = TextStyle(
      color: ColorConst.color_white, fontSize: TextSizeConst.minTextSize);


  bool isParent = true;

  Map<String,dynamic> _file;
  void _searchTap() {
    // TODO 跳转搜索界面
    print("000000000000000");
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context) => new SearchPage()));
  }

  void _onCallBack(Map<String,dynamic> file ,bool state){
    print(state);
    setState(() {
      isParent = state;
      _file = file;
      files = [{
        "name": "子文件",
        "path":"sadfasd",
        "children":[],
        "isState":false
      },{
        "name": "子文件",
        "path":"sadfasd.png",
        "children":[],
        "isState":true
      },
      {
        "name": "子文件",
        "path":"sadfasd.mp3",
        "children":[],
        "isState":true
      }];
    });
  }

  var files = [{
    "name": "父文件",
    "path":"sadfasd",
    "children":[],
    "isState":false
  },{
    "name": "父文件",
    "path":"sadfasd.png",
    "children":[],
    "isState":true
  },
  {
    "name": "父文件",
    "path":"sadfasd.mp3",
    "children":[],
    "isState":true
  }];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading:isParent == true ? new PopupMenuButton(
          offset: Offset(0.0, 66.0),
          child:  new Row(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: new Text(
                  "分类",
                  style: styles,
                ),
              ),
              new Icon(
                Icons.arrow_drop_down,
                color: ColorConst.color_white,
              )
            ],
          ),
          itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                new PopupMenuItem(
                    value: "图片",
                    child: new ListTile(
                      leading: Container(
                          width: 20.0,
                          height: 20.0,
                          child: new Image.asset("images/icons/image.png")),
                      title: new Text("图片"),
                    )),
                new PopupMenuItem(
                    value: "视频",
                    child: new ListTile(
                      leading: Container(
                          width: 20.0,
                          height: 20.0,
                          child: new Image.asset("images/icons/video.png")),
                      title: new Text("视频"),
                    )),
                new PopupMenuItem(
                    value: "文档",
                    child: new ListTile(
                      leading: Container(
                          width: 20.0,
                          height: 20.0,
                          child: new Image.asset("images/icons/folder.png")),
                      title: new Text("文档"),
                      onTap: (){
                        Navigator.of(context).pop();
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder:(BuildContext context)=>new FileType()
                        ));
                      },
                    )),
                new PopupMenuItem(
                    value: "音乐",
                    child: new ListTile(
                      leading: Container(
                          width: 20.0,
                          height: 20.0,
                          child: new Image.asset("images/icons/mp3.png")),
                      title: new Text("音乐"),
                      onTap: (){

                      },
                    )),
                new PopupMenuItem(
                    value: "其他",
                    child: new ListTile(
                      leading: Container(
                          width: 20.0,
                          height: 20.0,
                          child: new Image.asset("images/icons/unknown.png")),
                      title: new Text("其他"),
                    )),
              ],
          onSelected: (String value) {},
        ): IconButton(
          icon: Icon(Icons.arrow_back_ios,color: ColorConst.color_white,size: TextSizeConst.normalTextSize,),
          onPressed: (){

          },
        ),
        title: isParent == true ? new GestureDetector(
          child: Container(
            height: 30.0,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: ColorConst.color_eee,
            ),
            child: new TextField(
              enabled: false,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
                  hintText: "搜索系统文件",
                  hintStyle: TextStyle(
                      color: ColorConst.color_999,
                      fontSize: TextSizeConst.minTextSize),
                  border: InputBorder.none),
            ),
          ),
          onTap: _searchTap,
        ):Text("${_file['name']}",style: TextStyle(fontSize: TextSizeConst.normalTextSize),),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.add), onPressed: () {}),
          new PopupMenuButton(
              offset: Offset(Common.screenWidth(context), 66.0),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    new PopupMenuItem(
//                  checked: true,
                      child: new ListTile(
                        leading: new Icon(Icons.playlist_play),
                        title: new Text("按名称排序"),
                      ),
                    ),
                    new PopupMenuDivider(height: 1.0),
                    new PopupMenuItem(
//                  checked: false,
                      child: new ListTile(
                        leading: new Icon(Icons.access_time),
                        title: new Text("按时间排序"),
                      ),
                    ),
                  ])
        ],
      ),
      body: new Container(
        child: FileAll(
            files: files,
            onCallBack: _onCallBack,
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
