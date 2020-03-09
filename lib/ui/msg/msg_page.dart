import 'package:flutter/material.dart';
import 'package:p_project/router/router.dart';
import 'package:p_project/ui/learns/guesture_page.dart';
import 'package:p_project/widget/wheel/simple_wheel.dart';

import 'douyin/douyin_page.dart';

class MsgPage extends StatefulWidget {
  static var routeName = '/msg';

  MsgPage({Key key}) : super(key: key);

  @override
  _MsgPageState createState() => _MsgPageState();
}

class _MsgPageState extends State<MsgPage>
    with AutomaticKeepAliveClientMixin<MsgPage> {
  @override
  bool get wantKeepAlive => true;

  List<String> _rights;

  @override
  void initState() {
    _rights = [];
    for (var i = 0; i < 24; i++) {
      if (i < 9) {
        final a = i + 1;
        _rights.add('0$a:00');
      } else {
        final a = i + 1;
        _rights.add('$a:00');
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () =>
                RouterUtils.pushNamed(context, GuesturePage.routeName),
            child: Text('手势触摸Demo'),
          ),
          _buildWhellBtn(),
          RaisedButton(
            onPressed: () =>
                RouterUtils.pushNamed(context, DouYinPage.routeName),
            child: Text('抖音首页UI'),
          ),
        ],
      )),
    );
  }

  Widget _buildWhellBtn() {
    return RaisedButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: 220,
              child: WheelWidget(
                data: _rights,
                secData: _rights,
                showDivide: true,
                onSelected: (index) {
                  print('$index');
                },
                initIndex: 2,
                initSecIndex: 0,
                onSecSelected: (index) {
                  print('$index');
                },
              ),
            );
          },
        );
      },
      child: Text('滚轮控件'),
    );
  }
}
