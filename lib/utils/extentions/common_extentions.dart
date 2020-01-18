import '../screen_utils.dart';

extension ScreenExtentison on num {
  double dp() {
    return px2dp(this.toDouble());
  }

  double sp() {
    return px2sp(this.toDouble());
  }
}
