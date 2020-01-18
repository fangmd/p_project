import 'package:provider/provider.dart';

class StoreUtils {
  /// 获取状态数据， Provider.of
  static T value<T>(context) {
    return Provider.of(context);
  }

  /// 通过Consumer获取状态数据
  static Consumer connect<T>({builder, child}) {
    return Consumer<T>(builder: builder, child: child);
  }
}
