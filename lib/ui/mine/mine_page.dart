import 'package:flutter/material.dart';
import 'package:p_project/widget/img/img.dart';
import 'package:screen_adaptation/screen_extension.dart';

class MinePage extends StatefulWidget {
  static var routeName = '/mine';

  MinePage({Key key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with AutomaticKeepAliveClientMixin<MinePage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text("Mine"),
          ),
          localImg(
            'assets/common/female.svg',
            width: 40.dp,
            height: 40.dp,
          ),
          Center(
            child: Text("Mine"),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            icon: localImg(
              'assets/common/female.svg',
              width: 40.dp,
              height: 40.dp,
            ),
            onPressed: () {},
          ),
          Center(
            child: Text("Mine"),
          ),
        ],
      ),
    );
  }
}
