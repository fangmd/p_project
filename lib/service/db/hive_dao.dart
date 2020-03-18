import 'package:hive/hive.dart';

abstract class HiveDao {
  String getBoxName();

  init() {
    Hive.openBox(getBoxName());
  }

  Box _getBox() {
    return Hive.box(getBoxName());
  }

  void set(String key, dynamic value) {
    _getBox().put(key, value);
  }

  dynamic get(String key) {
    return _getBox().get(key);
  }
}
