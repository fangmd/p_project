import 'dart:io';

import 'package:dio/dio.dart';
import 'package:p_project/common/http/http.dart';

class FileService {
  /// 适合 下载小文件 200M 以下
  static Future download(
    String url,
    String savePath, {
    ProgressCallback onReceiveProgress,
    CancelToken cancelToken,
  }) async {
    final dio = await Http.instance.getDownloadDio();
    try {
      Response response = await dio.get(
        url,
        onReceiveProgress: onReceiveProgress,
        cancelToken: cancelToken,
        // Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: 0),
      );
      print(response.headers);
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print(e);
    }
  }
}
