import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_crop/image_crop.dart';
import 'package:p_img_compress/p_img_compress.dart';
import 'package:p_project/strings/localization/localizations_utils.dart';
import 'package:p_project/styles/colors.dart';
import 'package:p_utils/p_utils.dart';
import '../../c.dart';
import 'package:p_widget/p_widget.dart';

/// 图片剪切
class CropImageRoute extends StatefulWidget {
  CropImageRoute(this.image);

  File image; //原始图片路径

  @override
  _CropImageRouteState createState() => new _CropImageRouteState();
}

class _CropImageRouteState extends State<CropImageRoute> {
  // double baseLeft; //图片左上角的x坐标
  // double baseTop; //图片左上角的y坐标
  // double imageWidth; //图片宽度，缩放后会变化
  // double imageScale = 1; //图片缩放比例
  // Image imageView;

  final cropKey = GlobalKey<CropState>();

  bool _showLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black1,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: ScreenUtil.screenHeight * 0.3,
                child: Crop.file(
                  widget.image,
                  key: cropKey,
                  aspectRatio: 1.0,
                  alwaysShowGrid: true,
                ),
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () {
                  try {
                    setState(() {
                      _showLoading = true;
                    });
                    _crop(widget.image);
                  } catch (e) {
                    if (!mounted) return;
                    Navigator.pop(context, null);
                  }
                },
                child: Text(getI18n(context).confirm),
              ),
            ],
          ),
          Visibility(
            visible: _showLoading,
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: trans_4dfff,
                ),
                Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: SpinKitCircle(
                      color: black1,
                      size: 40.0,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _crop(File originalFile) async {
    final crop = cropKey.currentState;
    final area = crop.area;
    if (area == null) {
      //裁剪结果为空
      Logger.d(tag: Tag.CROP, msg: 'fail, area == null');
      Navigator.pop(context);
    }
    bool permission = await ImageCrop.requestPermissions();
    if (permission) {
      File cropedImg = await ImageCrop.cropImage(
        file: originalFile,
        area: crop.area,
      );
      final filePath =
          await ImageCompress.compressImg(cropedImg, loading: false);
      Navigator.pop(context, filePath);
    } else {
      Logger.d(tag: Tag.CROP, msg: 'no permission, return originalFile');
      Navigator.pop(context, originalFile);
    }
  }
}
