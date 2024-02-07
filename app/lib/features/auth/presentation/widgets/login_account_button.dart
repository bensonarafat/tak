import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tak/core/utils/colors.dart';
import 'package:tak/core/utils/helpers.dart';
import 'package:tak/features/auth/domain/entities/auth_entity.dart';
import 'package:tak/features/auth/presentation/bloc/auth/auth_bloc.dart';

import '../../../../core/widgets/tak_along_loading.dart';

class LoginAccountButton extends StatelessWidget {
  final String password;
  final String email;
  const LoginAccountButton({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is ErrorAuthState) {
          toast(state.message);
        }
        if (state is LoginState) {
          AuthEntity authEntity = state.authEntity;
          if (authEntity.status) {
            context.go("/nav");
          } else {
            toast(authEntity.message);
          }
        }
      },
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
                    "Login",
                    style: GoogleFonts.robotoFlex(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: white,
                    ),
                  ),
            onPressed: () {
              if (email != "" || password != "") {
                context.read<AuthBloc>().add(
                      LoginEvent(
                        email: email,
                        password: password,
                      ),
                    );
              } else {
                toast("Provide your email address");
              }
            },
          ),
        );
      },
    );
  }
}
