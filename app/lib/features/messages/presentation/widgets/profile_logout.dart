import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tak/core/constants/assets.dart';
import 'package:tak/core/utils/colors.dart';
import 'package:tak/core/utils/helpers.dart';
import 'package:tak/features/auth/presentation/bloc/auth/auth_bloc.dart';

class ProfileLogout extends StatelessWidget {
  const ProfileLogout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthenticatedState) {
          if (!state.isLogin) {
            context.go("/getstarted");
          }
        }
        //error
        if (state is ErrorAuthState) {
          toast(state.message);
        }
      },
      child: GestureDetector(
        onTap: () => context.read<AuthBloc>().add(LogoutEvent()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              logoutSVG,
              colorFilter: ColorFilter.mode(
                Theme.of(context).brightness == Brightness.dark ? white : dark,
                BlendMode.srcIn,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Sign Out',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
