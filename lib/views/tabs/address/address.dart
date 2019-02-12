import 'package:flutter/material.dart';
import 'package:party_building_application/widget/index.dart';
import 'package:party_building_application/util/index.dart';

class MyAddress extends StatefulWidget {
  @override
  _MyAddressState createState() => _MyAddressState();
}

class _MyAddressState extends State<MyAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('通讯录'),
      ),
      body: new Column(
        children: <Widget>[
          new Container(
            height: 40.0,
            child: new Row(
              children: <Widget>[
                new Icon(
                  Icons.search,
                  color: Colors.blue,
                  size: TextSizeConst.normalTextSize,
                ),
                new Expanded(
                  child: new TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.only(left: 10.0, right: 10.0),
                        counterStyle: TextStyle(
                          fontSize: TextSizeConst.normalTextSize,
                        )),
                  ),
                ),
                new FlatButton(
                    onPressed: () {},
                    child: new Text(
                      "搜索",
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
            padding:
                EdgeInsets.only(bottom: 5.0, left: 10.0, right: 10.0, top: 5.0),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            decoration: BoxDecoration(
                color: ColorConst.color_eee,
                borderRadius: BorderRadius.circular(50.0)),
          ),
          new Flexible(
//            flex: 1,
//            fit: FlexFit.tight,
            child: new Container(
              height: Common.screenHeight(context),
              child: new ContactListRoute(),
            ),
          )
        ],
      ),
      resizeToAvoidBottomPadding: false, //输入框抵住键盘
    );
  }
}
