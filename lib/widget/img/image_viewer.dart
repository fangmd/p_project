import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:p_project/widget/top_nav/top_nav.dart';
import 'package:photo_view/photo_view.dart';

const HERO_TAG = 'ImageViewer-Hero';

class ImgHero extends StatelessWidget {
  final minScale;
  static const maxScale = 3.0;
  const ImgHero({Key key, this.imgUrl, this.onTap, this.minScale})
      : super(key: key);

  final String imgUrl;
  final VoidCallback onTap;

  Widget build(BuildContext context) {
    return Hero(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: CachedNetworkImage(imageUrl: imgUrl),
        ),
      ),
      tag: HERO_TAG,
    );
  }
}

class PhotoHero extends StatelessWidget {
  final minScale;
  static const maxScale = 3.0;
  const PhotoHero({Key key, this.imgUrl, this.onTap, this.minScale})
      : super(key: key);

  final String imgUrl;
  final VoidCallback onTap;

  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: CachedNetworkImage(
          imageUrl: imgUrl,
          imageBuilder: (context, imageProvider) => PhotoView(
            imageProvider: imageProvider,
            // loadingChild: loadingChild,
            // backgroundDecoration: backgroundDecoration,
            minScale: minScale,
            maxScale: maxScale,
            heroAttributes: const PhotoViewHeroAttributes(tag: HERO_TAG),
          ),
        ),
      ),
    );
  }
}

class ImageViewer extends StatefulWidget {
  final String imgUrl;
  ImageViewer({Key key, this.imgUrl}) : super(key: key);

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: double.infinity,
                // color: Colors.red,
                alignment: Alignment.center,
                child: PhotoHero(
                  imgUrl: widget.imgUrl,
                  minScale: 0.2,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              TopNav(),
            ],
          ),
        ),
      ),
    );
  }
}
