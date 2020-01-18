import 'package:flutter/material.dart';
import 'package:p_project/common/event_bus.dart';

import 'localizations_utils.dart';

class AppLocalizationContainer extends StatefulWidget {
  final Widget child;

  @override
  State<StatefulWidget> createState() {
    return _AppLocalizationContainerState();
  }

  AppLocalizationContainer({@required this.child});

  static _AppLocalizationContainerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(
            _AppLocalizationInheritedWidget) as _AppLocalizationInheritedWidget)
        .data;
  }
}

class _AppLocalizationContainerState extends State<AppLocalizationContainer> {
  String locale = LocalizationsUtils.EN;

  @override
  void initState() {
    super.initState();
    LocalizationsUtils.getAppLocale().then((value) {
      setState(() {
        locale = value;
      });
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
    if (locale != null) {
      // save locale
      LocalizationsUtils.setAppLocale(locale);
    }
    if (this.locale == locale) return;
    setState(() {
      this.locale = locale;
    });
    Future.delayed(Duration(milliseconds: 500), () {
      eventBus.fire(LocaleChangeEvent());
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
