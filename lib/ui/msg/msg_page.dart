import 'package:flutter/material.dart';

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
      body: Text("Msg"),
    );
  }
}
