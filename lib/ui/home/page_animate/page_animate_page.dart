import 'package:flutter/material.dart';
import 'package:p_project/common/base/base_page.dart';
import 'package:p_project/router/router.dart';
import 'package:p_project/ui/home/page_animate/one/one_page_animate_page.dart';
import 'package:p_project/ui/image_viewer/image_viewer_page.dart';

class PageAnimatePage extends BasePage {
  static var routeName = '/page-animate';
  PageAnimatePage({Key key}) : super(key: key);

  @override
  _PageAnimatePageState createState() => _PageAnimatePageState();

  @override
  String getPageName() {
    return routeName;
  }
}

class _PageAnimatePageState extends State<PageAnimatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              RouterUtils.pushNamed(context, OnePageAnimatePage.routeName);
            },
            child: Text('One'),
          ),
        ],
      ),
    );
  }
}
