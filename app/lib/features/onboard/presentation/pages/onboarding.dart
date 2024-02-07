import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_slider_flutter/onboarding_slider_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tak/core/constants/constants.dart';
import 'package:tak/core/utils/colors.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoard(
        pageController: _pageController,
        showSkip: false,
        onBoardData: onBoardData,
        imageWidth: 320.0.w,
        imageHeight: 320.0.h,
        titleStyles: GoogleFonts.robotoFlex(
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
        descriptionStyles: GoogleFonts.robotoFlex(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
        startButton: SizedBox(
          width: 358.w,
          height: 42.h,
          child: TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                primaryColor,
              ),
            ),
            child: const Text(
              "Get Started",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(
                    0xfffdfdfd,
                  )),
            ),
            onPressed: () => context.pushReplacement("/getstarted"),
          ),
        ),
        decoration: BoxDecoration(
          color: Brightness.dark == Theme.of(context).brightness ? dark : white,
        ),
        pageIndicatorStyle: PageIndicatorStyle(
          width: 50.w,
          inactiveColor: secondaryColor,
          activeColor: primaryColor,
          inactiveSize: Size(12.w, 5.h),
          activeSize: Size(12.w, 5.h),
        ),
      ),
    );
  }
}
