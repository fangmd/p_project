import 'package:flutter/material.dart';

import 'bottom_tab_item.dart';

typedef OnTabClick = void Function(int index);

class Item {
  String title;
  String imgDefaultLocalPath;
  String imgSelectedLocalPath;
  bool selected = true;
  bool unRead;

  Item(
      {this.title,
      this.imgDefaultLocalPath,
      this.imgSelectedLocalPath,
      this.unRead = false,
      this.selected});

  String getImgLocalPath() {
    return selected ? this.imgSelectedLocalPath : this.imgDefaultLocalPath;
  }
}

class BottomTab extends StatefulWidget {
  final OnTabClick onTabClick;
  final List<Item> items;

  BottomTab({Key key, this.onTabClick, this.items}) : super(key: key);

  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  List<Widget> _buildItems() {
    List<Widget> widgets = [];
    widget.items.forEach((item) {
      widgets.add(
        Expanded(
          child: InkWell(
              onTap: () {
                widget.onTabClick(widget.items.indexOf(item));
              },
              child: BottomTabItem(item: item)),
        ),
      );
    });
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _buildItems(),
    );
  }
}
