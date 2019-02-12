

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import 'package:party_building_application/util/index.dart';
enum PerviewImageType {
  list,
  item
}

class PerviewImage extends StatefulWidget{


  PerviewImage({
    Key key,
    @required this.type = PerviewImageType.item,
    this.item,
    this.list,
  }) :assert(type == PerviewImageType.item ? item != null : list !=null ),super(
      key:key,
  );
  final PerviewImageType type;
  final String item;
  final List list;

  @override
  PerviewImageState createState() =>PerviewImageState();
}


class PerviewImageState extends State<PerviewImage>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        leading: new Text(""),
        brightness: Brightness.light,
        backgroundColor:  ColorConst.color_eee,
        elevation: 2.0,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(
                  Icons.close,
                  color:  ColorConst.color_999,
              ),
              onPressed: (){
                Navigator.of(context).pop(true);
              })
        ],
      ),
      body: new Container(
        child: widget.type == PerviewImageType.item ? PhotoView(
            imageProvider: AssetImage("images/shyk.png")
        ) : PhotoViewGallery(

          pageOptions: <PhotoViewGalleryPageOptions>[
            PhotoViewGalleryPageOptions(
              imageProvider: AssetImage("images/shyk.png"),
              initialScale: PhotoViewComputedScale.contained * 0.98,
              heroTag: "123333333333333333333333333",
            ),
            PhotoViewGalleryPageOptions(
              imageProvider: AssetImage("images/dwhd.png"),
              initialScale: PhotoViewComputedScale.contained * 0.98,
              heroTag: "tag2",

            ),
            PhotoViewGalleryPageOptions(
              imageProvider: AssetImage("images/syzp.png"),
              initialScale: PhotoViewComputedScale.contained * 0.98,
              heroTag: "tag3",
            ),
          ],
          backgroundDecoration: BoxDecoration(color: ColorConst.color_eee),
        )
      ),
    );
  }
}