abstract class OTPApiService {
  Future<bool> verifyOTP(String code, String phoneNumber);
  Future<bool> resendOTP(String phoneNumber);
}

class OTPApiServiceImpl implements OTPApiService {
  @override
  Future<bool> verifyOTP(String code, String phoneNumber) async {
    await Future.delayed(const Duration(seconds: 2));

    return code == '123456';
  }

  @override
  Future<bool> resendOTP(String phoneNumber) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
}