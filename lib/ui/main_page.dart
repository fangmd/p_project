import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p_project/common/base/base_page.dart';
import 'package:p_project/store/provider_widget.dart';
import 'package:p_project/styles/colors.dart';
import 'package:p_project/utils/logger.dart';
import 'package:p_project/widget/tab/bottom_tab.dart';
import 'home/home_page.dart';
import 'main_vm.dart';
import 'mine/mine_page.dart';
import 'msg/msg_page.dart';

class MainPage extends BasePage {
  static const String routeName = '/main';

  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();

  @override
  String getPageName() {
    return MainPage.routeName;
  }
}

class _MainPageState extends BasePageState<MainPage>
    with SingleTickerProviderStateMixin, RouteAware {
  List<Item> _items;
  int _tabIndex = 0;
  List<Widget> _tagWidgets = [
    HomePage(),
    MsgPage(),
    MinePage(),
  ];

  TabController _controller;
  MainVM _mainVm = MainVM();

  @override
  void initState() {
    _controller = TabController(vsync: this, length: 3);
    _controller.addListener(() {
      _onTapped(_controller.index);
    });
    super.initState();

    var sTimer = Timer(Duration(milliseconds: 5000), () {
      Logger.d(msg: 'IM State Change:');
    });
    sTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    _buildItems(context);
    return ProviderWidget(
      model: _mainVm,
      onModelReady: (_) {
        _mainVm.loadData();
      },
      builder: (context, _, __) {
        _showUpgradeDialog();
        return Scaffold(
          backgroundColor: page_bg,
          body: SafeArea(
            top: false,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: TabBarView(
                    controller: _controller,
                    children: _tagWidgets,
                  ),
                ),
                BottomTab(
                  items: _items,
                  onTabClick: _onTapped,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showUpgradeDialog() {
    // if (!_mainVm.showUpgradeDialog) return;
    // _mainVm.showUpgradeDialog = false;
    // final content = _mainVm.appUpgrade?.upgradeContent ?? '';
    // final title =
    //     '${getI18n2().appUpgradeTitle}(${_mainVm.appUpgrade?.upgradeVersion ?? ''})';
    // final force = _mainVm.appUpgrade?.upgradeForce == AppUpgrade.FORCE;
    // final url = _mainVm.appUpgrade?.upgradeUrl ?? '';

    // // final content = '1. 升级包更新内容升级包更新\r\n 2.内容升级包更新内容升级包更新内容升级包更新内容升级包更新内容';
    // // final title = '${getI18n2().appUpgradeTitle}(v1.2.2)';
    // // final force = true;
    // // final url = 'https://baidu.com';

    // List<Widget> btn = [
    //   FlatButton(
    //     onPressed: () {
    //       if (DeviceInfoUtils.isIOS()) {
    //         // 打开 AppStore
    //         openMarket();
    //       } else if (DeviceInfoUtils.isAndroid()) {
    //         // open url
    //         openUrlOutSide(url);
    //       }
    //       Navigator.of(context).pop();
    //     },
    //     child: Text(getI18n2().confirm),
    //   ),
    // ];
    // if (!force) {
    //   btn.add(FlatButton(
    //     onPressed: () {
    //       Navigator.of(context).pop();
    //     },
    //     child: Text(getI18n2().cancel),
    //   ));
    // }

    // Future.delayed(Duration(microseconds: 800), () {
    //   showDialog(
    //       context: context,
    //       barrierDismissible: false,
    //       builder: (context) {
    //         return AlertDialog(
    //           title: Text(title),
    //           content: Text(content),
    //           actions: btn,
    //         );
    //       });
    // });
  }

  void _buildItems(BuildContext context) {
    _items = <Item>[
      Item(
        title: 'Home',
        imgDefaultLocalPath: "assets/images/main/home_default.png",
        imgSelectedLocalPath: "assets/images/main/home_selected.png",
        selected: _tabIndex == 0,
      ),
      Item(
        title: 'Msg',
        imgDefaultLocalPath: "assets/images/main/msg_default.png",
        imgSelectedLocalPath: "assets/images/main/msg_selected.png",
        selected: _tabIndex == 1,
      ),
      Item(
        title: 'Mine',
        imgDefaultLocalPath: "assets/images/main/mine_default.png",
        imgSelectedLocalPath: "assets/images/main/mine_selected.png",
        selected: _tabIndex == 2,
      )
    ];
  }

  void _onTapped(int value) {
    setState(() {
      _tabIndex = value;
    });
    _controller.index = value;
  }

  String getName(int index) {
    if (index == 0) {
      return HomePage.routeName;
    } else if (index == 1) {
      return MsgPage.routeName;
    } else if (index == 2) {
      return MinePage.routeName;
    }
    return '';
  }

  void _sendCurrentTabToAnalytics() {
    // FirebaseUtils.observer.analytics.setCurrentScreen(
    //   screenName: getName(_tabIndex),
    // );
  }

  @override
  void didPush() {
    _sendCurrentTabToAnalytics();
  }

  @override
  void didPopNext() {
    _sendCurrentTabToAnalytics();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // FirebaseUtils.observer.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    _controller.dispose();
    // FirebaseUtils.observer.unsubscribe(this);
    super.dispose();
  }
}