import 'package:flutter/material.dart';
import 'package:party_building_application/widget/index.dart';
import 'package:party_building_application/util/index.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

class FileType extends StatefulWidget {
  @override
  FileTypeState createState() => FileTypeState();
}

class FileTypeState extends State<FileType>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;

  List<Tab> _tabs = [
    new Tab(
      icon: new Icon(GroovinMaterialIcons.file_word),
      text: "word",
    ),
    new Tab(
      icon: new Icon(GroovinMaterialIcons.file_excel),
      text: "excel",
    ),
    new Tab(
      icon: new Icon(GroovinMaterialIcons.file_pdf),
      text: "pdf",
    ),
    new Tab(
      icon: new Icon(GroovinMaterialIcons.file_account),
      text: "text",
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ignore: argument_type_not_assignable
    _tabController = new TabController(length: 4, vsync: this)
      ..addListener(() {
        print(_tabController.index);
      });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("文档"),
        bottom: new TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          tabs: _tabs,
          controller: _tabController,
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new FileTypeList(url: "http:12312312", type: "word", fileList: []),
          new FileTypeList(url: "http:12312312", type: "word", fileList: []),
          new FileTypeList(url: "http:12312312", type: "word", fileList: []),
          new FileTypeList(url: "http:12312312", type: "word", fileList: []),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
