import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileUtils {
  static Future<String> getAppDir() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    return appDocDir.path;
  }
}
