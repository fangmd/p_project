import 'dart:io';
import 'package:filesize/filesize.dart';
import 'package:path_provider/path_provider.dart';

class FileManager {
  static Future<String> getImgCachePath() async {
    Directory tempDir = await getTemporaryDirectory();
    // String path = join(tempDir.path, 'imgCache');
    // File cachedImgDir = File(path);
    // if (!await cachedImgDir.exists()) {
    //   await cachedImgDir.create(recursive: true);
    // }
    return tempDir.path;
  }

  static Future<String> getCachePath() async {
    Directory tempDir = await getTemporaryDirectory();
    // String path = join(tempDir.path, 'imgCache');
    // File cachedImgDir = File(path);
    // if (!await cachedImgDir.exists()) {
    //   await cachedImgDir.create(recursive: true);
    // }
    return tempDir.path;
  }

  static Future<String> getFileSizeFriendly() async {
    int sum = await getFileSize();
    return filesize(sum, 0);
  }

  static Future<int> getFileSize() async {
    Directory cacheDir = await getTemporaryDirectory();
    if (!await cacheDir.exists()) return 0;
    List<FileSystemEntity> files = cacheDir.listSync(recursive: true);
    int sum = 0;
    for (var i in files) {
      bool isFile = await FileSystemEntity.isFile(i.path);
      if (isFile) {
        final f = File(i.path);
        sum += await f.length();
      }
    }
    return sum;
  }

  static Future<bool> clearCachedFile() async {
    Directory cacheDir = await getTemporaryDirectory();
    await cacheDir.delete(recursive: true);
    return true;
  }
}
