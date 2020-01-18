import 'package:p_project/common/http/http_utils.dart';

extension HttpExtentison on int {
  bool httpSuccess() {
    return this == HttpCode.success;
  }
}
