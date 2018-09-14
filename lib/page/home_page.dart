import 'package:flutter/material.dart';
import 'package:p_project/app_localization_container.dart';
import 'package:p_project/app_state_container.dart';
import 'package:p_project/common/c.dart';
import 'package:p_project/common/common_utils.dart';
import 'package:p_project/page/mine_page.dart';
import 'package:p_project/router/router.dart';

class HomePage extends StatelessWidget {
  static var routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                AppLocalizationContainer.of(context).setLocal(ZH);
              },
              child: Text('change launge - zh'),
            ),
            RaisedButton(
              onPressed: () {
                AppLocalizationContainer.of(context).setLocal(EN);
              },
              child: Text('change launge - en'),
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
