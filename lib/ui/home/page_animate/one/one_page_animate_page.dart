import 'package:flutter/material.dart';
import 'package:p_project/common/base/base_page.dart';
import 'package:p_project/router/router.dart';
import 'package:p_project/styles/text.dart';
import 'package:p_project/ui/image_viewer/image_viewer_page.dart';
import 'package:p_project/widget/animate/fade_animation.dart';
import 'package:p_project/widget/animate/fade_out_animation.dart';

/// 使用第三方控件
//class OnePageAnimatePage extends BasePage {
//  static var routeName = '/page-animate/one';
//
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
//  int cnt = 0;
//
//
//  @override
//  Widget build(BuildContext context) {
//    print('build _OnePageAnimatePageState');
//    return Scaffold(
//      body: SingleChildScrollView(
//        child: Container(
//          width: double.infinity,
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
//              FadeAnimation(
//                1.2,
//                Container(
//                  height: 300,
//                  width: double.infinity,
//                  color: Colors.green,
//                ),
//              ),
//              FadeAnimation(
//                1.1,
//                Padding(
//                  padding: const EdgeInsets.all(20.0),
//                  child: Text(
//                    '$cnt 页面跳转动画 Demo 1 页面跳转动画 Demo 1 页面跳转动画 Demo 1 页面跳转动画 Demo 1',
//                    style: AppTheme.adBack30bold,
//                  ),
//                ),
//              ),
//              SizedBox(height: 100),
//              RaisedButton(
//                onPressed: () {
//                  setState(() {
//                    cnt++;
//                  });
//                },
//                child: Text('跳转到下个界面'),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}

/// 不使用用第三方动画控件
//class OnePageAnimatePage extends BasePage {
//  static var routeName = '/page-animate/one';
//
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
//  double delayTwo = 1.1;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Container(
//        width: double.infinity,
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//            FadeAnimationNoThird(
//              delay: 1,
//              child: Container(
//                height: 300,
//                width: double.infinity,
//                color: Colors.green,
//              ),
//            ),
//            FadeAnimationNoThird(
//              delay: delayTwo,
//              child: Padding(
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
//                setState(() {
//                  delayTwo = delayTwo + 0.1;
//                });
//              },
//              child: Text('跳转到下个界面'),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}

class MController {
  List<VoidCallback> _s = [];

  void addStartAnimation(Function startAnimation) {
    _s.add(startAnimation);
  }

  void startAnimation(Duration duration, VoidCallback callback) {
    _s.forEach((s) {
      s();
    });

    Future.delayed(duration, () {
      callback();
    });
  }
}

/// 不使用用第三方动画控件，退出动画
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
  final _mController = MController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FadeAnimationNoThird(
              child: FadeOutAnimationNoThird(
                controller: _mController,
                delay: 1,
                child: Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.green,
                ),
              ),
            ),
            FadeAnimationNoThird(
              child: FadeOutAnimationNoThird(
                controller: _mController,
                delay: 1.1,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    '页面跳转动画 Demo 1 页面跳转动画 Demo 1 页面跳转动画 Demo 1 页面跳转动画 Demo 1',
                    style: AppTheme.adBack30bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 100),
            RaisedButton(
              onPressed: () {
                _routeWithAnimation();
              },
              child: Text('跳转到下个界面'),
            ),
          ],
        ),
      ),
    );
  }

  void _routeWithAnimation() {
    _mController
        .startAnimation(Duration(milliseconds: 500 + (500 * 1.1).round()), () {
      RouterUtils.pushNamed(context, ImageViewerPage.routeName);
    });
  }
}
