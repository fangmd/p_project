import 'package:flutter/material.dart';
import 'package:p_project/ui/home/page_animate/one/one_page_animate_page.dart';

/// 界面退出动画
/// 退出界面的时候自执行动画(500ms)
/// 透明度动画: 1 -> 0
/// 移动动画: 0 -> -控件高度
///
/// 作用: 退出页面的时候自动执行的动画
///
///
/// 使用:
///
/// ```dart
/// FadeAnimationNoThird(
///   delay: 1.2,
///   child: Text('Demo'),
/// )
/// ```
///
class FadeOutAnimationNoThird extends StatefulWidget {
  final double delay;
  final Widget child;
  final MController controller;

  FadeOutAnimationNoThird({
    Key key,
    this.delay = 1.0,
    this.child,
    @required this.controller,
  }) : super(key: key);

  @override
  _FadeOutAnimationNoThirdState createState() =>
      _FadeOutAnimationNoThirdState();
}

class _FadeOutAnimationNoThirdState extends State<FadeOutAnimationNoThird>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation opacityAnimation;
  Animation<Offset> translateYAnimation;
  Duration delay = Duration.zero;
  bool _waitForDelay = true;
  bool _isDisposed = false;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });

    opacityAnimation = Tween(begin: 1.0, end: 0.0)
        .chain(CurveTween(curve: Curves.easeIn))
        .animate(_controller);

    translateYAnimation =
        Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(0.0, -1.0))
            .chain(CurveTween(curve: Curves.easeInOut))
            .animate(_controller);

    _controller.addStatusListener((AnimationStatus state) {
      if (state == AnimationStatus.completed) {
        Future.delayed(Duration(milliseconds: 600), () {
          _controller.reset();
        });
      }
    });

    delay = Duration(milliseconds: (500 * widget.delay).round());

    widget.controller.addStartAnimation(startAnimation);

    super.initState();
  }

  void startAnimation() async {
    if (widget.delay != null) {
      await Future.delayed(delay);
    }
    _waitForDelay = false;
    executeInstruction();
  }

  void executeInstruction() async {
    if (_isDisposed || _waitForDelay) {
      return;
    }
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: translateYAnimation,
      child: FadeTransition(
        opacity: opacityAnimation,
        child: widget.child,
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  void dispose() {
    _isDisposed = true;
    _controller.dispose();
    super.dispose();
  }
}
