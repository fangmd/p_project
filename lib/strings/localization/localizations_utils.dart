import 'package:flutter/material.dart';
import 'package:p_utils/p_utils.dart';
import '../../c.dart';
import '../string_base.dart';
import 'my_localizations.dart';

StringBase getI18n(BuildContext context) {
  return MyLocalizations.of(context).currentLocalized;
}

StringBase getI18n2() {
  return MyLocalizations.localizedValues[LocalizationsUtils.currentLocale];
}

String converToHeaderLocale(String localeStr) {
  switch (localeStr) {
    case "en":
      return 'en-US';
      break;
    case "zh":
      return 'zh-CN';
      break;
    case 'vi':
      return 'vi-VN';
      break;
  }
  return '';
}

/// 国际化相关
class LocalizationsUtils {
  static const ZH = 'zh';
  static const EN = 'en';
  static const VI = 'vi';

  static String currentLocale = '';

  /// 默认语言(设备语言不在支持范围的时候使用)
  static const String DEFAULE_LOCALE = EN;

  /// 获取 app 支持的语言
  static List<Locale> getSupportLocale() {
    return [
      const Locale(EN),
      const Locale(ZH),
      const Locale(VI),
    ];
  }

  /// 设备语言转化成 Flutter 语言
  /// 不支持的设备语言使用 en
  static String convertDeviceLocaleToFlutterLocale(String deviceLocal) {
    String ret = EN;
    switch (deviceLocal) {
      case 'en_US':
        ret = EN;
        break;
      case 'zh_CN':
      case 'zh_TW':
        ret = ZH;
        break;
      case 'vi-VN':
        ret = VI;
        break;
      default:
        break;
    }
    return ret;
  }

  /// 获取多语言字符串
  static StringBase getLocaleString(BuildContext context) {
    return MyLocalizations.of(context).currentLocalized;
  }

  /// 获取 app 应该显示的语言
  static Future<String> getAppLocale() async {
    SPUtils spUtils = await SPUtils.getInstance();
    String localLocale = spUtils.getString(SP.LOCALIZATION);
    if (localLocale == null) {
      // use device language
      String deviceLocale = await DeviceInfoUtils.getLocalization();
      localLocale = convertDeviceLocaleToFlutterLocale(deviceLocale);
      Logger.d(msg: "use device locale: $localLocale");
    } else {
      Logger.d(msg: "use sp locale: $localLocale");
    }
    return localLocale;
  }

  /// 设置 APP 语言
  static setAppLocale(String locale) async {
    await SPUtils.getInstance()
      ..putString(SP.LOCALIZATION, locale);
  }

  static String getLanguageIc(BuildContext context) {
    var str = MyLocalizations.of(context).locale.languageCode;
    String ret = 'assets/home/england_ic.png';
    switch (str) {
      case EN:
        ret = 'assets/home/england_ic.png';
        break;
      case ZH:
        ret = 'assets/home/china_ic.png';
        break;
      case VI:
        ret = 'assets/home/vietnam_ic.png';
        break;
    }
    return ret;
  }
}
