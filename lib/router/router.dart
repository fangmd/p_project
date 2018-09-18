import 'package:flutter/material.dart';
import 'package:p_project/page/home_page.dart';
import 'package:p_project/page/log_page.dart';
import 'package:p_project/page/list_view_pager.dart';
import 'package:p_project/page/mine_page.dart';
import 'package:p_project/page/smart_list_view_pager.dart';

Map<String, WidgetBuilder> buildRoutes2() {
  return {
//    ListViewPage.routeName: (_) => ListViewPage(),
    SmartListViewPage.routeName: (_) => SmartListViewPage(),
    MinePage.routeName: (_) => MinePage(),
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
