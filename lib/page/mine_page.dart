import 'package:flutter/material.dart';
import 'package:p_project/app_localization_container.dart';
import 'package:p_project/app_state_container.dart';
import 'package:p_project/common/c.dart';
import 'package:p_project/common/common_utils.dart';

class MinePage extends StatelessWidget {
  static var routeName = '/mine';

  final String userName;

  MinePage({this.userName}) : assert(userName != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
//                AppStateContainer.of(context).state.user.userName = 'new name';
                AppStateContainer.of(context).updateName('new name');
              },
              child: Text('change launge - en'),
            ),
            Text(userName ?? 'default'),
          ],
        ),
      ),
    );
  }
}
