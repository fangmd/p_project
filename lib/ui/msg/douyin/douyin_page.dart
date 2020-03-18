import 'package:flutter/material.dart';
import 'package:p_project/common/base/base_page.dart';

class DouYinPage extends BasePage {
  static const routeName = 'douyin';
  DouYinPage({Key key}) : super(key: key);

  @override
  _DouYinPageState createState() => _DouYinPageState();

  @override
  String getPageName() {
    return routeName;
  }
}

class _DouYinPageState extends BasePageState<DouYinPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (value) {
          // value.metrics.
        },
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: <Widget>[
            Container(
              height: screenHeight,
              width: double.infinity,
              color: Colors.green,
              child: Text('1'),
            ),
            Container(
              height: screenHeight,
              width: double.infinity,
              color: Colors.grey,
              child: Text('2'),
            ),
          ],
        ),
      ),
    );
  }
}
