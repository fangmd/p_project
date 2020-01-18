import 'package:p_project/common/base/base_vm.dart';

class MainVM extends BaseVM {
  /// 是否显示 更新弹框
  bool showUpgradeDialog = false;
  // AppUpgrade appUpgrade;

  @override
  loadData() {
    // CommonRepository.instance.appUpgrade().then((value) {
    //   if (appUpgrade?.upgradeForce == null) return;
    //   appUpgrade = value.data;
    //   if (appUpgrade?.upgradeForce == AppUpgrade.FORCE ||
    //       appUpgrade?.upgradeForce == AppUpgrade.RECOMMAND) {
    //     showUpgradeDialog = true;
    //     notifyListeners();
    //   }
    // });
    return null;
  }
}
