import 'package:flutter/material.dart';
import 'package:p_project/app_localization_container.dart';
import 'package:p_project/app_state_container.dart';
import 'package:p_project/common/c.dart';
import 'package:p_project/common/common_utils.dart';
import 'package:p_project/page/log_page.dart';
import 'package:p_project/page/mine_page.dart';
import 'package:p_project/page/refresh_page.dart';
import 'package:p_project/page/transform_page.dart';
import 'package:p_project/router/router.dart';

class SliverAppBarPage extends StatelessWidget {
  static var routeName = '/sliver_app';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(

          ),
          SliverToBoxAdapter(
            child: Text('Sliver'),
          ),
          SliverList(
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index){
                return Text('Item');
              },
              childCount: 80,
            ),
          )
        ],
      ),
    );
  }
}
