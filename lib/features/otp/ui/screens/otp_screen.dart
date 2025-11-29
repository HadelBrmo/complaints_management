import 'package:complaints_management/core/theming/color.dart';
import 'package:complaints_management/features/otp/bussiness_logic/otp_cubit.dart';
import 'package:complaints_management/features/otp/data/repository/otp_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/api_services/api_services.dart';
import 'OtpScreenContent.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final OTPRepository otpRepository = OTPRepositoryImpl(apiService: OTPApiServiceImpl());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: AppColors.background,
      body: BlocProvider(create: (context)=> OtpCubit(otpRepository!),
      child: Center(child: OtpScreenContent()),

      ),

    );
  }
}
