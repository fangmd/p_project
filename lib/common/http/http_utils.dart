import 'package:p_project/strings/localization/localizations_utils.dart';

/// 网络请求 code 码表
class HttpCode {
  /// 成功 100200
  static const int success = 100200;

  /// 失败
  static const int fail = 100199;

  /// token 失效/丢失
  static const int tokenError = 100201;

  /// token 更新
  static const int updateToken = 100203;

  /// 服务器错误
  static const int serviceError = 100198;

  /// 获取错误信息
  static String getErrorMsg(int code) {
    String ret;
    switch (code) {
      case serviceError:
        ret = getI18n2().errorService;
        break;
      default:
        ret = getI18n2().errorUnKnow;
        break;
    }
    return ret;
  }
}
