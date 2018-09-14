import 'package:p_project/models/user_model.dart';

class AppState {
  bool isLoading;
  UserModel user;

  AppState({
    this.isLoading = false,
    this.user,
  });

  factory AppState.loading() => new AppState(isLoading: true);

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, user: ${user?.userName ?? 'null'}}';
  }
}
