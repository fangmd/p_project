import 'package:flutter/material.dart';
import 'package:p_project/page/home_page.dart';
import 'package:p_project/page/mine_page.dart';

Map<String, WidgetBuilder> buildRoutes2() {
  return {
    HomePage.routeName: (_) => HomePage(),
    MinePage.routeName: (_) => MinePage(),
  };
}

///路由管理
class RouterUtils {
  static void pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }
}
