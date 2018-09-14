import 'package:flutter/material.dart';
import 'package:p_project/app_localization_container.dart';
import 'package:p_project/app_state_container.dart';

class AppSetUpContainer extends StatelessWidget {
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AppLocalizationContainer(
      child: AppStateContainer(
        child: child,
      ),
    );
  }

  AppSetUpContainer({@required this.child});
}
