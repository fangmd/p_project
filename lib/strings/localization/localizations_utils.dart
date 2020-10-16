import 'package:p_project/service/db/settings_dao.dart';
import 'package:p_project/store/app_store.dart';
import 'package:p_utils/p_utils.dart';
import 'package:flutter/material.dart';
import '../../c.dart';
import '../string_base.dart';
import 'app_localization_container.dart';
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
  }
  return '';
}

/// 国际化相关
class LocalizationsUtils {
  static const ZH = 'zh';
  static const EN = 'en';

  static String currentLocale = '';

  /// 默认语言(设备语言不在支持范围的时候使用)
  static const String DEFAULE_LOCALE = EN;

  /// 获取 app 支持的语言
  static List<Locale> getSupportLocale() {
    return [
      const Locale(ZH),
      const Locale(EN),
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
  static Future<String> getAppLocale({showLog = true}) async {
    String localLocale = SettingsDao().get(SP.LOCALIZATION);
    if (localLocale == null) {
      // use device language
      String deviceLocale = await DeviceInfoUtils.getLocalization();
      localLocale = convertDeviceLocaleToFlutterLocale(deviceLocale);
      if (showLog) Logger.d(msg: "use device locale: $localLocale");
    } else {
      if (showLog) Logger.d(msg: "use sp locale: $localLocale");
    }
    return localLocale;
  }

  /// 设置 APP 语言
  static saveAppLocale(String locale) async {
    SettingsDao().set(SP.LOCALIZATION, locale);
  }

  /// 切换语言
  static switchLocale({String locale}) {
    if (locale != null) {
      AppLocalizationContainer.of(AppStore.widgetCtx).setLocal(locale);
    } else {
      if (LocalizationsUtils.currentLocale == LocalizationsUtils.ZH) {
        AppLocalizationContainer.of(AppStore.widgetCtx)
            .setLocal(LocalizationsUtils.EN);
      } else {
        AppLocalizationContainer.of(AppStore.widgetCtx)
            .setLocal(LocalizationsUtils.ZH);
      }
    }
  }
}
