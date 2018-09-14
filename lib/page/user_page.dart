import 'package:flutter/material.dart';
import 'package:p_project/app_state_container.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appStateContainer = AppStateContainer.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                appStateContainer.updateUserName('Fangmingdong');
              },
              child: Text('Change Name to Fangmingdong'),
            ),
            RaisedButton(
              onPressed: () {
                appStateContainer.updateUserName('方明东');
              },
              child: Text('Change Name to 方明东'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text('To home page'),
            ),
            Text(appStateContainer.state.user.userName),
          ],
        ),
      ),
    );
  }
}
