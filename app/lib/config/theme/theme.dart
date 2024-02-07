// light theme
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tak/config/theme/appbar_theme.dart';
import 'package:tak/config/theme/text_theme.dart';
import 'package:tak/core/utils/colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: lightBackgroundColor,
      useMaterial3: true,
      primaryColor: primaryColor,
      textTheme: AppTextTheme.lightTextTheme(),
      appBarTheme: AppAppBarTheme.lightAppBarTheme(),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all<Color>(white),
        side: BorderSide(color: primaryColor, width: 2.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffCECECE),
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffCECECE),
          ),
        ),
        hintStyle: GoogleFonts.robotoFlex().copyWith(
          color: dark,
          fontSize: 22.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      drawerTheme: const DrawerThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        backgroundColor: white,
      ),
      listTileTheme: ListTileThemeData(
        titleTextStyle: GoogleFonts.robotoFlex().copyWith(
          color: dark,
          fontSize: 22.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      iconTheme: const IconThemeData(
        color: dark,
      ),
      unselectedWidgetColor: dark,
      shadowColor: white,
      //
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
        background: white,
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all<Color>(dark),
      ),
      cardTheme: const CardTheme(
        color: white,
      ),
    );
  }

  // dark theme
  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: darkBackgroundColor,
      textTheme: AppTextTheme.darkTextTheme(),
      appBarTheme: AppAppBarTheme.darkAppBarTheme(),
      iconTheme: const IconThemeData(
        color: white,
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all<Color>(dark),
        side: BorderSide(color: primaryColor, width: 2.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: white,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: white,
          ),
        ),
        hintStyle: GoogleFonts.robotoFlex().copyWith(
          color: white,
          fontSize: 22.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      drawerTheme: const DrawerThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        backgroundColor: dark,
      ),
      listTileTheme: ListTileThemeData(
        titleTextStyle: GoogleFonts.robotoFlex().copyWith(
          color: white,
          fontSize: 22.sp,
          fontWeight: FontWeight.w400,
        ),
      ),

      unselectedWidgetColor: white,
      shadowColor: dark,

      //
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.dark,
        background: dark,
      ),

      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all<Color>(white),
      ),
      cardTheme: const CardTheme(
        color: dark,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: primaryColor,
              width: 1.w,
            ),
            borderRadius: BorderRadius.circular(
              12.r,
            ),
          ),
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: primaryColor,
      ),
    );
  }
}
