import 'package:flutter/material.dart';
import 'package:p_project/app_localization_container.dart';
import 'package:p_project/common/c.dart';
import 'package:p_project/common/common_utils.dart';

class HomePage extends StatelessWidget {
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
          ],
        ),
      ),
    );
  }
}
