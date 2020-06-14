import 'package:flutter/material.dart';
import 'package:p_project/router/router.dart';
import 'package:p_project/ui/home/net/net_page.dart';
import 'package:p_project/ui/home/page_animate/page_animate_page.dart';
import 'package:p_project/ui/home/sticker/sticker_page.dart';
import 'package:p_project/ui/image_viewer/image_viewer_page.dart';
import 'package:p_project/ui/plugin/plugin_page.dart';
import 'apk_install/apk_install.dart';
import 'list/list_refresh_page.dart';

class HomePage extends StatefulWidget {
  static var routeName = '/home';

  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  RouterUtils.pushNamed(context, ImageViewerPage.routeName);
                },
                child: Text('图片游览'),
              ),
              RaisedButton(
                onPressed: () {
                  RouterUtils.pushNamed(context, PluginPage.routeName);
                },
                child: Text('插件Demo'),
              ),
              RaisedButton(
                onPressed: () {
                  RouterUtils.pushNamed(context, PageAnimatePage.routeName);
                },
                child: Text('页面跳转动画'),
              ),
              RaisedButton(
                onPressed: () {
                  RouterUtils.pushNamed(context, ApkInstallPgae.routeName);
                },
                child: Text('Android apk 下载及安装'),
              ),
              RaisedButton(
                onPressed: () {
                  RouterUtils.pushNamed(context, NetPage.routeName);
                },
                child: Text('网络库'),
              ),
              RaisedButton(
                onPressed: () {
                  RouterUtils.pushNamed(context, ListRefreshPage.routeName);
                },
                child: Text('下拉刷新'),
              ),
              RaisedButton(
                onPressed: () {
                  RouterUtils.pushNamed(context, StickerPage.routeName);
                },
                child: Text('发送表情'),
              ),
              TextField(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
