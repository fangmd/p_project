import 'package:flutter/material.dart';
import 'package:p_project/common/base/base_page.dart';
import 'package:p_widget/p_widget.dart';

class GlobalLoadingPage extends BasePage {
  static const routeName = '/global-loading';
  GlobalLoadingPage({Key key}) : super(key: key);

  @override
  _GlobalLoadingPageState createState() => _GlobalLoadingPageState();

  @override
  String getPageName() {
    return routeName;
  }
}

class _GlobalLoadingPageState extends BasePageState<GlobalLoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              print('show loading');
              GlobalLoading.showLoading(forceLoading: true);

              // Future.delayed(
              //   Duration(seconds: 3),
              //   () {
              //     print('hide loading');
              //     GlobalLoading.hideLoading();
              //   },
              // );
            },
            child: Text('show'),
          ),
          RaisedButton(
            onPressed: () {
              GlobalLoading.hideLoading();
            },
            child: Text('hide'),
          ),
        ],
      ),
    );
  }
}
