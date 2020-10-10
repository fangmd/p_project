import 'package:flutter/material.dart';
import 'package:p_project/router/router.dart';
import 'package:p_project/ui/plugin/params/params_plugin_page.dart';


class PluginPage extends StatefulWidget {
  static var routeName = '/plugin-demo';
  PluginPage({Key key}) : super(key: key);

  @override
  _PluginPageState createState() => _PluginPageState();
}

class _PluginPageState extends State<PluginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  RouterUtils.pushNamed(context, ParamsPluginPage.routeName);
                },
                child: Text('1. 简单参数传递'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
