import 'package:flutter/material.dart';
import 'package:p_project/common/base/base_page.dart';

class ApkInstallPgae extends BasePage {
  static final routeName = '/home/apk-install';
  ApkInstallPgae({Key key}) : super(key: key);

  @override
  _ApkInstallPgaeState createState() => _ApkInstallPgaeState();

  @override
  String getPageName() {
    return routeName;
  }
}

class _ApkInstallPgaeState extends State<ApkInstallPgae> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              // PInstall.install(
              //   filePath: "/storage/emulated/0/Download/1583136910686.apk",
              //   iosUrl:
              //       "https://itunes.apple.com/cn/app/%E5%86%8D%E6%83%A0%E5%90%88%E4%BC%99%E4%BA%BA/id1375433239?l=zh&ls=1&mt=8",
              // );
            },
            child: Text('install apk'),
          ),
        ],
      ),
    );
  }
}
