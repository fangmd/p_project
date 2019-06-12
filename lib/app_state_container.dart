import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:p_project/models/user_model.dart';

import 'models/app_state.dart';

class AppStateContainer extends StatefulWidget {
  final AppState state;
  final Widget child;

  AppStateContainer({
    @required this.child,
    this.state,
  });

  static _AppStateContainerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer)
            as _InheritedStateContainer)
        .data;
  }

  @override
  _AppStateContainerState createState() => new _AppStateContainerState();
}

class _AppStateContainerState extends State<AppStateContainer> {
  AppState state;

  @override
  void initState() {
    super.initState();
    if (widget.state != null) {
      state = widget.state;
    } else {
      state = AppState.init();
      initUser();
    }
  }

  ///初始化用户相关数据
  ///从本地获取用户信息：没有数据表示未登入
  Future initUser() async {
//    googleUser = await _ensureLoggedInOnStartUp();
//    if (googleUser == null) {
//      setState(() {
//        state.isLoading = false;
//      });
//    } else {
//      var firebaseUser = await logIntoFirebase();
//    }
  }

  logIntoFirebase() async {
  }


  @override
  Widget build(BuildContext context) {
    return new _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }

  void updateName(String s) {
    setState(() {
      state.user.userName = s;
    });
  }
}

class _InheritedStateContainer extends InheritedWidget {// InheritedWidget, Theme
  final _AppStateContainerState data;

  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}
