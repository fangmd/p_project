import 'package:flutter/material.dart';
import 'localizations_utils.dart';

class AppLocalizationContainer extends StatefulWidget {
  final Widget child;

  @override
  State<StatefulWidget> createState() {
    return _AppLocalizationContainerState();
  }

  AppLocalizationContainer({@required this.child});

  static _AppLocalizationContainerState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_AppLocalizationInheritedWidget>()
        .data;
  }
}

class _AppLocalizationContainerState extends State<AppLocalizationContainer> {
  String locale = LocalizationsUtils.EN;

  @override
  void initState() {
    super.initState();
    LocalizationsUtils.getAppLocale().then((value) {
      setLocal(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _AppLocalizationInheritedWidget(
      data: this,
      child: widget.child,
    );
  }

  void setLocal(String locale) {
    if (locale == null || locale.isEmpty) return;
    if (this.locale == locale) return;

    // save locale
    LocalizationsUtils.saveAppLocale(locale);
    LocalizationsUtils.currentLocale = locale;

    setState(() {
      this.locale = locale;
    });
  }
}

class _AppLocalizationInheritedWidget extends InheritedWidget {
  final _AppLocalizationContainerState data;

  _AppLocalizationInheritedWidget({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
