import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:p_utils/p_utils.dart';
import 'package:photo_view/photo_view.dart';

class ImgHero extends StatelessWidget {
  final double width;
  final double height;
  final BoxFit fit;
  final String imgUrl;
  final VoidCallback onTap;
  final PhotoViewHeroAttributes heroAttributes;

  const ImgHero({
    Key key,
    @required this.imgUrl,
    this.onTap,
    this.width,
    this.height,
    this.fit,
    this.heroAttributes,
  }) : super(key: key);

  Widget build(BuildContext context) {
    if (heroAttributes == null) {
      return _buildImg();
    } else {
      return Hero(
        child: Material(
          color: Colors.transparent,
          child: _buildImg(),
        ),
        tag: heroAttributes.tag,
        transitionOnUserGestures:
            heroAttributes?.transitionOnUserGestures ?? false,
      );
    }
  }

  InkWell _buildImg() {
    return InkWell(
      onTap: onTap,
      child: CachedNetworkImage(
        imageUrl: imgUrl,
        height: height,
        width: width,
        fit: fit,
      ),
    );
  }
}

class PhotoHero extends StatelessWidget {
  PhotoHero({
    Key key,
    this.imgUrl,
    this.onTap,
    this.minScale,
    this.guestureBack = false,
    this.heroAttributes,
  }) : super(key: key);

  final minScale;
  static const maxScale = 3.0;
  final guestureBack;
  final String imgUrl;
  final VoidCallback onTap;
  final PhotoViewHeroAttributes heroAttributes;

  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CachedNetworkImage(
        imageUrl: imgUrl,
        imageBuilder: (context, imageProvider) => guestureBack
            ? _buildGuestureBackPhotoView(imageProvider)
            : _buildPhotoView(imageProvider),
      ),
    );
  }

  Widget _buildPhotoView(ImageProvider imageProvider) {
    return PhotoView(
      imageProvider: imageProvider,
      minScale: minScale,
      maxScale: maxScale,
      heroAttributes: this.heroAttributes,
      tightMode: true,
    );
  }

  Widget _buildGuestureBackPhotoView(ImageProvider imageProvider) {
    return PhotoViewGestureDetectorScope(
      child: _buildPhotoView(imageProvider),
      axis: Axis.horizontal,
    );
  }
}

/// 图片展示页面
class ImageViewer extends StatefulWidget {
  final String imgUrl;
  final PhotoViewHeroAttributes heroAttributes;
  final double minScale;

  /// 是否支持手势返回(类似微信)
  final bool guestureBack;
  ImageViewer({
    Key key,
    this.imgUrl,
    this.guestureBack = true,
    this.minScale = 0.2,
    @required this.heroAttributes,
  }) : super(key: key);

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  /// 页面背景色透明度
  Color _alpha = Colors.black;
  double _dy = 0.0;
  double _dx = 0.0;
  double _downX = 0.0;

  @override
  Widget build(BuildContext context) {
    //Color.fromARGB(100, 0, 0, 0)
    return Opacity(
      opacity: 0.5,
      child: Material(
        color: Colors.blue,
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    final matrix = Matrix4.identity()..translate(_dx, _dy);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onVerticalDragDown: (DragDownDetails d) {
        _downX = d.globalPosition.dx;
      },
      onVerticalDragUpdate: (DragUpdateDetails d) {
        final dy = d.delta.dy;
        final dx = d.globalPosition.dx - _downX;
        setState(() {
          _dy += dy;
          _dx = dx;
        });
        Logger.d(msg: 'dy:$dy dx:$dx');
      },
      onVerticalDragEnd: (DragEndDetails dragEndDetails) {
        
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Transform(
          transform: matrix,
          alignment: Alignment.center,
          child: PhotoHero(
            heroAttributes: widget.heroAttributes,
            imgUrl: widget.imgUrl,
            guestureBack: widget.guestureBack,
            minScale: widget.minScale,
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}
