import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

/// 自启动动画(500ms)
/// 透明度动画: 0 -> 1
/// 移动动画: -130 -> 0
///
/// 作用: 进入页面的时候自动执行的动画
///
/// 借助了第三方库 simple_animations
///
/// 使用:
///
/// ```dart
/// FadeAnimation(
///   1.2,
///   Text('Demo'),
/// )
/// ```
///
class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity")
          .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateY").add(
          Duration(milliseconds: 500), Tween(begin: -130.0, end: 0.0),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: Offset(0, animation["translateY"]), child: child),
      ),
    );
  }
}

/// 和 FadeAnimation 相同作用，不依赖第三方库版本
/// 进入界面的时候自执行动画(500ms)
/// 透明度动画: 0 -> 1
/// 移动动画: -控件高度 -> 0
///
/// 作用: 进入页面的时候自动执行的动画
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
class FadeAnimationNoThird extends StatefulWidget {
  final double delay;
  final Widget child;

  FadeAnimationNoThird({
    Key key,
    this.delay = 1,
    this.child,
  }) : super(key: key);

  @override
  _FadeAnimationNoThirdState createState() => _FadeAnimationNoThirdState();
}

class _FadeAnimationNoThirdState extends State<FadeAnimationNoThird>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation opacityAnimation;
  Animation<Offset> translateYAnimation;
  Duration delay = Duration.zero;
  bool _waitForDelay = true;
  bool _isDisposed = false;

  @override
  void initState() {
    print('initState _FadeAnimationNoThirdState');
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });

    opacityAnimation = Tween(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: Curves.easeIn))
        .animate(_controller);

    translateYAnimation = Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0))
        .chain(CurveTween(curve: Curves.easeInOut))
        .animate(_controller);

    delay = Duration(milliseconds: (500 * widget.delay).round());

    initialize();
    super.initState();
  }

  void initialize() async {
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
    print('forward _FadeAnimationNoThirdState');
    _controller.forward();
  }

  @override
  void didUpdateWidget(FadeAnimationNoThird oldWidget) {
    print('didUpdateWidget _FadeAnimationNoThirdState');
    executeInstruction();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    /// 透明动画:
    /// Opacity: 无动画效果
    /// AnimatedOpacity
    /// FadeTransition

    return SlideTransition(
      position: translateYAnimation,
      child: FadeTransition(
        opacity: opacityAnimation,
        child: widget.child,
      ),
    );
  }

  void dispose() {
    _isDisposed = true;
    _controller.dispose();
    super.dispose();
  }
}
