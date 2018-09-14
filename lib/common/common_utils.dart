import 'package:flutter/material.dart';
import 'package:p_project/common/localization/my_localizations.dart';
import 'package:p_project/style/string_base.dart';

class CommonUtils {
  static StringBase getLocale(BuildContext context) {
    return MyLocalizations.of(context).currentLocalized;
  }
}
