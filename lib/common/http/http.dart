import 'dart:io' show Platform;
import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:p_project/common/http/refresh_token_interceptor.dart';
import 'package:p_project/utils/app_info.dart';
import 'package:p_project/utils/common_function.dart';
import 'package:p_project/utils/logger.dart';
import '../../c.dart';
import 'loading_interceptor.dart';

class Http {
  static final Http _singleton = Http._internal();

  static Http get instance {
    return _singleton;
  }

  factory Http() {
    return _singleton;
  }

  Http._internal();

  /// 普通请求
  Dio _dio;

  /// 带有 loading 弹框的请求
  Dio _loadingDio;

  /// 带有默认错误提示的请求
  Dio _errorDio;

  Map<String, String> headers = {};

  ///dio 配置
  BaseOptions getCommonOptions(Map<String, dynamic> header) {
    var options = BaseOptions(
      connectTimeout: 3000,
      baseUrl: C.BASE_URL,
      contentType: Headers.formUrlEncodedContentType,
    );
    options.headers.addAll(headers);
    if (header != null) {
      options.headers.addAll(header);
    }
    return options;
  }

  Future<Dio> getErrorDio({Map<String, String> header}) async {
    if (_errorDio == null) {
      await initCommonHeader();
      _errorDio = new Dio(getCommonOptions(header));
      if (isDebug()) {
        _errorDio.interceptors.add(LogInterceptor(
          requestHeader: true,
          requestBody: true,
          responseHeader: false,
          responseBody: true,
        ));
      }

      _errorDio.transformer = FlutterTransformer();

      _errorDio.interceptors.add(RefreshTokenInterceptor());
      _errorDio.interceptors.add(ErrorToastInterceptor());
    }
    return _errorDio;
  }

  Future<Dio> getDio({Map<String, String> header}) async {
    if (_dio == null) {
      await initCommonHeader();
      _dio = new Dio(getCommonOptions(header));
      if (isDebug()) {
        _dio.interceptors.add(LogInterceptor(
          requestHeader: true,
          requestBody: true,
          responseHeader: false,
          responseBody: true,
        ));
      }

      _dio.transformer = FlutterTransformer();

      _dio.interceptors.add(RefreshTokenInterceptor());
      _dio.interceptors.add(ErrorToastInterceptor());
    }
    return _dio;
  }

  Future<Dio> getLoadingDio({Map<String, String> header}) async {
    if (_loadingDio == null) {
      await initCommonHeader();
      _loadingDio = new Dio(getCommonOptions(header));
      if (isDebug()) {
        _loadingDio.interceptors.add(LogInterceptor(
          requestHeader: true,
          requestBody: true,
          responseHeader: false,
          responseBody: true,
        ));
      }

      _loadingDio.transformer = FlutterTransformer();

      _loadingDio.interceptors.add(RefreshTokenInterceptor());
      _loadingDio.interceptors.add(LoadingInterceptor());
    }
    return _loadingDio;
  }

  Future<Dio> getFileUploadDio() async {
    await initCommonHeader();

    final options = getCommonOptions({});
    options.contentType = 'multipart/form-data';
    options.connectTimeout = 10000;
    final _fileDio = new Dio(options);
    _fileDio.interceptors.add(LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
    ));

    _fileDio.transformer = FlutterTransformer();
    _fileDio.interceptors.add(LoadingInterceptor());

    return _fileDio;
  }

  Future updateHeader(String key, String value) async {
    Logger.d(tag: Tag.HTTP, msg: 'update header key$key value:$value');
    headers['key'] = value;
    _dio = null;
    _loadingDio = null;
    _errorDio = null;
  }

  Future initCommonHeader() async {
    headers['Version'] = await AppInfoUtils.getAppVersionName();
    if (Platform.isAndroid) {
      headers['User-Agent'] = 'android';
    } else if (Platform.isIOS) {
      headers['User-Agent'] = 'ios';
    }
    headers['Device-Uuid'] = await AppInfoUtils.getId();
  }
}
