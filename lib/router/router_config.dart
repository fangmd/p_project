import 'package:flutter/material.dart';
import 'package:p_project/ui/home/apk_install/apk_install.dart';
import 'package:p_project/ui/home/list/list_refresh_page.dart';
import 'package:p_project/ui/home/net/net_page.dart';
import 'package:p_project/ui/home/page_animate/one/one_page_animate_page.dart';
import 'package:p_project/ui/home/page_animate/page_animate_page.dart';
import 'package:p_project/ui/image_viewer/image_viewer_page.dart';
import 'package:p_project/ui/learns/guesture_page.dart';
import 'package:p_project/ui/main_page.dart';
import 'package:p_project/ui/msg/douyin/douyin_page.dart';
import 'package:p_project/ui/msg/global_loading/global_loading_page.dart';
import 'package:p_project/ui/msg/hive/hive_page.dart';
import 'package:p_project/ui/msg/sliver/sliver_page.dart';
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
    GlobalLoadingPage.routeName: (_) => GlobalLoadingPage(),
    ListRefreshPage.routeName: (_) => ListRefreshPage(),
    SliverPage.routeName: (_) => SliverPage(),
    HivePage.routeName: (_) => HivePage(),
    

    // animate
    PageAnimatePage.routeName: (_) => PageAnimatePage(),
    OnePageAnimatePage.routeName: (_) => OnePageAnimatePage(),

    ApkInstallPgae.routeName: (_) => ApkInstallPgae(),
    NetPage.routeName: (_) => NetPage(),

    DouYinPage.routeName: (_) => DouYinPage(),
  };
}
