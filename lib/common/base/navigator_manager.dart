import 'package:p_project/utils/analytics/analytics.dart';

import 'base_page.dart';

///这个管理类，只是标记 当前 按照顺序放入和移除栈名称，并不是页面跳转后退 的功能， 只是方便 推算、表示生命周期方法
class NavigatorManger {
  List<BasePageState> _activityStack = new List<BasePageState>();

  NavigatorManger._internal();

  static NavigatorManger _singleton = new NavigatorManger._internal();

  factory NavigatorManger() => _singleton;

  void addWidget(BasePageState widgetName) {
    _activityStack.add(widgetName);

    // sec endPage
    AnalyticsUtils.endPage(getSecondTop()?.widget?.getPageName());
    // first beginPage
    AnalyticsUtils.beginPage(getTop()?.widget?.getPageName());
  }

  void removeWidget(BasePageState widgetName) {
    // first endPage
    AnalyticsUtils.endPage(widgetName?.widget?.getPageName());
    // sec beginPage
    AnalyticsUtils.beginPage(getSecondTop()?.widget?.getPageName());

    _activityStack.remove(widgetName);
  }

  BasePageState getSecondTop() {
    if (_activityStack == null) return null;
    try {
      return _activityStack[_activityStack.length - 2];
    } catch (exception) {
      return null;
    }
  }

  BasePageState getTop() {
    if (_activityStack == null) return null;
    try {
      return _activityStack[_activityStack.length - 1];
    } catch (exception) {
      return null;
    }
  }

  bool isTopPage(BasePageState widgetName) {
    if (_activityStack == null) return false;
    try {
      return widgetName.widget.getPageName() ==
          _activityStack[_activityStack.length - 1]?.widget?.getPageName();
    } catch (exception) {
      return false;
    }
  }

  bool isSecondTop(BasePageState widgetName) {
    if (_activityStack == null) return false;
    try {
      return widgetName.widget.getPageName() ==
          _activityStack[_activityStack.length - 2]?.widget?.getPageName();
    } catch (exception) {
      return false;
    }
  }
}
