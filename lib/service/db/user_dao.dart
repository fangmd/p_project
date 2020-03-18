import 'hive_dao.dart';

class UserDao extends HiveDao {
  @override
  String getBoxName() {
    return 'user';
  }
}
