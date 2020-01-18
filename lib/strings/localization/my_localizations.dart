import 'package:flutter/material.dart';

import '../string_base.dart';
import '../string_en.dart';
import '../string_vi.dart';
import '../string_zh.dart';
import 'localizations_utils.dart';

class MyLocalizations {
  final Locale locale;

  MyLocalizations(this.locale);

  ///根据不同 locale.languageCode 加载不同语言对应
  static Map<String, StringBase> localizedValues = {
    LocalizationsUtils.EN: StringEn(),
    LocalizationsUtils.ZH: StringZh(),
    LocalizationsUtils.VI: StringVi(),
  };

  StringBase get currentLocalized {
    return localizedValues[locale.languageCode];
  }

  ///通过 Localizations 加载当前的 DefaultLocalizations
  ///获取对应的 StringBase
  static MyLocalizations of(BuildContext context) {
    return Localizations.of(context, MyLocalizations);
  }
}
