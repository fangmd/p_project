import 'dart:async';

import 'package:dio/dio.dart';
import 'package:p_project/common/common_utils.dart';
import 'package:p_project/common/net/api/api_c.dart';
import 'package:p_project/common/net/base_response.dart';
import 'package:p_project/common/net/net_code.dart';
import 'package:p_project/common/utils/log.dart';

class HttpManager {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  /// 获取请求配置
  static Options getCommonOptions(Map<String, String> header) {
    var options = Options(
      method: 'get',
      connectTimeout: 15000,
      baseUrl: BASE_URL,
    );
    options.headers.addAll({
      "clienttype": 'ANDROID',
    });
    if (header != null) {
      options.headers.addAll(header);
    }

    return options;
  }

  ///发起网络请求
  ///[ url] 请求url
  ///[ params] 请求参数
  ///[ header] 外加头
  ///[ option] 配置
  static Future<BaseResponse> get(url, params, Map<String, String> header) async {
    // check net
    var netConnected = await CommonUtils.netConnected();
    if (!netConnected) {
      return BaseResponse(code: NETWORK_ERROR, msg: '当前无网络');
    }

    // header
    Options options = getCommonOptions(header);

    Dio dio = Dio();
    Response response;
    try {
      response = await dio.request(url, data: params, options: options);
    } on DioError catch (e) {
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = Response(statusCode: 666);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = NETWORK_TIMEOUT;
      }

      Log.e(tag: NET_TAG, message: "url $url ${e.toString()}");

      return BaseResponse(code: errorResponse.statusCode, msg: 'fail');
    }

    Log.d(
        tag: NET_TAG,
        message: "url $url \r\n "
            "headers: ${options.headers.toString()} \r\n"
            "params: ${params.toString()} \r\n"
            "response: ${response.toString()}");

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return BaseResponse(data: response.data, code: SUCCESS);
      }
    } catch (e) {
      Log.e(tag: NET_TAG, message: "url $url ${e.toString()}");
      return BaseResponse(data: response.data, code: response.statusCode);
    }
    return BaseResponse(code: response.statusCode, msg: 'fail');
  }
}
