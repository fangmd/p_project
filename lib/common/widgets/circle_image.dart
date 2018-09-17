import 'package:flutter/material.dart';

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
