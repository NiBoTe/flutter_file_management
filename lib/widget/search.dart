


import 'package:flutter/material.dart';
import 'package:party_building_application/util/index.dart';

class SearchPage extends StatefulWidget{
  @override
  SearchState createState() => SearchState();
}


class SearchState extends State<SearchPage>{

  TextEditingController _editingController;
  String _searchInput = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _editingController = new TextEditingController();
  }

  void _onChanged(value){
    setState(() {
      _searchInput = value;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.color_white,
        elevation: 2.0,
        brightness: Brightness.light,
        leading: new Icon(
            Icons.search,
            color:ColorConst.color_333,
        ),
        title: new TextField(
          controller:_editingController,
          onChanged: _onChanged,
          decoration: InputDecoration(
              border: InputBorder.none
          ),
        ),
        actions: <Widget>[
          new IconButton(
              color: ColorConst.color_333,
              icon: Icon(Icons.close),
              onPressed: (){
                setState(() {
                  _searchInput = '';
                  _editingController.clear();

                });
              }),
          new FlatButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: new Text("取消",style: TextStyle(
                  color:Colors.blue
              ))),
        ],
      ),
      body: new Column(
        children: <Widget>[
          new Text("$_searchInput")
        ],
      ),
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _editingController.dispose();
  }
}