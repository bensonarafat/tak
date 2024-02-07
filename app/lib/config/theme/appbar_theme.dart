import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tak/core/utils/colors.dart';

class AppAppBarTheme {
  static AppBarTheme lightAppBarTheme() {
    return AppBarTheme(
      centerTitle: true,
      backgroundColor: lightBackgroundColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: GoogleFonts.robotoFlex(
        color: dark,
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: const IconThemeData(
        color: dark,
      ),
    );
  }

  static AppBarTheme darkAppBarTheme() {
    return AppBarTheme(
      centerTitle: true,
      backgroundColor: darkBackgroundColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: GoogleFonts.robotoFlex(
        color: white,
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: const IconThemeData(
        color: white,
      ),
    );
  }
}
