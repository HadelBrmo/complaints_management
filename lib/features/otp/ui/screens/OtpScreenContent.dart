import 'package:complaints_management/core/theming/color.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/media_query_helper.dart';
import '../widget/otp_form.dart';
import '../widget/otp_header.dart';

class OtpScreenContent extends StatelessWidget {
  const OtpScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQueryHelper.wp(context, 0.04),
          vertical: MediaQueryHelper.isPortrait(context)
              ? MediaQueryHelper.hp(context, 0.13)
              : MediaQueryHelper.hp(context, 0.02),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.verified_user_outlined,
              size: MediaQueryHelper.isPortrait(context)
                  ? MediaQueryHelper.rs(context, 80, 90, 100)
                  : MediaQueryHelper.rs(context, 60, 70, 80),
              color: AppColors.primary,
            ),
            SizedBox(height: MediaQueryHelper.hp(context, 0.06)),
            OTPHeader(),
            SizedBox(height: MediaQueryHelper.hp(context, 0.06)),
            Expanded(
              child: SingleChildScrollView(
                child: OTPForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

