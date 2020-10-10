/// 校验验证码
bool verifyVerifyCode(String verifyCode) {
  if (verifyCode == null) {
    return false;
  }
  return verifyCode.isNotEmpty;
}
