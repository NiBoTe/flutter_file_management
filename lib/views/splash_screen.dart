import 'package:flutter/material.dart';
import 'package:party_building_application/util/index.dart';
import 'package:party_building_application/config/index.dart';
class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {


  @override void initState() {
    super.initState();

    _countDown();
  }


  void _countDown(){
    final _duration = new Duration(seconds: Const.SPLASH_SCREEN_TIME);
    new Future.delayed(_duration,_goHomePage);
  }
  void _goHomePage(){
    Navigator.of(context).pushReplacementNamed("/MyHomePage");
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new WillPopScope(
        child: new Scaffold(
          body: new Container(
            width: Common.screenWidth(context),
            height: Common.screenHeight(context),
            decoration: new BoxDecoration(
                image: DecorationImage(
//                  "images/1080-1882..png"
                    fit: BoxFit.cover,
                    image: new AssetImage("images/1080-1882.png"))),
//            child:
          ),
        ),
        onWillPop: Common().onWillPop);
  }
}
