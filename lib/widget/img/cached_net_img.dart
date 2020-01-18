import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:p_project/styles/colors.dart';

/// 网络图片加载控件
class CachedNetImg extends StatelessWidget {
  final String imgUrl;
  final double width;
  final double height;
  final BoxFit fit;
  final Color placeHolderColor;

  const CachedNetImg({
    Key key,
    @required this.imgUrl,
    this.width,
    this.height,
    this.fit,
    this.placeHolderColor = grey_666,
  })  : assert(imgUrl != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CachedNetworkImage(
        imageUrl: imgUrl ?? '',
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, _) {
          return Container(
            color: placeHolderColor,
          );
        },
      ),
    );
  }
}

/// 网络图片加载控件
class CachedRoundImg extends StatelessWidget {
  final String imgUrl;
  final double width;
  final double height;
  final BoxFit fit;
  final double radius;

  const CachedRoundImg({
    Key key,
    @required this.imgUrl,
    this.width,
    this.height,
    this.fit,
    this.radius = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: CachedNetworkImage(
        imageUrl: imgUrl,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
