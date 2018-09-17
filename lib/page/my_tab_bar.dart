import 'package:flutter/material.dart';

/// custom TabBar
class MyTabBar extends TabBar {
  MyTabBar({
    Key key,
    @required tabs,
    Color indicatorColor = Colors.yellowAccent,
    Color labelColor = Colors.yellowAccent,
    Color unselectedLabelColor = Colors.black26,
  }) : super(
          key: key,
          tabs: tabs,
          indicatorColor: indicatorColor,
          labelColor: labelColor,
          unselectedLabelColor: unselectedLabelColor,
        );
}
