import 'dart:async';

import 'package:p_project/common/net/api/user_api.dart';

class UserModel {
  String userName, image;

  UserModel(this.userName, this.image);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    json = json['results'][0];
    String name = json['name']['first'] + " " + json['name']['last'];
    String image = json['picture']['large'];

    return UserModel(name, image);
  }

  static Future<UserModel> getUser() async{
    return await UserApi.getUserInfo2();
  }
}
