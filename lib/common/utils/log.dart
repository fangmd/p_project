import 'package:logging/logging.dart';
import 'package:p_project/common/c.dart';

class Log {
  static final Logger log = new Logger('Log');

  static bool needInit = true;

  static const String TAG = 'App';

  static d({String tag = TAG, String message}) {
    init();
    log.fine('$tag ====> $message');
  }

  static w({String tag = TAG, String message}) {
    init();
    log.warning('$tag ====> $message');
  }

  static e({String tag = TAG, String message}) {
    init();
    log.severe('$tag ====> $message');
  }

  static void init() {
    if (needInit && C.isDebug()) {
      needInit = false;
      Logger.root.level = Level.ALL;
      Logger.root.onRecord.listen((LogRecord rec) {
        print('${rec.level.name}: ${rec.time}: ${rec.message}');
      });
    }
  }
}
