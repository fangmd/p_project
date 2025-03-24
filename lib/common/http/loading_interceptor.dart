import 'package:dio/dio.dart';
import 'package:p_widget/p_widget.dart';

/// 1. 网络请求添加 loading 动画
class LoadingInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    GlobalLoading.showLoading();
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    GlobalLoading.hideLoading();
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    GlobalLoading.hideLoading();
    super.onError(err, handler);
  }
}
