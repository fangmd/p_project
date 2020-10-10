import 'package:flutter/material.dart';
import 'package:p_project/styles/text.dart';
import 'package:screen_adaptation/screen_utils.dart';

/// 导航栏
/// SafeArea
class TopNav extends StatelessWidget {
  final String title;
  final String rightImg;
  final VoidCallback rightClick;
  final bool showBackIc;
  final Color color;
  final Widget rightWidget;
  Widget backImg;

  TopNav({
    this.showBackIc = true,
    this.backImg,
    this.title,
    this.rightImg,
    this.rightClick,
    this.rightWidget,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (backImg == null) {
      this.backImg = Image.asset(
        'assets/common/nav_back_ic.png',
        width: px2dp(18),
        height: px2dp(34),
      );
    }

    List<Widget> list = [];
    if (showBackIc) {
      list.add(_buldBackIc(context));
    }
    if (title != null) {
      list.add(_buildTitle());
    }
    if (rightImg != null) {
      list.add(_buildRightImg());
    }
    if (rightWidget != null) {
      list.add(_buildRightWidget());
    }

    return Container(
      color: color,
      child: SafeArea(
        bottom: false,
        child: Container(
          width: double.infinity,
          height: px2dp(80),
          child: Stack(
            children: list,
          ),
        ),
      ),
    );
  }

  Widget _buldBackIc(BuildContext context) {
    return Positioned(
      left: px2dp(10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          height: px2dp(80),
          width: px2dp(80),
          child: Center(
            child: backImg,
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Center(child: Text(title, style: AppTheme.adBlack30Bold));
  }

  Widget _buildRightImg() {
    return Positioned(
      right: px2dp(10),
      top: 0,
      child: InkWell(
        onTap: rightClick,
        child: Container(
          height: px2dp(80),
          width: px2dp(80),
          child: Center(
            child: Image.asset(
              rightImg,
              width: px2dp(40),
              height: px2dp(40),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRightWidget() {
    var icTop = (80 - 40) / 2;
    return Positioned(
      right: px2dp(22),
      top: px2dp(icTop),
      child: InkWell(
        onTap: rightClick,
        child: rightWidget,
      ),
    );
  }
}
