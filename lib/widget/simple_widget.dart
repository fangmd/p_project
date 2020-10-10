import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p_project/styles/colors.dart';
import 'package:screen_adaptation/screen_utils.dart';

/// 无点击效果 点击控件
Widget clickWidget({@required child, @required onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: child,
  );
}

/// 有点击效果 点击控件
Widget aClickWidget({@required child, @required onTap, Color color}) {
  return Material(
    color: color,
    child: InkWell(
      onTap: onTap,
      child: child,
    ),
  );
}

/// 水平分割线
Widget horizontalDivide({
  double height: 1.0,
  Color color: divide_f3,
  double left: 0,
  double right: 0,
  double pad: 0,
}) {
  // height = MScreenUtils.onepx();
  if (left == 0 && right == 0) {
    return Container(height: height, color: color);
  } else {
    return Container(
      color: white,
      child: Padding(
        padding: EdgeInsets.only(left: px2dp(left), right: px2dp(right)),
        child: Container(height: height, color: color),
      ),
    );
  }
}

/// 水平分割线
Widget verticalDivide({
  double width: 1.0,
  Color color: divide_f3,
  double left: 0,
  double right: 0,
}) {
  if (left == 0 && right == 0) {
    return Container(width: width, color: color);
  } else {
    return Container(
      color: white,
      child: Padding(
        padding: EdgeInsets.only(top: px2dp(left), bottom: px2dp(right)),
        child: Container(width: width, color: color),
      ),
    );
  }
}

/// 圆角图片
Widget roundImgWidget({
  double height,
  double width,
  double radius,
  BoxFit fit = BoxFit.fill,
  ImageProvider imageProvider,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      image: DecorationImage(fit: fit, image: imageProvider),
    ),
  );
}

/// 有bug
Widget clipRRectWidget({double radius, Widget child}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(px2dp(radius)),
    child: child,
  );
}

Widget mSizeBox({double width = 0, double height = 0}) {
  return SizedBox(width: px2dp(width), height: px2dp(height));
}

/// padding
Widget pad({
  double top = 0,
  double left = 0,
  double right: 0,
  double bottom = 0,
  @required Widget child,
}) {
  return Padding(
    padding: EdgeInsets.only(
      left: px2dp(left),
      right: px2dp(right),
      top: px2dp(top),
      bottom: px2dp(bottom),
    ),
    child: child,
  );
}

/// 获取输入框控件
/// 使用位置: 托管承租
Widget editText({hint, hintStyle}) {
  return TextField(
    cursorColor: black1,
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: hint,
      hintStyle: hintStyle,
    ),
  );
}

/// 获取输入框控件
/// 使用位置: 托管承租
Widget borderEditText({hint, hintStyle}) {
  return TextField(
    maxLines: 6,
    cursorColor: black1,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.all(px2dp(14)),
      border: OutlineInputBorder(
          // borderSide: BorderSide(color: red1),
          ),
      hintText: hint,
      hintStyle: hintStyle,
    ),
  );
}

/// 矩形 色块
Widget reactangleWidget({double width, double height, Color color}) {
  return Container(
    height: height,
    width: width,
    color: color,
  );
}

/// 圆形 色块
Widget circleWidget({double width, double height, Color color}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    ),
  );
}

/// 创建可以点击的本地图标
/// 图片居中
InkWell clickImg({
  VoidCallback click,
  double boxheight = 0.0,
  double boxWidth = 0.0,
  double imgheight = 0.0,
  double imgWidth = 0.0,
  String assetImg,
}) {
  return InkWell(
    onTap: click,
    child: Container(
      width: boxWidth,
      height: boxheight,
      child: Center(
        child: Image.asset(
          assetImg,
          width: imgWidth,
          height: imgheight,
          fit: BoxFit.fill,
        ),
      ),
    ),
  );
}
