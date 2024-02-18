import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tak/core/utils/colors.dart';
import 'package:tak/core/utils/helpers.dart';
import 'package:tak/core/widgets/tak_along_loading.dart';
import 'package:tak/features/auth/presentation/bloc/auth/auth_bloc.dart';

class CreateAccountButton extends StatelessWidget {
  final String fullname;
  final String email;
  final String password;
  final String confirmpassword;
  const CreateAccountButton({
    super.key,
    required this.fullname,
    required this.email,
    required this.password,
    required this.confirmpassword,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(
            top: 33.h,
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
                    "Create Account",
                    style: GoogleFonts.robotoFlex(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: white,
                    ),
                  ),
            onPressed: () {
              if (fullname == "" || password == "" || confirmpassword == "") {
                toast("You must fill all the field");
              } else {
                if (password.length < 8) {
                  toast("Password Character must be greater than 8");
                } else {
                  if (password != confirmpassword) {
                    toast("Password must match");
                  } else {
                    context.read<AuthBloc>().add(
                          CreateAccountEvent(
                            fullname: fullname,
                            password: password,
                            email: email,
                          ),
                        );
                  }
                }
              }
            },
          ),
        );
      },
      listener: (context, state) {
        //error
        if (state is ErrorAuthState) {
          String message = state.message;

          toast(message);
        }
        if (state is CreateAccountState) {
          // AuthEntity authEntity = state.authEntity;
          // navigate to the
          context.go("/verify-otp", extra: email);
        }
      },
    );
  }
}
