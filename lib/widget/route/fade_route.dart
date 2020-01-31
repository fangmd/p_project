import 'package:flutter/material.dart';

/// 页面跳转动画
/// 透明过渡
class FadeRoute<T> extends PageRouteBuilder<T> {
  final Widget child;

  FadeRoute({
    @required this.child,
    RoutePageBuilder builder,
    RouteSettings settings,
  }) : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return child;
          },
          settings: settings,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return FadeTransition(opacity: animation, child: child);
  }
}
