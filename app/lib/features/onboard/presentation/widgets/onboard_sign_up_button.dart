import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tak/core/utils/colors.dart';

class OnboardSignUpButton extends StatelessWidget {
  const OnboardSignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 16.h,
      ),
      width: 254.w,
      height: 42.h,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color: primaryColor,
                width: 1.w,
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
        ),
        child: Text(
          "Signup",
          style: GoogleFonts.robotoFlex(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: white,
          ),
        ),
        onPressed: () => context.push("/sign-up"),
      ),
    );
  }
}
