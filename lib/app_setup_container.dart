import 'package:flutter/material.dart';
import 'package:p_project/app_localization_container.dart';
import 'package:p_project/app_state_container.dart';

class AppSetUpContainer extends StatelessWidget {
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AppLocalizationContainer(//国际化
      child: AppStateContainer(// 全局变量，
        child: child,
      ),
    );
  }

  AppSetUpContainer({@required this.child});
}
