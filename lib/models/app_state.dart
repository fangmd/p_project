import 'package:p_project/models/user_model.dart';

class AppState {
  UserModel user;

  AppState({
    this.user,
  });

  factory AppState.init() => new AppState();

  @override
  String toString() {
    return 'AppState{user: ${user?.userName ?? 'null'}}';
  }
}
