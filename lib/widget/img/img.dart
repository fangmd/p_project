import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

/// 加载本地图片
/// SVG & PNG
Widget localImg(String name, {double width, double height}) {
  if (name != null && name.endsWith('svg')) {
    return SvgPicture.asset(
      name,
      width: width,
      height: height,
    );
  } else {
    return Image.asset(
      name,
      width: width,
      height: height,
    );
  }
}
