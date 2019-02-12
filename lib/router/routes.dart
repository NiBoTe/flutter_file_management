

import 'package:flutter/material.dart';
import 'index.dart';
import 'package:party_building_application/views/index.dart';
import 'package:party_building_application/main.dart';

class Routes {

  static final Map<String,WidgetBuilder> routerList={
    "/":(BuildContext context)=> new SplashScreen(),
    "/MyHomePage":(BuildContext context)=> new MyHomePage(),
    "/adPages":(BuildContext context)=> new AdPages()
  };

}