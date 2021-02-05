enum UserRole { normal, admin }

///
///```Dart
///final a = UserRoleExtension.fromInt(1);
///final i = UserRole.admin.toInt();
///```
extension UserRoleExtension on UserRole {
  int toInt() {
    switch (this) {
      case UserRole.normal:
        return 1;
        break;
      case UserRole.admin:
        return 2;
        break;
    }
    return 1;
  }

  static UserRole fromInt(int i) {
    switch (i) {
      case 1:
        return UserRole.normal;
        break;
      case 2:
        return UserRole.admin;
        break;
    }
    return UserRole.normal;
  }
}
