import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:p_project/app_localization_container.dart';
import 'package:p_project/app_state_container.dart';
import 'package:p_project/common/c.dart';
import 'package:p_project/common/common_utils.dart';
import 'package:p_project/page/log_page.dart';
import 'package:p_project/page/mine_page.dart';
import 'package:p_project/page/refresh_page.dart';
import 'package:p_project/page/transform_page.dart';
import 'package:p_project/router/router.dart';

class AppBarNormalPage extends StatelessWidget {
  static var routeName = '/normal_appbar';

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
//      statusBarColor: theme.primaryColor,
//    ));

//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
//      statusBarColor: theme.primaryColor,
//    ));

    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 60.0, child: Text('asdsa')),
            SizedBox(height: 60.0, child: Text('asdsa')),
            SizedBox(height: 60.0, child: Text('asdsa')),
            SizedBox(height: 60.0, child: Text('asdsa')),
            SizedBox(height: 60.0, child: Text('asdsa')),
            SizedBox(height: 60.0, child: Text('asdsa')),
            SizedBox(height: 60.0, child: Text('asdsa')),
            SizedBox(height: 60.0, child: Text('asdsa')),
            SizedBox(height: 60.0, child: Text('asdsa')),
            SizedBox(height: 60.0, child: Text('asdsa')),
            SizedBox(height: 60.0, child: Text('asdsa')),
            SizedBox(height: 60.0, child: Text('asdsa')),
            SizedBox(height: 60.0, child: Text('asdsa')),
            SizedBox(height: 60.0, child: Text('asdsa')),
            SizedBox(height: 60.0, child: Text('asdsa')),
            SizedBox(height: 60.0, child: Text('asdsa')),
            SizedBox(height: 60.0, child: Text('asdsa')),
            SizedBox(height: 60.0, child: Text('asdsa')),
            SizedBox(height: 60.0, child: Text('asdsa')),
            SizedBox(height: 60.0, child: Text('asdsa')),
          ],
        ),
      ),
    );
  }
}
