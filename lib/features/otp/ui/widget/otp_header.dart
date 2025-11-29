import 'package:complaints_management/core/theming/color.dart';
import 'package:complaints_management/core/utils/media_query_helper.dart';
import 'package:flutter/material.dart';

class OTPHeader extends StatelessWidget {
  const OTPHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'تأكيد الحساب',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: MediaQueryHelper.hp(context, 0.02)),
          Text(
            'تم ارسال رمز التحقق الى رقمك',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: MediaQueryHelper.hp(context, 0.02)),
          Text(
            '09876543432',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: MediaQueryHelper.hp(context, 0.020)),
          Text(
            'أدخل الرمز المكون من 6 أرقام المرسل إلى هاتفك',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}