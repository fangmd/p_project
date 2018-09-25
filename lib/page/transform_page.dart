import 'dart:async';

import 'package:flutter/material.dart';
import 'package:p_project/app_localization_container.dart';
import 'package:p_project/app_state_container.dart';
import 'package:p_project/common/c.dart';
import 'package:p_project/common/common_utils.dart';
import 'package:p_project/models/user_model.dart';
import 'package:p_project/page/log_page.dart';
import 'package:p_project/page/mine_page.dart';
import 'package:p_project/router/router.dart';

class TransformPage extends StatefulWidget {
  static var routeName = '/transfrom';

  @override
  State<StatefulWidget> createState() {
    return _TransformPageState();
  }
}

class _TransformPageState extends State<TransformPage>
    with SingleTickerProviderStateMixin {
  UserModel userModel = UserModel('Default User',
      "https://www.bsn.eu/wp-content/uploads/2016/12/user-icon-image-placeholder-300-grey.jpg");
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(duration: Duration(seconds: 2), vsync: this);

    animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    animation = Tween(begin: 1.0, end: 0.0).animate(animationController);

//    animation.addListener(() {
//      setState(() {});
//    });
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text('Refresh Indicator'),
        ),
        body: AnimatedBuilder(
          animation: animationController,
          builder: (context, child){
            return Column(
              children: <Widget>[
                Text('${animation.value}'),
                Transform(
                  transform:
                  Matrix4.translationValues(animation.value * width, 0.0, 0.0),
                  child: Column(
                    children: <Widget>[
                      Text('Title'),
                      SizedBox(
                        height: 24.0,
                      ),
                      Image.network(userModel.image),
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
