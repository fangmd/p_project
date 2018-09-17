import 'package:dio/dio.dart';
import 'package:p_project/common/c.dart';

class HttpManager {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";
  static Map optionParams = {
    "timeoutMs": 15000,
    "token": null,
    "authorizationCode": null,
  };

  static temp() {
    if (C.isDebug()) {
      
    }
  }
}
