import 'package:flutter/material.dart';
import 'package:p_project/ui/home/apk_install/apk_install.dart';
import 'package:p_project/ui/home/net/net_page.dart';
import 'package:p_project/ui/home/page_animate/one/one_page_animate_page.dart';
import 'package:p_project/ui/home/page_animate/page_animate_page.dart';
import 'package:p_project/ui/image_viewer/image_viewer_page.dart';
import 'package:p_project/ui/learns/guesture_page.dart';
import 'package:p_project/ui/main_page.dart';
import 'package:p_project/ui/plugin/params/params_plugin_page.dart';
import 'package:p_project/ui/plugin/plugin_page.dart';
import 'package:p_project/ui/splash/splash_page.dart';

Map<String, WidgetBuilder> buildRoutes() {
  return {
    MainPage.routeName: (_) => MainPage(),
    SplashPage.routeName: (_) => SplashPage(),
    ImageViewerPage.routeName: (_) => ImageViewerPage(),
    GuesturePage.routeName: (_) => GuesturePage(),
    PluginPage.routeName: (_) => PluginPage(),
    ParamsPluginPage.routeName: (_) => ParamsPluginPage(),

    // animate
    PageAnimatePage.routeName: (_) => PageAnimatePage(),
    OnePageAnimatePage.routeName: (_) => OnePageAnimatePage(),

    ApkInstallPgae.routeName: (_) => ApkInstallPgae(),
    NetPage.routeName: (_) => NetPage(),
  };
}

///路由管理
class RouterUtils {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  /// 不需要 context 直接跳转
  static void pushNamedWithoutContext(String name) {
    navigatorKey.currentState.pushNamed(name);
  }

  static Future pushNamed(
    BuildContext context,
    String routeName, {
    Object arguments,
  }) {
    return Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  /// push 可以传参数
  static void push(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// 自定义跳转效果
  static void pushWithRoute(BuildContext context, Route route) {
    Navigator.push(context, route);
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  static void pop2({BuildContext context}) {
    if (context == null) {
      navigatorKey.currentState.pop();
    } else {
      Navigator.pop(context);
    }
  }

  /// 启动一个新的页面，并清理所有历史栈
  static void pushNamedAndRemoveAll(BuildContext context, String newRouteName) {
    Navigator.pushNamedAndRemoveUntil(context, newRouteName, (_) => false);
  }

  /// 启动一个新的页面，并清理所有历史栈
  static void pushNamedAndRemoveAll2(String newRouteName) {
    navigatorKey.currentState.pushNamedAndRemoveUntil(
      newRouteName,
      (_) => false,
    );
  }
}
