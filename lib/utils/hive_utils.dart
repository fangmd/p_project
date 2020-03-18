import 'package:hive/hive.dart';
import 'package:p_project/service/db/settings_dao.dart';
import 'package:p_project/service/db/user_dao.dart';

import 'file_utils.dart';

class HiveUtils {
  static init() async {
    String appPath = await FileUtils.getAppDir();
    Hive.init(appPath);

    await SettingsDao().init();
    await UserDao().init();
  }
}
