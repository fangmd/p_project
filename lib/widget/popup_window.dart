import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:p_project/router/router.dart';
import 'package:p_project/styles/colors.dart';

const int _windowPopupDuration = 300;
const double _kWindowCloseIntervalEnd = 2.0 / 3.0;
const Duration _kWindowDuration = Duration(milliseconds: _windowPopupDuration);

void showPopupWindow({
  BuildContext context,
  Offset offset = Offset.zero,
  Widget child,
  double elevation = 2.0,
  int duration = 300,
}) {
  final RenderBox button = context.findRenderObject();
  final RenderBox overlay = Overlay.of(context).context.findRenderObject();
  final RelativeRect position = RelativeRect.fromRect(
    Rect.fromPoints(
      button.localToGlobal(offset, ancestor: overlay),
      button.localToGlobal(button.size.bottomRight(Offset.zero),
          ancestor: overlay),
    ),
    Offset.zero & overlay.size,
  );

  Navigator.push(
    context,
    _PopupWindowRoute(
      position: position,
      child: child,
      elevation: elevation,
      duration: duration,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    ),
  );
}

class GlobalLoading {
  static bool loadingShow = false;

  /// global loading
  /// ```
  /// showLoading();
  /// ```
  static void showLoading({
    double elevation = 0.0,
    int duration = 200,
  }) {
    // final RelativeRect position = RelativeRect.fromRect(
    //   Rect.fromPoints(Offset.fromDirection(80), Offset.fromDirection(100)),
    //   Rect.fromPoints(Offset.fromDirection(80), Offset.fromDirection(80)),
    // );
    loadingShow = true;

    final RelativeRect position = RelativeRect.fromLTRB(0, 0, 0, 0);

    RouterUtils.navigatorKey.currentState.push(_PopupWindowRoute(
      position: position,
      mbarrierDismissible: false,
      color: transparent,
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            color: transparent,
          ),
          Align(
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: SpinKitCircle(
                color: black1,
                size: 40.0,
              ),
            ),
          )
        ],
      ),
      elevation: elevation,
      duration: duration,
    ));
  }

  static void hideLoading() {
    if (loadingShow) {
      RouterUtils.pop2();
    }
  }
}

class _PopupWindowRoute extends PopupRoute {
  _PopupWindowRoute({
    this.position,
    this.child,
    this.elevation,
    this.barrierLabel,
    this.semanticLabel,
    this.duration,
    this.mbarrierDismissible = true,
    this.color = Colors.white,
    this.type = MaterialType.card,
  });

  @override
  Animation<double> createAnimation() {
    return CurvedAnimation(
      parent: super.createAnimation(),
      curve: Curves.linear,
      reverseCurve: const Interval(0.0, _kWindowCloseIntervalEnd),
    );
  }

  final RelativeRect position;
  final Widget child;
  final double elevation;
  final String semanticLabel;
  @override
  final String barrierLabel;
  final int duration;
  final MaterialType type;

  @override
  Duration get transitionDuration =>
      duration == 0 ? _kWindowDuration : Duration(milliseconds: duration);

  bool mbarrierDismissible;

  @override
  bool get barrierDismissible => mbarrierDismissible;

  @override
  Color get barrierColor => null;

  Color color;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final CurveTween opacity =
        CurveTween(curve: const Interval(0.0, 1.0 / 3.0));

    return Builder(
      builder: (BuildContext context) {
        return CustomSingleChildLayout(
          delegate: _PopupWindowLayout(position),
          child: AnimatedBuilder(
              child: child,
              animation: animation,
              builder: (BuildContext context, Widget child) {
                return Opacity(
                  opacity: opacity.evaluate(animation),
                  child: Material(
                    color: color,
                    type: type,
                    elevation: elevation,
                    child: child,
                  ),
                );
              }),
        );
      },
    );
  }
}

class _PopupWindowLayout extends SingleChildLayoutDelegate {
  _PopupWindowLayout(this.position);

  // Rectangle of underlying button, relative to the overlay's dimensions.
  final RelativeRect position;

  // We put the child wherever position specifies, so long as it will fit within
  // the specified parent size padded (inset) by 8. If necessary, we adjust the
  // child's position so that it fits.

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    // The menu can be at most the size of the overlay minus 8.0 pixels in each
    // direction.
    return BoxConstraints.loose(constraints.biggest);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    // size: The size of the overlay.
    // childSize: The size of the menu, when fully open, as determined by
    // getConstraintsForChild.

    // Find the ideal vertical position.
    double y = position.top;

    // Find the ideal horizontal position.
    double x = 0;
    if (position.left > position.right) {
      // Menu button is closer to the right edge, so grow to the left, aligned to the right edge.
      x = size.width - position.right - childSize.width;
    } else if (position.left < position.right) {
      // Menu button is closer to the left edge, so grow to the right, aligned to the left edge.
      x = position.left;
    }
    return Offset(x, y);
  }

  @override
  bool shouldRelayout(_PopupWindowLayout oldDelegate) {
    return position != oldDelegate.position;
  }
}
