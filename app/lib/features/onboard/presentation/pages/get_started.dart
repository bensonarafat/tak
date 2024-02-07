import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tak/core/constants/assets.dart';
import 'package:tak/core/widgets/tak_along_or_text.dart';
import 'package:tak/core/widgets/tak_social_buttons.dart';
import 'package:tak/features/onboard/presentation/widgets/onboard_get_started_text.dart';
import 'package:tak/features/onboard/presentation/widgets/onboard_login_button.dart';
import 'package:tak/features/onboard/presentation/widgets/onboard_sign_up_button.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 135.h,
              ),
              child: Image.asset(
                getStarted,
                fit: BoxFit.contain,
                width: 361.w,
                height: 201.h,
              ),
            ),
            const OnboardGetStartedText(),
            const OnBoardLoginButton(),
            const OnboardSignUpButton(),
            const OrText(),
            const SocialButtons(),
          ],
        ),
      ),
    );
  }
}
