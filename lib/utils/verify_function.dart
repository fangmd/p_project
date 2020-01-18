/// 校验密码 6~16位数字和字符组合
bool verifyPwd(String input) {
  RegExp mobile = new RegExp(r"(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$");
  return mobile.hasMatch(input);
}

/// 校验验证码
bool verifyVerifyCode(String verifyCode) {
  if (verifyCode == null) {
    return false;
  }
  return verifyCode.isNotEmpty;
}

/// String 长度校验
bool verifyStringLength(String content, int min, {int max = 10000}) {
  if (content == null || content.isEmpty) {
    return false;
  }
  return content.length >= min && content.length <= max;
}
