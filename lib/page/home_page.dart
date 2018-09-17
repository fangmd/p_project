import 'package:flutter/material.dart';
import 'package:p_project/app_localization_container.dart';
import 'package:p_project/app_state_container.dart';
import 'package:p_project/common/c.dart';
import 'package:p_project/common/common_utils.dart';
import 'package:p_project/page/mine_page.dart';
import 'package:p_project/router/router.dart';

class HomePage extends StatefulWidget {
  static var routeName = '/';

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  bool _visibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: AnimatedContainer(
          duration: Duration(milliseconds: ANIMATED_DURATION_DEFAULT),
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _visibility = !_visibility;
                  });
                },
                child: Text('change launge - zh'),
              ),
              Text(AppStateContainer.of(context).state.user.userName),
              Visibility(
                child: Text('Visibility Text'),
                key: ValueKey<bool>(_visibility),
                visible: _visibility,
              ),
              Opacity(
                opacity: _visibility ? 1.0 : 0.5,
                child: Text("Opacity Text"),
              ),
              Text("Bottom of Visibility"),
              CircleImage(
                size: 40.0,
                imageProvider: AssetImage(CommonUtils.getAssets('avatar')),
              ),
              SizedBox(
                height: 80.0,
                child: PageView(
                  children: <Widget>[
                    Center(
                      child: CircleImage(
                        size: 40.0,
                        imageProvider:
                            AssetImage(CommonUtils.getAssets('avatar')),
                      ),
                    ),
                    Text('aaaaaaaa'),
                  ],
                ),
              ),
              SizedBox(
                height: 80.0,
                child: PageView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Center(
                      child: CircleImage(
                        size: 40.0,
                        imageProvider: AssetImage(CommonUtils.getAssets('avatar')),
                      ),
                    );
                  },
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Hello ',
                  style: Theme.of(context).textTheme.title,
                  children: <TextSpan>[
                    TextSpan(text: 'bold', style: new TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' world!'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 圆形图片
/// ```dart
/// CircleImage(
///  size: 40.0,
///  imageProvider: AssetImage(CommonUtils.getAssets('avatar')),
/// )
/// ```
/// ImageProvider: AssetImage, NetworkImage
class CircleImage extends StatelessWidget {
  final double size;

  final ImageProvider imageProvider;

  const CircleImage({
    Key key,
    @required this.size,
    @required this.imageProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        image: new DecorationImage(fit: BoxFit.fill, image: this.imageProvider),
      ),
    );
  }
}
