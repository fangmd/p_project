import 'package:flutter/material.dart';
import 'package:p_project/common/base/base_page.dart';
import 'package:p_project/router/router.dart';

import '../main_page.dart';

class SplashPage extends BasePage {
  static const routeName = '/splash';

  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();

  @override
  String getPageName() {
    return routeName;
  }
}

class _SplashPageState extends BasePageState<SplashPage> {
  String _img;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 3000), () {
      RouterUtils.pushNamedAndRemoveAll(context, MainPage.routeName);
    }).then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Container(),
      ),
    );
  }
}
