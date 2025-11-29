import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repository/otp_repository.dart';
import 'otp_state.dart';

class OtpCubit extends Cubit<OtpState>{
  OtpCubit( this.otpRepository ): super(OTPInitial());
  final OTPRepository otpRepository;

  void verifyOtp(String code) async{
  emit(OTPLoading());
  try{
  final isValid=await otpRepository.verifyOTP(code);
  of(isValid){
    emit(OTPVerified());
  }
  }
  catch(e){

  }
  }

}