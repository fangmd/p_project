import 'package:flutter/material.dart';
import 'package:p_project/app_localization_container.dart';
import 'package:p_project/app_state_container.dart';
import 'package:p_project/common/c.dart';
import 'package:p_project/common/common_utils.dart';
import 'package:p_project/common/utils/log.dart';
import 'package:p_project/page/mine_page.dart';
import 'package:p_project/router/router.dart';

class GesturePage extends StatefulWidget {
  static var routeName = '/';

  @override
  State<StatefulWidget> createState() {
    return _GesturePageState();
  }
}

class _GesturePageState extends State<GesturePage> {
  String _headText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onVerticalDragUpdate: (details){
            var dx = details.delta.dx;
            var dy = details.delta.dy;

            Log.d(message: "x: $dx, y: $dy");

          },
          child: Stack(
            children: <Widget>[
              Container(
                height: 50.0,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.blue),
                child: Text('$_headText'),
              ),
              Center(
                child: Text('Center Text'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
