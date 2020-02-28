import 'package:flutter/material.dart';
import 'package:p_project/common/base/base_page.dart';
import 'package:p_project/manager/file_manager.dart';
import 'package:p_project/mock.dart';
import 'package:p_project/service/net/file_service.dart';

class NetPage extends BasePage {
  static const routeName = '/net';
  NetPage({Key key}) : super(key: key);

  @override
  _NetPageState createState() => _NetPageState();

  @override
  String getPageName() {
    return routeName;
  }
}

class _NetPageState extends BasePageState<NetPage> {
  int _received = 0;
  int _total = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              FileManager.getCachePath().then((path) {
                FileService.download(
                  ApkUrlMock.coolApk,
                  "$path/file.apk",
                  onReceiveProgress: (received, total) {
                    setState(() {
                      _received = received;
                      _total = total;
                    });
                  },
                );
              });
            },
            child: Text('Download apk $_received/$_total'),
          ),
        ],
      ),
    );
  }
}
