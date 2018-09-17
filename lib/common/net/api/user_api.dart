import 'package:p_project/common/net/http_manager.dart';

class UserApi {
  static getUserInfo(String userId) async {
    var url =
        'https://raw.githubusercontent.com/fangmd/markdownphoto/master/user#';

    var result = await HttpManager.get(url, null, null);
  }
}
