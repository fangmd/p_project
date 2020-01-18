import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:p_project/styles/colors.dart';

class CachedCircleNetImage extends StatelessWidget {
  final String imgUrl;
  final double width;
  final BoxFit fit;

  const CachedCircleNetImage({
    Key key,
    @required this.imgUrl,
    this.width,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgUrl,
      fit: fit,
      placeholder: (context, str) {
        return Container(
          width: width,
          height: width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: grey_666,
          ),
        );
      },
      imageBuilder: (context, imageProvider) {
        return Container(
          width: width,
          height: width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(fit: this.fit, image: imageProvider),
          ),
        );
      },
    );
  }
}
