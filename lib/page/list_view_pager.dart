import 'dart:async';

import 'package:flutter/material.dart';
import 'package:p_project/common/utils/log.dart';

class ListViewPage extends StatefulWidget {
  static String routeName = '/';

  @override
  State<StatefulWidget> createState() {
    return _ListViewPageState();
  }
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  void initState() {
    initScrollController();
    super.initState();
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
          child: ListView.builder(
            itemBuilder: buildItem,
            itemCount: 30,
            controller: _scrollController,
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

  ScrollController _scrollController = new ScrollController();

  void initScrollController() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  void _getMoreData() {
    Log.d(message: 'loadMore');
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        return null;
      });
    });
  }
}
