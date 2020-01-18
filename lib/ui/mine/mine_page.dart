import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  static var routeName = '/mine';
  MinePage({Key key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Mine"),
    );
  }
}
