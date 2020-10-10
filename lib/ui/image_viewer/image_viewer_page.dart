import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p_project/common/base/base_page.dart';
import 'package:p_project/router/router.dart';
import 'package:p_project/widget/img_viewer/image_viewer.dart';
import 'package:p_project/widget/route/fade_route.dart';
import 'package:photo_view/photo_view.dart';
import 'package:screen_adaptation/screen_extension.dart';
import '../../mock.dart';

/// 图片游览功能 Demo
class ImageViewerPage extends BasePage {
  static const routeName = '/image_viewer';

  ImageViewerPage({Key key}) : super(key: key);

  @override
  _ImageViewerPageState createState() => _ImageViewerPageState();

  @override
  String getPageName() {
    return ImageViewerPage.routeName;
  }
}

class _ImageViewerPageState extends BasePageState<ImageViewerPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text('ImageViewerDemo'),
            ImgHero(
              imgUrl: ImageMock.bigImg,
              heroAttributes: const PhotoViewHeroAttributes(
                tag: '123',
                transitionOnUserGestures: true,
              ),
              onTap: () {
                RouterUtils.pushWithRoute(
                  context,
                  FadeRoute(
                      child: ImageViewer(
                    imgUrl: ImageMock.bigImg,
                    heroAttributes: const PhotoViewHeroAttributes(
                      tag: '123',
                      transitionOnUserGestures: true,
                    ),
                  )),
                );
              },
              width: 200.dp,
              height: 400.dp,
              fit: BoxFit.contain,
            ),
            ImgHero(
              imgUrl: ImageMock.smallImg,
              heroAttributes: const PhotoViewHeroAttributes(
                tag: '12',
                transitionOnUserGestures: true,
              ),
              onTap: () {
                RouterUtils.pushWithRoute(
                  context,
                  FadeRoute(
                      child: ImageViewer(
                    imgUrl: ImageMock.smallImg,
                    heroAttributes: const PhotoViewHeroAttributes(
                      tag: '12',
                      transitionOnUserGestures: true,
                    ),
                  )),
                );
              },
              width: 200.dp,
              height: 400.dp,
              fit: BoxFit.contain,
            ),
            ImgHero(
              imgUrl: ImageMock.bigHorizontalImg,
              heroAttributes: const PhotoViewHeroAttributes(
                tag: '13',
                transitionOnUserGestures: true,
              ),
              onTap: () {
                RouterUtils.pushWithRoute(
                  context,
                  FadeRoute(
                      child: ImageViewer(
                    imgUrl: ImageMock.bigHorizontalImg,
                    heroAttributes: const PhotoViewHeroAttributes(
                      tag: '13',
                      transitionOnUserGestures: true,
                    ),
                  )),
                );
              },
              width: 200.dp,
              height: 400.dp,
              fit: BoxFit.contain,
            )
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
}
