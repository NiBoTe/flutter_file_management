import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Content.dart';
import 'selection_icon.dart';
import 'dart:convert';
import 'package:party_building_application/util/index.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_permissions/simple_permissions.dart';

import 'package:open_file/open_file.dart';

import 'perview_image.dart';

import 'VideoPlayer.dart';

class FileAll extends StatefulWidget {
  FileAll({Key key, @required this.files, @required this.onCallBack})
      : super(key: key);

  final Function onCallBack;
  final List<Map<String, dynamic>> files;

  @override
  FileAllState createState() => FileAllState();
}

class FileAllState extends State<FileAll> {
  bool _isParent = true;
  String sDCardDir;
  double progressValue = 0.0;

  @override
  void initState() {
    super.initState();
  }

  Widget _fileList() {
    return new ListView.separated(
        itemBuilder: (BuildContext context, int index) =>
            _fileItem(context, index),
        separatorBuilder: (BuildContext context, int index) {
          return new Divider(
            height: 1.0,
          );
        },
        itemCount: widget.files.length);
  }

// 权限检查与申请
  Future<void> getPermission(Map<String, dynamic> file) async {
    if (Platform.isAndroid) {
      bool permission1 = await SimplePermissions.checkPermission(
          Permission.ReadExternalStorage);
      bool permission2 = await SimplePermissions.checkPermission(
          Permission.WriteExternalStorage);
      if (!permission1) {
        await SimplePermissions.requestPermission(
            Permission.ReadExternalStorage);
      }
      if (!permission2) {
        await SimplePermissions.requestPermission(
            Permission.WriteExternalStorage);
      }
      _openFile(file);
    } else if (Platform.isIOS) {
      _openFile(file);
    }
  }

  Future<void> _openFile(Map<String, dynamic> file) async {
    if (file["isState"] != true) {
      widget.onCallBack(file, false);
      var appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      String downloadUrl = "${appDocPath}/download/bg887.png";
      var directory =
          await new Directory("${appDocPath}/download").create(recursive: true);
      var fileList = directory.listSync();
      var filePathList = [];
      if (fileList.length == 0) {
        await _downLoaderFile("images/bg88.png", downloadUrl);
        await OpenFile.open(downloadUrl);
//        Navigator.of(context).pop();
      }
      for (int i = 0; i < fileList.length; i++) {
        filePathList.add(fileList[i].path);
      }

      if (filePathList.contains(downloadUrl) == true) {
        print("=========");

        // TODO 图片预览
//        await Navigator.of(context).push(MaterialPageRoute(
//            builder: (BuildContext context){
//              return new PerviewImage(
//                  type: PerviewImageType.list,
////                  item: "asdfasdf",
//              list: [],
//              );
//            }
//        )
//        ).then((value){
//          print(value);
//        });

//        // TODO 打开文件
//        await OpenFile.open(downloadUrl);
//        Navigator.of(context).pop();

        // TODO 打开视频
        await Navigator.of(context)
            .push(MaterialPageRoute(
                builder: (BuildContext context) {
                  return new VideoPlayerPage(
                    url:
                        "http://39.98.84.31:60841/files/1/mp4/20181229154948.mp4",
                  );
                }))
            .then((value) {
          print(value);
        });
        Navigator.of(context).pop();
      } else {
        await _downLoaderFile("images/bg88.png", downloadUrl);
        await OpenFile.open(downloadUrl);
        Navigator.of(context).pop();
      }
    }
  }

  Future<dynamic> _downLoaderFile(String url, String savePath) async {
    var response = await Http().download(url, savePath,
        onProgress: (int received, int total) {
      double str = double.parse((received / total).toStringAsFixed(1));
    });
    return response;
  }

  Widget _fileItem(BuildContext context, int index) {
    var file = widget.files[index];
    var isFile = file['isState'];
    return new ListTile(
      leading: Container(
        width: 40.0,
        height: 40.0,
        child: Image.asset(selectIcon(isFile, file)),
      ),
      title: new Text("${file['name']}"),
      onTap: () async {
        getPermission(file);
        _showDialog(context);
//        Navigator.of(context).push(new MaterialPageRoute(
//            builder: (BuildContext context) => VideoPlayerPage(
//                  url:
//                      "http://39.98.84.31:60841/files/1/mp4/20181229154948.mp4",
//                )));
      },
    );
  }

  Widget _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new CupertinoAlertDialog(
            title: new Text("打开文件"),
            content: new Column(
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: new Text("正在尝试打开文件..."),
                ),
                new LinearProgressIndicator(),
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: new Text("取消"))
            ],
          );
        });
  }

  void _onRefresh() {}

  void _onLoad() {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: new Content(
        child: _fileList(),
        onRefresh: _onRefresh,
        onLoad: _onLoad,
        fontStyle: Colors.blue,
      ),
    );
  }
}

//class
