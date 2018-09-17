import 'dart:async';

import 'package:flutter/material.dart';
import 'package:p_project/common/localization/my_localizations.dart';
import 'package:p_project/style/string_base.dart';
import 'package:connectivity/connectivity.dart';

class CommonUtils {
  /// get local images
  static getAssets(String imgName) {
    return 'statis/imgs/${imgName}.png';
  }

  /// get strings
  static StringBase getLocale(BuildContext context) {
    return MyLocalizations.of(context).currentLocalized;
  }

  ///网络是否可用
  static Future<bool> netConnected() async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}
