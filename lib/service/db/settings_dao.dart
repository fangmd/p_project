import 'hive_dao.dart';

class SettingsDao extends HiveDao {
  @override
  String getBoxName() {
    return 'settings';
  }
}
