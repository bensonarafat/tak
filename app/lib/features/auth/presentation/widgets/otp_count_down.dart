import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tak/core/utils/colors.dart';
import 'package:tak/core/utils/helpers.dart';
import 'package:tak/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:tak/features/auth/presentation/bloc/countdown/countdown_cubit.dart';

class OTPCountDown extends StatelessWidget {
  final String? email;
  const OTPCountDown({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.robotoFlex(
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
      color: primaryColor,
    );
    return BlocBuilder<CountDownCubit, CountDownState>(
        builder: (context, state) {
      if (state is CountDownInitial) {
        return Text("15:00", style: style);
      } else if (state is CountDownUpdate) {
        return Text(
          formatDuration(state.duration),
          style: style,
        );
      } else if (state is CountDownCompleted) {
        return GestureDetector(
          onTap: () {
            // restart the countdown
            context.read<CountDownCubit>().restartCountDown();
            // resend the otp again
            context.read<AuthBloc>().add(EmailEvent(email: email!));
          },
          child: Row(
            children: [
              Text("Re-send", style: style),
              Gap(2.w),
              Icon(
                Icons.restart_alt,
                color: primaryColor,
                size: 20.w,
              ),
            ],
          ),
        );
      } else {
        return Text("Please wait..", style: style);
      }
    });
  }
}
