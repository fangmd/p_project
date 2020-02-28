import 'dart:io' show Platform;
import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:p_project/common/http/refresh_token_interceptor.dart';
import 'package:p_project/utils/app_info.dart';
import 'package:p_project/utils/common_function.dart';
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
  Map<String, Dio> _dioMap = {};

  /// 带有 Loading 的请求
  Dio _loadingDio;

  /// 带有自动错误提示的请求
  Dio _errorDio;

  Dio _downloadDio;

  Map<String, String> headers = {};

  ///dio 配置
  BaseOptions getCommonOptions(Map<String, dynamic> header,
      {String url = C.BASE_URL}) {
    var options = BaseOptions(
      connectTimeout: 3000,
      baseUrl: url,
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

  Future<Dio> getDio(
      {String url = C.BASE_URL, Map<String, String> header}) async {
    Dio dio = _dioMap[url];
    if (dio == null) {
      await initCommonHeader();
      dio = new Dio(getCommonOptions(header, url: url));
      if (isDebug()) {
        dio.interceptors.add(LogInterceptor(
          requestHeader: true,
          requestBody: true,
          responseHeader: false,
          responseBody: true,
        ));
      }

      dio.transformer = FlutterTransformer();

      dio.interceptors.add(RefreshTokenInterceptor());
      dio.interceptors.add(ErrorToastInterceptor());
      _dioMap[url] = dio;
    }
    return dio;
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

  Future<Dio> getDownloadDio({Map<String, String> header}) async {
    if (_downloadDio == null) {
      await initCommonHeader();
      _downloadDio = new Dio(getCommonOptions(header));
      if (isDebug()) {
        _downloadDio.interceptors.add(LogInterceptor(
          requestHeader: true,
          requestBody: true,
          responseHeader: false,
          responseBody: true,
        ));
      }
    }
    return _downloadDio;
  }

  Future<Dio> getFileUploadDio() async {
    await initCommonHeader();
    String time = '${DateTime.now().millisecondsSinceEpoch}';
    String lang = headers['Lang'];
    String auth = headers['Authorization'];
    List<String> list = [time, lang, auth, 'taurus future'];
    list.sort();
    String combian = '';
    for (var i in list) {
      combian = combian + i;
    }
    // String api = generateMd5(combian);
    final options = getCommonOptions(
      {
        'Timestamp': time,
        // 'Api': api,
      },
    );
    // options.baseUrl = C.IMG_UPLOAD_BASE_URL;
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

  void changeHeader(String key, String value) {
    headers[key] = value;
    _dioMap.clear();
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
