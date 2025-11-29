import 'package:complaints_management/features/otp/data/api_services/api_services.dart';

abstract class OTPRepository {
  Future<bool> verifyOTP(String code);

  Future<bool> resendOTP();
}

class OTPRepositoryImpl implements OTPRepository {
  late final OTPApiService apiService;
  OTPRepositoryImpl({required this.apiService});
  @override
  Future<bool> resendOTP() {
    // TODO: implement resendOTP
    throw UnimplementedError();
  }

  @override
  Future<bool> verifyOTP(String code) async {
   try{
    final String phoneNumber=" ";
    return await apiService.verifyOTP(code, phoneNumber);
   }
   catch(e){
     throw Exception('فشل التحقق:  ${e.toString()}');
   }
  }

}
