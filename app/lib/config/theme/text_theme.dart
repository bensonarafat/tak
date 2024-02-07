import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tak/core/utils/colors.dart';

class AppTextTheme {
  static TextTheme lightTextTheme() {
    return TextTheme(
      displayLarge: GoogleFonts.robotoFlex().copyWith(
        fontSize: 57.sp,
        color: dark,
        fontWeight: FontWeight.w400,
      ),
      displayMedium: GoogleFonts.robotoFlex().copyWith(
        color: dark,
        fontSize: 45.sp,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: GoogleFonts.robotoFlex().copyWith(
        color: dark,
        fontSize: 36.sp,
        fontWeight: FontWeight.w400,
      ),
      headlineLarge: GoogleFonts.robotoFlex().copyWith(
        color: dark,
        fontSize: 32.sp,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: GoogleFonts.robotoFlex().copyWith(
        color: dark,
        fontSize: 28.sp,
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: GoogleFonts.robotoFlex().copyWith(
        color: dark,
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: GoogleFonts.robotoFlex().copyWith(
        color: dark,
        fontSize: 22.sp,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: GoogleFonts.robotoFlex().copyWith(
        color: const Color(0xff77787B),
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: GoogleFonts.robotoFlex().copyWith(
        color: dark,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: GoogleFonts.robotoFlex().copyWith(
        color: dark,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: GoogleFonts.robotoFlex().copyWith(
        color: dark,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: GoogleFonts.robotoFlex().copyWith(
        color: dark,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: GoogleFonts.robotoFlex().copyWith(
        color: dark,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: GoogleFonts.robotoFlex().copyWith(
        color: dark,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: GoogleFonts.robotoFlex().copyWith(
        color: dark,
        fontSize: 11.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static TextTheme darkTextTheme() {
    return TextTheme(
      displayLarge: GoogleFonts.robotoFlex().copyWith(
        fontSize: 57.sp,
        color: white,
        fontWeight: FontWeight.w400,
      ),
      displayMedium: GoogleFonts.robotoFlex().copyWith(
        color: white,
        fontSize: 45.sp,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: GoogleFonts.robotoFlex().copyWith(
        color: white,
        fontSize: 36.sp,
        fontWeight: FontWeight.w400,
      ),
      headlineLarge: GoogleFonts.robotoFlex().copyWith(
        color: white,
        fontSize: 32.sp,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: GoogleFonts.robotoFlex().copyWith(
        color: white,
        fontSize: 28.sp,
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: GoogleFonts.robotoFlex().copyWith(
        color: white,
        fontSize: 24.sp,
        fontWeight: FontWeight.w400,
      ),
      titleLarge: GoogleFonts.robotoFlex().copyWith(
        color: white,
        fontSize: 22.sp,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: GoogleFonts.robotoFlex().copyWith(
        color: white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: GoogleFonts.robotoFlex().copyWith(
        color: white,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: GoogleFonts.robotoFlex().copyWith(
        color: white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: GoogleFonts.robotoFlex().copyWith(
        color: white,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: GoogleFonts.robotoFlex().copyWith(
        color: white,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: GoogleFonts.robotoFlex().copyWith(
        color: white,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: GoogleFonts.robotoFlex().copyWith(
        color: white,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: GoogleFonts.robotoFlex().copyWith(
        color: white,
        fontSize: 11.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
