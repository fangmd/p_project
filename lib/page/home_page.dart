import 'package:flutter/material.dart';
import 'package:p_project/app_localization_container.dart';
import 'package:p_project/app_state_container.dart';
import 'package:p_project/common/c.dart';
import 'package:p_project/common/common_utils.dart';
import 'package:p_project/page/app_bar_normal_page.dart';
import 'package:p_project/page/log_page.dart';
import 'package:p_project/page/mine_page.dart';
import 'package:p_project/page/refresh_page.dart';
import 'package:p_project/page/sliver_app_bar_page.dart';
import 'package:p_project/page/transform_page.dart';
import 'package:p_project/router/router.dart';

class HomePage extends StatelessWidget {
  static var routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
              ),
              child: Text('Text'),
            ),
            SizedBox(
              width: 200.0,
              child: RaisedButton(
                onPressed: () {
                  RouterUtils.pushNamed(context, LogPage.routeName);
                },
                child: Text('To LogPage'),
              ),
            ),
            RaisedButton(
              onPressed: () {
                RouterUtils.pushNamed(context, RefreshPage.routeName);
              },
              child: Text('To RefreshPage Demo'),
            ),
            RaisedButton(
              onPressed: () {
                RouterUtils.pushNamed(context, TransformPage.routeName);
              },
              child: Text('To TransformPage'),
            ),
            RaisedButton(
              onPressed: () {
                RouterUtils.pushNamed(context, SliverAppBarPage.routeName);
              },
              child: Text('To SliverAppBar'),
            ),
            RaisedButton(
              onPressed: () {
                RouterUtils.pushNamed(context, AppBarNormalPage.routeName);
              },
              child: Text('To NormalAppBar'),
            ),
          ],
        ),
      ),
    );
  }
}
