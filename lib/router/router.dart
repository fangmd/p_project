import 'package:flutter/material.dart';
import 'package:p_project/page/app_bar_normal_page.dart';
import 'package:p_project/page/home_page.dart';
import 'package:p_project/page/log_page.dart';
import 'package:p_project/page/mine_page.dart';
import 'package:p_project/page/refresh_page.dart';
import 'package:p_project/page/sliver_app_bar_page.dart';
import 'package:p_project/page/transform_page.dart';

Map<String, WidgetBuilder> buildRoutes2() {
  return {
    LogPage.routeName: (_) => LogPage(),
    HomePage.routeName: (_) => HomePage(),
    MinePage.routeName: (_) => MinePage(),
    RefreshPage.routeName: (_) => RefreshPage(),
    TransformPage.routeName: (_) => TransformPage(),
    SliverAppBarPage.routeName: (_) => SliverAppBarPage(),
    AppBarNormalPage.routeName: (_) => AppBarNormalPage(),
  };
}

///路由管理
class RouterUtils {
  ///暂时不能传参数
  static void pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  /// push 可以传参数
  static void push(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }
}
