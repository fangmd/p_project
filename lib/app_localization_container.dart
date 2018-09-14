import 'package:flutter/material.dart';
import 'package:p_project/common/c.dart';
import 'package:p_project/common/localization/my_localizations_delegate.dart';

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

  String locale = ZH;

  @override
  Widget build(BuildContext context) {
    return _AppLocalizationInheritedWidget(
      child: widget.child,
      data: this,
    );
  }

  void setLocal(String local) {
    print('change launguage $local');
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
