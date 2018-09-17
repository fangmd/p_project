import 'package:flutter/material.dart';
import 'package:p_project/app_localization_container.dart';
import 'package:p_project/app_state_container.dart';
import 'package:p_project/common/c.dart';
import 'package:p_project/common/common_utils.dart';
import 'package:p_project/page/mine_page.dart';
import 'package:p_project/page/my_tab_bar.dart';
import 'package:p_project/router/router.dart';

class AppTabPage extends StatefulWidget {
  static var routeName = '/';

  @override
  State<StatefulWidget> createState() {
    return _AppTabState();
  }
}

class _AppTabState extends State<AppTabPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            title: Text('Title'),
            centerTitle: true,
            bottom: MyTabBar(
              tabs: [
                Tab(
                  child: Text('Child Text'),
                ),
                Tab(
                  text: 'News',
                ),
                Tab(
                  text: 'Mine',
                ),
              ],
            )),
        body: TabBarView(
          children: [
            Text('Home'),
            Text('News'),
            Text('Mine'),
          ],
        ),
      ),
    );
  }
}
