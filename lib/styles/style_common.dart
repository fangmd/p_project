import 'package:flutter/material.dart';

/// 组件加上下左右padding
/// w:所要加padding的组件
/// all:加多少padding
Widget addPadding(Widget w, double all) {
  return Padding(
    child: w,
    padding: EdgeInsets.all(all),
  );
}
