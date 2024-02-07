import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tak/core/constants/assets.dart';
import 'package:tak/core/utils/colors.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SocialButtons extends StatefulWidget {
  const SocialButtons({super.key});

  @override
  State<SocialButtons> createState() => _SocialButtonsState();
}

class _SocialButtonsState extends State<SocialButtons> {
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<void> handleGoogleSignIn() async {
    try {
      GoogleSignInAccount? response = await googleSignIn.signIn();
      if (response != null) {
        // String email = response.email;
      }
    } catch (_) {}
  }

  Future<void> handleAppleSignIn() async {
    // final credential = await SignInWithApple.getAppleIDCredential(
    //   scopes: [
    //     AppleIDAuthorizationScopes.email,
    //     AppleIDAuthorizationScopes.fullName,
    //   ],
    // );
    // print(credential);
  }

  Future<void> handleFacebookSignIn() async {
    // final LoginResult result = await FacebookAuth.instance.login();
    // if (result.status == LoginStatus.success) {
    //   // you are logged
    //   final AccessToken accessToken = result.accessToken!;
    // } else {
    //   print(result.status);
    //   print(result.message);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => handleFacebookSignIn(),
          child: Image.asset(
            facebookIcon,
            width: 24.w,
            height: 24.h,
          ),
        ),
        SizedBox(
          width: 25.w,
        ),
        GestureDetector(
          onTap: () => handleAppleSignIn(),
          child: SvgPicture.asset(
            appleIcon,
            width: 26.w,
            height: 26.h,
            colorFilter: ColorFilter.mode(
                Theme.of(context).brightness == Brightness.dark ? white : dark,
                BlendMode.srcIn),
          ),
        ),
        SizedBox(
          width: 25.w,
        ),
        GestureDetector(
          onTap: () => handleGoogleSignIn(),
          child: Image.asset(
            googleIcon,
            width: 24.w,
            height: 24.h,
          ),
        ),
      ],
    );
  }
}
