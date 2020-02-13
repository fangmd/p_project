import 'package:flutter/material.dart';
import 'package:p_project/ui/plugin/params/params_plugin.dart';

/// 简单参数传递
class ParamsPluginPage extends StatefulWidget {
  static var routeName = '/plugin-demo/params';

  ParamsPluginPage({Key key}) : super(key: key);

  @override
  _ParamsPageState createState() => _ParamsPageState();
}

class _ParamsPageState extends State<ParamsPluginPage> {
  String strFromNative = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Data From Native: $strFromNative'),
              RaisedButton(
                onPressed: () {
                  ParamsPlugin.dealData("Hello Native", 1000).then((value) {
                    int a = value["ret_int"];
                    String b = value["ret_str"];
                    setState(() {
                      strFromNative = '$a $b';
                    });
                  });
                },
                child: Text('给 Native 传递数据，并且数据处理结果'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
