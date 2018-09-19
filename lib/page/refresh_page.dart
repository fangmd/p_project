import 'dart:async';

import 'package:flutter/material.dart';
import 'package:p_project/app_localization_container.dart';
import 'package:p_project/app_state_container.dart';
import 'package:p_project/common/c.dart';
import 'package:p_project/common/common_utils.dart';
import 'package:p_project/models/user_model.dart';
import 'package:p_project/page/log_page.dart';
import 'package:p_project/page/mine_page.dart';
import 'package:p_project/router/router.dart';

class RefreshPage extends StatefulWidget {
  static var routeName = '/refresh_demo';

  @override
  State<StatefulWidget> createState() {
    return _RefreshPageState();
  }
}

class _RefreshPageState extends State<RefreshPage> {
  UserModel userModel = UserModel('Default User',
      "https://www.bsn.eu/wp-content/uploads/2016/12/user-icon-image-placeholder-300-grey.jpg");

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Refresh Indicator'),
        ),
        body: RefreshIndicator(
          key: _refreshIndicatorKey,
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image.network(
                    userModel.image,
                    height: 128.0,
                    width: 128.0,
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Text(userModel.userName),
                ],
              )
            ],
          ),
          onRefresh: _refresh,
        ));
  }

  Future<Null> _refresh() {
    return UserModel.getUser().then((_user) {
      setState(() => userModel = _user);
    });
  }
}
