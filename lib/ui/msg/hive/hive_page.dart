import 'package:flutter/material.dart';
import 'package:p_project/common/base/base_page.dart';
import 'package:p_project/service/db/settings_dao.dart';

class HivePage extends BasePage {
  static const routeName = '/hive';
  HivePage({Key key}) : super(key: key);

  @override
  _HivePageState createState() => _HivePageState();

  @override
  String getPageName() {
    return routeName;
  }
}

class _HivePageState extends BasePageState<HivePage> {
  int cnt = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              SettingsDao().set('name', cnt);
            },
            child: Text('Save Name $cnt'),
          ),
          FlatButton(
            onPressed: () {
              int c = SettingsDao().get('name') as int;
              setState(() {
                cnt = c + 1;
              });
            },
            child: Text('Get Name'),
          ),
        ],
      ),
    );
  }
}
