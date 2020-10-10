import 'package:dio/dio.dart';
import 'package:p_project/strings/localization/localizations_utils.dart';
import 'package:p_utils/p_utils.dart';
import '../../c.dart';
import 'http_utils.dart';
import 'package:p_base/p_base.dart';

/// 1. token 快过期时，刷新 token
/// 2. 全局网络错误提示
class RefreshTokenInterceptor extends InterceptorsWrapper {
  /// app 启动一次，允许执行一次刷新token操作，避免死循环
  static bool refresh = true;

  @override
  Future onResponse(Response response) async {
    BaseResponse baseResponse = BaseResponse.fromJson(response.data);
    if (baseResponse.code == HttpCode.updateToken) {
      if (refresh) {
        refresh = false;
        // 更新 totken
        // LoginEntitiyWrapper loginEntityWrapper =
        //     LoginEntitiyWrapper.fromJson(response.data);
        // Http.instance.updateToken(loginEntityWrapper.data.token);
        // Dio dio = await Http.instance.getDio();
        // return dio.request(response.request.path, options: response.request);
      } else {
        // token 刷新失败 TODOLoginOut, router to MainUI
        _loginOut();
      }
    } else if (baseResponse.code == HttpCode.tokenError) {
      // token 失效
      _loginOut();
    } else {
      return response;
    }
  }

  void _loginOut() {
    Logger.d(tag: Tag.HTTP, msg: 'Token Expired, login out');
    // UserModel.instance.loginOut();
  }
}

class ErrorToastInterceptor extends InterceptorsWrapper {
  @override
  Future onError(DioError err) {
    ToastUtils.show(getI18n2().netError);
    return super.onError(err);
  }
}
