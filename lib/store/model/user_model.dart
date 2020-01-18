import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  // singleton
  static final UserModel _singleton = UserModel._internal();

  static UserModel get instance {
    return _singleton;
  }

  factory UserModel() {
    return _singleton;
  }

  UserModel._internal();

  // singleton

  @override
  void dispose() {
    super.dispose();
  }
}
