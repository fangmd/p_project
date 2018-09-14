import 'package:flutter/material.dart';
import 'package:p_project/style/string_base.dart';
import 'package:p_project/style/string_en.dart';
import 'package:p_project/style/string_zh.dart';

class MyLocalizations {
  final Locale locale;

  MyLocalizations(this.locale);

  ///根据不同 locale.languageCode 加载不同语言对应
  static Map<String, StringBase> _localizedValues = {
    'en': StringEN(),
    'zh': StringZH(),
  };

  StringBase get currentLocalized {
    return _localizedValues[locale.languageCode];
  }

  ///通过 Localizations 加载当前的 DefaultLocalizations
  ///获取对应的 StringBase
  static MyLocalizations of(BuildContext context) {
    return Localizations.of(context, MyLocalizations);
  }
}
