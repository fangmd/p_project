import 'package:flutter/material.dart';
import 'package:p_project/app_localization_container.dart';
import 'package:p_project/common/c.dart';
import 'package:p_project/common/common_utils.dart';
import 'package:p_project/common/localization/my_localizations_delegate.dart';
import 'package:p_project/page/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppRootWidget extends StatefulWidget {
  final String locale;

  @override
  AppRootWidgetState createState() => new AppRootWidgetState(locale);

  AppRootWidget({this.locale});
}

class AppRootWidgetState extends State<AppRootWidget> {
  String locale;

  ThemeData get _themeData => new ThemeData(
        primaryColor: Colors.cyan,
        accentColor: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[300],
      );

  @override
  Widget build(BuildContext context) {
    locale = AppLocalizationContainer.of(context).locale;
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
      routes: {
        '/': (_) => HomePage(),
      },
    );
  }

  AppRootWidgetState(this.locale);
}
