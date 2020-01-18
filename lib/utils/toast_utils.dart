
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  static void show(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
    );
  }
}
