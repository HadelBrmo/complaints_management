import 'package:complaints_management/core/theming/color.dart';
import 'package:complaints_management/core/utils/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bussiness_logic/otp_cubit.dart';
import '../../bussiness_logic/otp_state.dart';

class OTPForm extends StatefulWidget {
  const OTPForm({super.key});

  @override
  State<OTPForm> createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  final List<TextEditingController> _controllers =
  List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void initState() {
    super.initState();
    _setupFocusListeners();
  }

  void _setupFocusListeners() {
    for (int i = 0; i < _focusNodes.length; i++) {
      _focusNodes[i].addListener(() {
        if (!_focusNodes[i].hasFocus && _controllers[i].text.isEmpty && i > 0) {
          _focusNodes[i - 1].requestFocus();
        }
      });
    }
  }

  void _onTextChanged(String value, int index) {
    if (value.length == 1 && index < 5) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    if (_isFormComplete()) {
      _verifyOTP();
    }
  }

  bool _isFormComplete() {
    return _controllers.every((controller) => controller.text.isNotEmpty);
  }

  void _verifyOTP() {
    final otpCode = _controllers.map((controller) => controller.text).join();
    context.read<OtpCubit>().verifyOtp(otpCode);
  }

  void clearForm() {
    for (final controller in _controllers) {
      controller.clear();
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpCubit, OtpState>(
      listener: (context, state) {
        if (state is OTPVerified) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('تم التحقق بنجاح!')),
          );
        } else if (state is OTPResent) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('تم إعادة إرسال الكود!')),
          );
        } else if (state is OTPError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      child: Column(
        children: [
          _buildOTPInputFields(),
          SizedBox(height: MediaQueryHelper.hp(context, 0.04)),
          _buildVerifyButton(),
          SizedBox(height: MediaQueryHelper.hp(context, 0.04)),
          Text.rich(
            TextSpan(
              text: 'لم يصلك الرمز؟ ',
              style: TextStyle(
                fontSize: MediaQueryHelper.rs(context, 14, 16, 18),
                color: AppColors.greyDark,
              ),
              children: [
                TextSpan(
                  text: 'اعادة الارسال الاّن ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                    fontSize: MediaQueryHelper.rs(context, 14, 16, 18),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOTPInputFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6, (index) {
        return SizedBox(
          width: MediaQueryHelper.rs(context, 40, 45, 50),
          height: MediaQueryHelper.rs(context, 40, 45, 50),
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: InputDecoration(
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.blue),
              ),
            ),
            onChanged: (value) => _onTextChanged(value, index),
          ),
        );
      }),
    );
  }

  Widget _buildVerifyButton() {
    return BlocBuilder<OtpCubit, OtpState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQueryHelper.wp(context, 0.7),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ElevatedButton(
              onPressed: state is! OTPLoading && _isFormComplete()
                  ? _verifyOTP
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: EdgeInsets.symmetric(
                  vertical: MediaQueryHelper.hp(context, 0.02),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: state is OTPLoading
                  ? SizedBox(
                height: MediaQueryHelper.hp(context, 0.025),
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              )
                  : Text(
                'تأكيد الحساب',
                style: TextStyle(
                  fontSize: MediaQueryHelper.rs(context, 16, 18, 20),
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}