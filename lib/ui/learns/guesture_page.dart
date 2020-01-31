import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p_project/common/base/base_page.dart';
import 'package:p_project/styles/colors.dart';
import 'package:p_project/utils/extentions/common_extentions.dart';
import 'package:p_project/utils/logger.dart';
import 'package:p_project/widget/simple_widget.dart';

/// 手势触摸 tests
class GuesturePage extends BasePage {
  static const routeName = '/learn/guesture';

  GuesturePage({Key key}) : super(key: key);

  @override
  _GuesturePageState createState() => _GuesturePageState();

  @override
  String getPageName() {
    return GuesturePage.routeName;
  }
}

class _GuesturePageState extends BasePageState<GuesturePage> {
  double _dx = 10.0;
  double _dy = 10.0;
  double _scale = 1.0;

  double _downDx = 0.0;
  double _downDy = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final matrix = Matrix4.identity()
      ..translate(_dx, _dy)
      ..scale(_scale);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text('GuesturePage'),
            // _buildTestPan(matrix),
            _buildTestVertical(matrix),
          ],
        ),
      ),
    );
  }

  GestureDetector _buildTestVertical(Matrix4 matrix) {
    return GestureDetector(
      onVerticalDragDown: (DragDownDetails downDetails) {
        _downDx = downDetails.globalPosition.dx;
        _downDy = downDetails.globalPosition.dy;
        Logger.d(msg: '_downDx: $_downDx _downDy: $_downDy');
      },
      onVerticalDragUpdate: (DragUpdateDetails updateDetails) {
        final distanceX = updateDetails.delta.dx;
        final distanceY = updateDetails.delta.dy;

        Logger.d(msg: ' distanceX:$distanceX, distanceY:$distanceY');

        setState(() {
          _dx += distanceX;
          _dy += distanceY;
        });
      },
      child: Container(
        width: 200.dp(),
        height: 200.dp(),
        color: grey_666,
        alignment: Alignment.center,
        child: Transform(
          child: reactangleWidget(
            width: 100.dp(),
            height: 100.dp(),
            color: red1,
          ),
          transform: matrix,
          alignment: Alignment.center,
        ),
      ),
    );
  }

  GestureDetector _buildTestPan(Matrix4 matrix) {
    return GestureDetector(
      onPanDown: (DragDownDetails dragDownDetails) {
        _downDx = dragDownDetails.globalPosition.dx;
        _downDy = dragDownDetails.globalPosition.dy;
        Logger.d(msg: '_downDx: $_downDx _downDy: $_downDy');
      },
      onPanUpdate: (DragUpdateDetails dragUpdateDetails) {
        final newDx = dragUpdateDetails.globalPosition.dx;
        final newDy = dragUpdateDetails.globalPosition.dy;

        final distanceX = newDx - _downDx;
        final distanceY = newDy - _downDy;

        Logger.d(
            msg:
                'newDx: $newDx newDy: $newDy distanceX:$distanceX, distanceY:$distanceY');

        setState(() {
          _dx = distanceX;
          _dy = distanceY;
        });
      },
      child: Container(
        width: 200.dp(),
        height: 200.dp(),
        color: grey_666,
        alignment: Alignment.center,
        child: Transform(
          child: reactangleWidget(
            width: 100.dp(),
            height: 100.dp(),
            color: red1,
          ),
          transform: matrix,
          alignment: Alignment.center,
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
}
