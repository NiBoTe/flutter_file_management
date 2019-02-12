import 'dart:io';
import 'package:path/path.dart';

selectIcon(bool type, file) {

  try {
    String iconImg;
    if (type) {
//      String str = (file.path.substring(file.parent.path.length + 1)).split('.')[1];
      String str = basename((file is Map) != true ? file.path : file['path']).split('.')[1];

      print(str);
      switch (str) {
        case 'ppt':
        case 'pptx':
          iconImg = 'images/icons/ppt.png';
          break;
        case 'doc':
        case 'docx':
          iconImg = 'images/icons/word.png';
          break;
        case 'xls':
        case 'xlsx':
          iconImg = 'images/icons/excel.png';
          break;
        case 'jpg':
        case 'jpeg':
        case 'png':
          iconImg = 'images/icons/image.png';
          break;
        case 'txt':
          iconImg = 'images/icons/txt.png';
          break;
        case 'mp3':
          iconImg = 'images/icons/mp3.png';
          break;
        case 'mp4':
          iconImg = 'images/icons/mp4.png';
          break;
        case 'rar':
        case 'zip':
          iconImg = 'images/icons/zip.png';
          break;
        case 'psd':
          iconImg = 'images/icons/psd.png';
          break;
        default:
          iconImg = 'images/icons/file.png';
          break;
      }
    } else {
      iconImg = 'images/icons/folder.png';
    }
    return iconImg;
  } catch (e) {
    print(e);
    return 'images/icons/unknown.png';
  }
}