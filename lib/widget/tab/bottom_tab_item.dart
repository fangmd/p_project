import 'package:flutter/material.dart';
import 'package:p_project/styles/colors.dart';
import 'package:p_project/styles/text.dart';
import '../simple_widget.dart';
import 'bottom_tab.dart';
import 'package:p_project/utils/extentions/common_extentions.dart';

class BottomTabItem extends StatefulWidget {
  final Item item;
  final bool showUnRead;
  BottomTabItem({
    Key key,
    this.item,
    this.showUnRead = false,
  }) : super(key: key);

  @override
  _BottomTabItemState createState() => _BottomTabItemState();
}

class _BottomTabItemState extends State<BottomTabItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.dp(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset(
                widget.item.getImgLocalPath(),
                width: 44.dp(),
                height: 44.dp(),
                fit: BoxFit.contain,
              ),
              Visibility(
                visible: widget.item.unRead,
                child: Positioned(
                  top: 0,
                  right: 0,
                  child: circleWidget(
                    width: 20.dp(),
                    height: 20.dp(),
                    color: red1,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 3),
          Text(widget.item.title,
              style: widget.item.selected
                  ? AppTheme.adHomeTabSelected
                  : AppTheme.adHomeTabDefault)
        ],
      ),
    );
  }
}
