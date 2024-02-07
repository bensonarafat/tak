import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tak/core/utils/colors.dart';
import 'package:tak/core/utils/helpers.dart';
import 'package:tak/core/widgets/tak_along_loading.dart';
import 'package:tak/features/auth/domain/entities/otp_entity.dart';
import 'package:tak/features/auth/presentation/bloc/auth/auth_bloc.dart';

class SignUpNextButton extends StatelessWidget {
  final String? email;
  final bool? checked;
  final Map<String, dynamic>? otps;
  const SignUpNextButton({
    super.key,
    required this.email,
    this.checked,
    this.otps,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) {
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
            child: state is AuthLoadingState
                ? const TakLoading()
                : Text(
                    "Next",
                    style: GoogleFonts.robotoFlex(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: white,
                    ),
                  ),
            onPressed: () {
              String otp = otps!.values.join();

              if (otp.isNotEmpty) {
                if (email != null) {
                  context.read<AuthBloc>().add(VerifyOTPEvent(
                        otp: otp,
                        email: email!,
                      ));
                } else {
                  toast("There was been an error");
                }
              } else {
                toast("Enter your verification code sent to your email");
              }
            },
          ),
        );
      },
      listener: (context, state) {
        // error state
        if (state is ErrorAuthState) {
          String message = state.message;

          toast(message);
        }

        // auth state
        if (state is VerifyOTPState) {
          OTPEntity otpEntity = state.otpEntity;
          if (otpEntity.status) {
            context.go(
              "/setup",
            );
          }

          toast(otpEntity.message);
        }
      },
    );
  }
}
