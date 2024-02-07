import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tak/core/utils/colors.dart';

class UpdateProfileButton extends StatelessWidget {
  final String name;
  final String gender;
  final String phone;
  const UpdateProfileButton({
    super.key,
    required this.name,
    required this.gender,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 40.h,
      ),
      width: 358.w,
      height: 52.h,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
              side: const BorderSide(
                color: primaryColor,
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
        ),
        child: Text(
          "Update Profile",
          style: GoogleFonts.robotoFlex(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: white,
          ),
        ),
        onPressed: () async {},
      ),
    );
  }
}
