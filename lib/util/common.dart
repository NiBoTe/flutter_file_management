

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Common {
  static DateTime _lastPressedAt;
  static screenWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  static screenHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }


  /**
   * 沉浸式状态栏
   */
  SystemUiOverlayStyles(){
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

  Future<bool> onWillPop() async {
    if (_lastPressedAt == null ||
        DateTime.now().difference(_lastPressedAt) >
            Duration(milliseconds: 2500)) {
      _lastPressedAt = DateTime.now();

      Fluttertoast.showToast(
          msg: "再按一次退出程序",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
//          backgroundColor: Colors.black87,
//          textColor: Colors.white
      );
      return false;
    }

    return true;
  }
}