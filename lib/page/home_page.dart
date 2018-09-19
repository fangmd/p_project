import 'package:flutter/material.dart';
import 'package:p_project/app_localization_container.dart';
import 'package:p_project/app_state_container.dart';
import 'package:p_project/common/c.dart';
import 'package:p_project/common/common_utils.dart';
import 'package:p_project/page/log_page.dart';
import 'package:p_project/page/mine_page.dart';
import 'package:p_project/page/refresh_page.dart';
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
            RaisedButton(
              onPressed: () {
                RouterUtils.pushNamed(context, LogPage.routeName);
              },
              child: Text('To LogPage'),
            ),
            RaisedButton(
              onPressed: () {
                RouterUtils.pushNamed(context, RefreshPage.routeName);
              },
              child: Text('To RefreshPage Demo'),
            ),
          ],
        ),
      ),
    );
  }
}
