import 'package:flutter/material.dart';
import 'package:p_project/styles/colors.dart';
import 'package:p_project/styles/text.dart';
import 'package:p_project/widget/img/img.dart';
import 'package:screen_adaptation/screen_extension.dart';

AppBar getAppBar(String title, {BuildContext context}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: MColor.transparent,
    elevation: 0.0,
    leading: IconButton(
      onPressed: () {
        Navigator.maybePop(context);
      },
      icon: localImg(
        'assets/common/toolbar_back.svg',
        width: 18.dp,
        height: 34.dp,
      ),
    ),
    title: Text(title, style: AppTheme.black34Bold),
  );
}
