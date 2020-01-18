import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const bool sUseScreenAdoption = true;

/// 按照宽度比例，缩放设计稿，还原到屏幕
double px2dp(double value) {
  if (sUseScreenAdoption) {
    value = ScreenUtil.getInstance().setWidth(value);
  } else {
    value = value / 2;
  }
  return value;
}

/// 字体适配
double px2sp(double value, {allowFontScaling = false}) {
  if (sUseScreenAdoption) {
    value = ScreenUtil(allowFontScaling: allowFontScaling).setSp(value);
  } else {
    value = value / 2;
  }
  return value;
}

/// 屏幕适配
/// 目前设计稿：iphon6 1334/750 16/9
class MScreenUtils {
  static init(BuildContext context,
      {double width = 750.0, double height = 1334.0}) {
    ScreenUtil.instance = ScreenUtil(width: width, height: 1334)..init(context);
  }

  /// 一个物理像素
  static double onepx() {
    return 1 / ScreenUtil.pixelRatio;
  }

  static double getWidth(double width) {
    if (sUseScreenAdoption) {
      width = ScreenUtil.getInstance().setWidth(width);
    } else {
      width = width / 2;
    }
    return width;
  }

  static double getHeight(double height) {
    if (sUseScreenAdoption) {
      height = ScreenUtil.getInstance().setHeight(height);
    } else {
      height = height / 2;
    }
    return height;
  }

  static double getWindowHeight() {
    return ScreenUtil.screenHeight;
  }

  static double getScreenWidth() {
    return ScreenUtil.screenWidth;
  }

  static double getScreenHeight() {
    return ScreenUtil.screenHeight;
  }

  static double getScreenWidthDp() {
    return ScreenUtil.screenHeightDp;
  }

  static double getScreenHeightDp() {
    return ScreenUtil.screenWidthDp;
  }
}
