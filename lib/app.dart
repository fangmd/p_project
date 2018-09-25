import 'dart:async';

import 'package:flutter/material.dart';
import 'package:p_project/app_localization_container.dart';
import 'package:p_project/common/c.dart';
import 'package:p_project/common/common_utils.dart';
import 'package:p_project/common/localization/my_localizations_delegate.dart';
import 'package:p_project/page/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:p_project/router/router.dart';

class AppRootWidget extends StatefulWidget {
  @override
  AppRootWidgetState createState() => new AppRootWidgetState();

  AppRootWidget();
}

class AppRootWidgetState extends State<AppRootWidget> {
  ThemeData get _themeData => new ThemeData(
        primaryColor: Colors.greenAccent,
        accentColor: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[300],
      );


  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizationContainer.of(context).locale;
    return new MaterialApp(
      title: 'Inherited',
      debugShowCheckedModeBanner: false,
      theme: _themeData,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        MyLocalizationsDelegate.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('zh', 'Chinese'), // Hebrew
      ],
      locale: Locale(locale),
      routes: buildRoutes2(),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
