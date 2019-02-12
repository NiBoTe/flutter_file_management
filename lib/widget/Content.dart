import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import "package:pull_to_refresh/pull_to_refresh.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Content extends StatefulWidget {
  Content(
      {Key key,
      @required this.child,
      @required this.onRefresh,
      @required this.onLoad,
      this.onController,
      this.fontStyle,
      this.color})
      : super(key: key);

  final Widget child;
  final Function onRefresh;
  final Function onLoad;
  final Function onController;
  final Color fontStyle;
  final Color color;

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  RefreshController _refreshController;
  Map<String, Color> fontStyle = {
    'dark': Color(0xff000000),
    'light': Color(0xffffffff),
  };

  @override
  void initState() {
    super.initState();
    _refreshController = new RefreshController();
  }

  void _onRefresh(bool up) {
    if (up) {
      widget.onRefresh(_refreshController);
    } else {
      widget.onLoad(_refreshController);
    }
  }

  void _onOffsetCallback(bool isUp, double offset) {}

  Widget _headerBuilder(BuildContext context, int mode) {
    Color color = widget.fontStyle == null
        ? fontStyle['dark']
        : widget.fontStyle;

    return ClassicIndicator(
      mode: mode,
      idleText: '下拉刷新',
      // 0对应字符串
      releaseText: '释放开始刷新',
      // 1对应字符串
      refreshingText: '刷新中...',
      // 2对应字符串
      completeText: '刷新完成',
      // 3对应字符串
      failedText: '刷新失败',
      //4对应字符串
      noDataText: '没有数据',
      // 5对应字符串
      idleIcon: Icon(
        Icons.arrow_downward,
        color: color,
      ),
      releaseIcon: Icon(
        Icons.arrow_upward,
        color: color,
      ),
      refreshingIcon: SpinKitDoubleBounce(
        color: color,
        size: 50.0,
      ),
      completeIcon: Icon(
        Icons.done,
        color: color,
      ),
      failedIcon: Icon(
        Icons.clear,
        color: color,
      ),
      noMoreIcon: Icon(
        Icons.clear,
        color: color,
      ),
      iconPos: IconPosition.left,
      spacing: 5.0,
      height: 60.0,
      textStyle: TextStyle(color: color),
    );
  }

  Widget _footerBuilder(BuildContext context, int mode) {
    Color color = widget.fontStyle == null
        ? fontStyle['dark'] // 下拉刷新字体icon 默认暗色
        : widget.fontStyle;;

    return ClassicIndicator(
      mode: mode,
      idleText: '上拉加载',
      // 0对应字符串
      releaseText: '释放开始加载',
      // 1对应字符串
      refreshingText: '加载中...',
      // 2对应字符串
      completeText: '加载完成',
      // 3对应字符串
      failedText: '加载失败',
      //4对应字符串
      noDataText: '没有更多了',
      // 5对应字符串
      // 0对应icon
      idleIcon: Icon(
        Icons.arrow_upward,
        color: color,
      ),
      // 1对应icon
      releaseIcon: Icon(
        Icons.arrow_downward,
        color: color,
      ),
      // 2对应icon
      refreshingIcon: SpinKitDoubleBounce(
        color: color,
        size: 50.0,
      ),
      // 3对应icon
      completeIcon: Icon(
        Icons.done,
        color: color,
      ),
      // 4对应icon
      failedIcon: Icon(
        Icons.clear,
        color: color,
      ),
      // 5对应icon
      noMoreIcon: Icon(
        Icons.clear,
        color: color,
      ),
      iconPos: IconPosition.left,
      spacing: 5.0,
      // 间隔
      height: 60.0,
      // 高度
      textStyle: TextStyle(color: color), // 文字样式
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: widget.color == null ? Color(0x00000000) : widget.color,
      child: SmartRefresher(
        enablePullUp: true,
        enablePullDown: true,
        onRefresh: _onRefresh,
        onOffsetChange: _onOffsetCallback,
        headerBuilder: (BuildContext context, int mode) {
          return _headerBuilder(context, mode);
        },
        footerBuilder: (BuildContext context, int mode) {
          return _footerBuilder(context, mode);
        },
        headerConfig: const RefreshConfig(
          triggerDistance: 80.0,
          completeDuration: 300,
          visibleRange: 60.0,
        ),
        footerConfig: const LoadConfig(
            triggerDistance: 0, autoLoad: true, bottomWhenBuild: true),
        controller: _refreshController,
        child: _list(),
      ),
    );
  }

  Widget _list() {
    new Future.delayed(const Duration(milliseconds: 1000)).then((val) {
      if (widget.onController != null) {
        widget.onController(_refreshController);
      }
    });

    return widget.child;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}


class RefreshStatus {
  static const int idle = 0;
  static const int canRefresh = 1;
  static const int refreshing = 2;
  static const int completed = 3;
  static const int failed = 4;
  static const int noMore = 5;
}
class FontStyle {
  static const String dark = 'dark';
  static const String light = 'light';
}
