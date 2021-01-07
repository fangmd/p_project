class C {
  static const String BASE_URL = "http://xxx";

  /// 列表 pageSize: 数量
  static const PAGE_SIZE = 30;
}

class SP {
  static const String LOCALIZATION = 'sp_localization';
  static const String USER_ID = 'user_id';
  static const String TOKEN = 'sp_token';
  static const SPLASH_IMG = 'splash_img';
}

/// logger tag
class Tag {
  static const String HTTP = "HTTP";
  static const String IM = "IM";
  static const String CROP = "CROP";
  static const String FILE = "File";
  static const Analytics = "Analytics";
}

/// app 校验错误
class AppErrorCode {
  static const int ERROR_BASE = 9999000;

  /// 输入的内容不合法
  static const int CONTENT = 9999001;

  /// 内容长度太短
  static const int CONTENT_SHORT = 9999006;

  /// 手机号错误
  static const int PHONE = 9999002;

  /// 未选择地区
  static const int CITY_UNSELECTED = 9999003;

  /// 修改失败
  static const int MODIFY_FILE = 9999004;

  /// 失败
  static const int FAIL = 9999005;

  static String getErrorMsg(int code) {
    String ret = '';
    // switch (code) {
    //   case CONTENT:
    //     ret = i18n2().contentError;
    //     break;
    //   case PHONE:
    //     ret = i18n2().phoneError;
    //     break;
    //   case CITY_UNSELECTED:
    //     ret = i18n2().cityUnSelected;
    //     break;
    //   case MODIFY_FILE:
    //     ret = i18n2().modifyFail;
    //     break;
    //   default:
    //     ret = 'CError';
    // }
    return ret;
  }
}

class HeroTag {
  static const SEARCH = 'search';
}
