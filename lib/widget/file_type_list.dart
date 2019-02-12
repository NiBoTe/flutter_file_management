import 'package:flutter/material.dart';
import 'package:party_building_application/widget/index.dart';
import 'package:party_building_application/util/index.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

class FileTypeList extends StatefulWidget {

  FileTypeList({
    Key key,
    @required this.url,
    @required this.type,
    @required this.fileList
}) : assert(url != null),assert(type != null),assert(fileList != null),  super(key: key);
  final String url;
  final String type;
  final List fileList;


  @override
  FileTypeListState createState() => FileTypeListState();
}

class FileTypeListState extends State<FileTypeList>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Content(
          fontStyle: Colors.blue,
          child: new ListView.separated(
            separatorBuilder: (BuildContext context, int index){
              return new Divider(height: 1.0,);
            },
            itemBuilder: (BuildContext context, int index){
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
                subtitle: new Row(
                  children: <Widget>[
                    new Container(
                      width: 20.0,
                      height: 20.0,
                      child: new Image.asset("images/icons/excel.png"),
                    ),
                    new SizedBox(
                      width: 10.0,
                    ),
                    new Text(
                      "新建文本文档.txt",
                      style: TextStyle(
                          color: ColorConst.color_333,
                          fontSize: TextSizeConst.smallTextSize),
                    )
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
            itemCount: 10,

          ),
          onRefresh: null,
          onLoad: null),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
