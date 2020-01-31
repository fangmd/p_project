import 'package:flutter/material.dart';
import 'package:p_project/router/router.dart';
import 'package:p_project/ui/learns/guesture_page.dart';

class MsgPage extends StatefulWidget {
  static var routeName = '/msg';
  MsgPage({Key key}) : super(key: key);

  @override
  _MsgPageState createState() => _MsgPageState();
}

class _MsgPageState extends State<MsgPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              RouterUtils.pushNamed(context, GuesturePage.routeName);
            },
            child: Text('手势触摸Demo'),
          ),
        ],
      )),
    );
  }
}
