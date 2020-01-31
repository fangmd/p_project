import 'package:flutter/material.dart';
import 'package:p_project/router/router.dart';
import 'package:p_project/ui/image_viewer/image_viewer_page.dart';

class HomePage extends StatefulWidget {
  static var routeName = '/home';
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  RouterUtils.pushNamed(context, ImageViewerPage.routeName);
                },
                child: Text('图片游览'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
