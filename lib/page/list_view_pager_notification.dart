import 'dart:async';

import 'package:flutter/material.dart';
import 'package:p_project/common/utils/log.dart';

///
/// ListView 基本使用
/// 原生控件 RefreshIndicator 实现下拉刷新
/// 使用 ScrollController 实现 上拉加载（推荐）
/// 上拉加载方案二：NotificationListener, 加载更多会多次调用需要过滤
class ListViewPage2 extends StatefulWidget {
  static String routeName = '/';

  @override
  State<StatefulWidget> createState() {
    return _ListViewPage2State();
  }
}

class _ListViewPage2State extends State<ListViewPage2> {
  @override
  void initState() {
//    initScrollController();
    super.initState();
  }

  @override
  void dispose() {
//    _scrollController.removeListener(_handleScroll);
//    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo){
              if (scrollInfo.metrics.pixels ==
                  scrollInfo.metrics.maxScrollExtent) {
                _getMoreData();
              }
            },
            child: ListView.builder(
              itemBuilder: buildItem,
              itemCount: 30,
//              controller: _scrollController,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildItem(context, index) {
    return Column(
      children: <Widget>[
        Text('$index'),
        Text('$index'),
      ],
    );
  }

  Future<void> _handleRefresh() async {
    Log.d(message: 'refresh');
    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        return null;
      });
    });
  }

//  ScrollController _scrollController = new ScrollController();
//
//  void _handleScroll() {
//    if (_scrollController.position.pixels ==
//        _scrollController.position.maxScrollExtent) {
//      _getMoreData();
//    }
//  }
//
//  void initScrollController() {
//    _scrollController.addListener(_handleScroll);
//  }

  void _getMoreData() {
    Log.d(message: 'loadMore');
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        return null;
      });
    });
  }
}
