import 'dart:convert';

import 'package:p_project/common/net/http_manager.dart';
import 'package:p_project/models/user_model.dart';

class UserApi {
  static getUserInfo(String userId) async {
    var url =
        'https://raw.githubusercontent.com/fangmd/markdownphoto/master/user#';

    var result = await HttpManager.get(url, {'userid': userId}, null);
  }

  static getUserInfo2() async {
    var url = 'https://randomuser.me/api/';
    final response = await HttpManager.get(url, null, null);
    return UserModel.fromJson(response.data);
  }
}
