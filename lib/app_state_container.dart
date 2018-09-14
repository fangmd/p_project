import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'models/app_state.dart';

class AppStateContainer extends StatefulWidget {
  final AppState state;
  final Widget child;

  AppStateContainer({
    @required this.child,
    this.state,
  });

  // This creates a method on the AppState that's just like 'of'
  // On MediaQueries, Theme, etc
  // This is the secret to accessing your AppState all over your app
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
      state = new AppState.loading();
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
//    if (googleUser == null) {
//      googleUser = await googleSignIn.signIn();
//    }
//
//    FirebaseUser firebaseUser;
//    FirebaseAuth _auth = FirebaseAuth.instance;
//    try {
//      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//      firebaseUser = await _auth.signInWithGoogle(
//        accessToken: googleAuth.accessToken,
//        idToken: googleAuth.idToken,
//      );
//      print('Logged in: ${firebaseUser.displayName}');
//      setState(() {
//        state.isLoading = false;
//        state.user = firebaseUser;
//      });
//    } catch (error) {
//      print(error);
//      return null;
//    }
  }


  @override
  Widget build(BuildContext context) {
    return new _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final _AppStateContainerState data;

  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}
