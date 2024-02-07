import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tak/core/utils/colors.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 21.h,
      ),
      child: GestureDetector(
        onTap: () => context.push("/sign-up"),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account?",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              "Create Account",
              style: GoogleFonts.robotoFlex(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
