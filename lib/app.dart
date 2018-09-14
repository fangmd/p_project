import 'package:flutter/material.dart';
import 'package:p_project/page/home_page.dart';

class AppRootWidget extends StatefulWidget {
  @override
  AppRootWidgetState createState() => new AppRootWidgetState();
}

class AppRootWidgetState extends State<AppRootWidget> {
  ThemeData get _themeData => new ThemeData(
        primaryColor: Colors.cyan,
        accentColor: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[300],
      );

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Inherited',
      debugShowCheckedModeBanner: false,
      theme: _themeData,
      routes: {
        '/': (_) => HomePage(),
      },
    );
  }
}
