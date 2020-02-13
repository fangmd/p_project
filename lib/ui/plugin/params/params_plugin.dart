import 'dart:async';

import 'package:flutter/services.dart';

class ParamsPlugin {
  static const MethodChannel _channel =
      const MethodChannel('passon_params_plugin');

  static Future<Map<String, dynamic>> dealData(
      String strData, int intData) async {
    Map<String, dynamic> args = {};

    args["key_int"] = intData;
    args["key_string"] = strData;
    final ret = await _channel.invokeMethod("dealData", args);
    return Map<String, dynamic>.from(ret);
  }
}
