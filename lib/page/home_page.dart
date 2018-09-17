import 'package:flutter/material.dart';
import 'package:p_project/app_localization_container.dart';
import 'package:p_project/app_state_container.dart';
import 'package:p_project/common/c.dart';
import 'package:p_project/common/common_utils.dart';
import 'package:p_project/page/mine_page.dart';
import 'package:p_project/page/sliver_one_page.dart';
import 'package:p_project/router/router.dart';

class HomePage extends StatelessWidget {
  static var routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                RouterUtils.pushNamed(context, SliverOnePage.routeName);
              },
              child: Text('Jump to Sliver one'),
            ),
            RaisedButton(
              onPressed: () {
                RouterUtils.pushNamed(context, MinePage.routeName);
              },
              child: Text('Jump to Sliver Two'),
            ),
            Text(AppStateContainer.of(context).state.user.userName),
          ],
        ),
      ),
    );
  }
}
