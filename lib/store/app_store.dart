import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/user_model.dart';

/// 全局数据
class AppStore {
  static BuildContext widgetCtx;

  //  我们将会在main.dart中runAPP实例化init
  static init({context, child, UserModel userModel}) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: userModel),
      ],
      child: child,
    );
  }
}
