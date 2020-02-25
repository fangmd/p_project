import 'package:flutter/material.dart';
import 'package:p_project/common/base/base_page.dart';
import 'package:p_project/router/router.dart';
import 'package:p_project/styles/text.dart';
import 'package:p_project/ui/image_viewer/image_viewer_page.dart';
import 'package:p_project/widget/animate/fade_animation.dart';

/// 使用第三方控件
//class OnePageAnimatePage extends BasePage {
//  static var routeName = '/page-animate/one';
//  OnePageAnimatePage({Key key}) : super(key: key);
//
//  @override
//  _OnePageAnimatePageState createState() => _OnePageAnimatePageState();
//
//  @override
//  String getPageName() {
//    return routeName;
//  }
//}
//
//class _OnePageAnimatePageState extends State<OnePageAnimatePage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Container(
//        width: double.infinity,
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//            FadeAnimation(
//              1.2,
//              Container(
//                height: 300,
//                width: double.infinity,
//                color: Colors.green,
//              ),
//            ),
//            FadeAnimation(
//              1.1,
//              Padding(
//                padding: const EdgeInsets.all(20.0),
//                child: Text(
//                  '页面跳转动画 Demo 1 页面跳转动画 Demo 1 页面跳转动画 Demo 1 页面跳转动画 Demo 1',
//                  style: AppTheme.adBack30bold,
//                ),
//              ),
//            ),
//            SizedBox(height: 100),
//            RaisedButton(
//              onPressed: () {
//                RouterUtils.pushNamed(context, ImageViewerPage.routeName);
//              },
//              child: Text('跳转到下个界面'),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
//

/// 不实用第三方动画控件
class OnePageAnimatePage extends BasePage {
  static var routeName = '/page-animate/one';

  OnePageAnimatePage({Key key}) : super(key: key);

  @override
  _OnePageAnimatePageState createState() => _OnePageAnimatePageState();

  @override
  String getPageName() {
    return routeName;
  }
}

class _OnePageAnimatePageState extends State<OnePageAnimatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FadeAnimationNoThird(
              delay: 1.2,
              child: Container(
                height: 300,
                width: double.infinity,
                color: Colors.green,
              ),
            ),
            FadeAnimationNoThird(
              delay: 1.1,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  '页面跳转动画 Demo 1 页面跳转动画 Demo 1 页面跳转动画 Demo 1 页面跳转动画 Demo 1',
                  style: AppTheme.adBack30bold,
                ),
              ),
            ),
            SizedBox(height: 100),
            RaisedButton(
              onPressed: () {
                RouterUtils.pushNamed(context, ImageViewerPage.routeName);
              },
              child: Text('跳转到下个界面'),
            ),
          ],
        ),
      ),
    );
  }
}
