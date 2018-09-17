import 'package:flutter/material.dart';
import 'package:p_project/app_localization_container.dart';
import 'package:p_project/app_state_container.dart';
import 'package:p_project/common/c.dart';
import 'package:p_project/common/common_utils.dart';
import 'package:p_project/common/utils/log.dart';
import 'package:p_project/page/mine_page.dart';
import 'package:p_project/router/router.dart';

class LogPage extends StatelessWidget {
  static var routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Log.d(message: 'message debug');
              },
              child: Text('log d'),
            ),
            RaisedButton(
              onPressed: () {
                Log.e(message: 'message debug');
              },
              child: Text('log e'),
            ),
            Text(CommonUtils.getLocale(context).welcomeMessage),
            Text(AppLocalizationContainer.of(context).locale),
            RaisedButton(
              onPressed: () {
                RouterUtils.pushNamed(context, MinePage.routeName);
//                RouterUtils.push(
//                    context,
//                    MinePage(
//                      userName: 'Fangmingdong',
//                    ));
              },
              child: Text('Jump to mine'),
            ),
            Text(AppStateContainer.of(context).state.user.userName),
          ],
        ),
      ),
    );
  }
}
