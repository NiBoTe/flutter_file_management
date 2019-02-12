import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:party_building_application/config/index.dart';
import 'package:party_building_application/util/index.dart';

class VideoPlayerPage extends StatefulWidget {
  VideoPlayerPage({
    Key key,
    @required this.url,
    this.onController,
    this.color,
  }) : super(key: key);

  final String url;
  final Function onController;
  final Color color;

  @override
  VideoPlayerState createState() => VideoPlayerState();
}

class VideoPlayerState extends State<VideoPlayerPage> {
  VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _videoPlayerController = new VideoPlayerController.network(widget.url);
  }

  Widget _chewie() {
    if(widget.onController != null){
      widget.onController(_videoPlayerController);
    }
    return new Chewie(
      _videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: false,
      showControls: true,
//          fullScreenByDefault: true,
      // 拖动条样式颜色
      materialProgressColors: new ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.blue,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightGreen,
      ),
      cupertinoProgressColors: new ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.blue,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightGreen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.color_white,
        elevation: 2.0,
        brightness: Brightness.light,
        leading: new Text(""),
        actions: <Widget>[
          new IconButton(
              color: ColorConst.color_333,
              icon: Icon(Icons.close),
              onPressed: (){
                Navigator.of(context).pop();

              })
        ],
      ),
      body: new Container(
//        width: Common.screenWidth(context),
//        height: Common.screenHeight(context),
        color: widget.color != null ? widget.color : ColorConst.color_333,
        child: _chewie(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }
}
