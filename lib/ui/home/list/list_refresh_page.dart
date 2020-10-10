import 'package:flutter/material.dart';
import 'package:p_project/common/base/base_page.dart';
import 'package:p_project/styles/text.dart';
import 'package:screen_adaptation/screen_extension.dart';

class ListRefreshPage extends BasePage {
  static const routeName = '/list-refresh-page';
  ListRefreshPage({Key key}) : super(key: key);

  @override
  _ListRefreshPageState createState() => _ListRefreshPageState();

  @override
  String getPageName() {
    return routeName;
  }
}

class _ListRefreshPageState extends State<ListRefreshPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return NotificationListener<ScrollNotification>(
      onNotification: (value) {
        print('distance: ${value.metrics.pixels}');
        return false;
      },
      child: ListView.builder(
        padding: EdgeInsets.all(0),
        itemBuilder: (c, i) => _buildItem(c, i),
        itemCount: 80,
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return Container(
      height: 80.dp,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('$index', style: AppTheme.adBlack36),
        ],
      ),
    );
  }
}
