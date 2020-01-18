import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/user_model.dart';

/// 全局数据
class AppStore {
  static BuildContext context;
  static BuildContext widgetCtx; // 可以方便其他地方使用过，但是不确定是否有副作用，暂时取消

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
