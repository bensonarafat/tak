import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tak/core/constants/constants.dart';
import 'package:tak/core/data/models/user_model.dart';
import 'package:tak/core/services/get_it_services.dart';
import 'package:tak/core/services/secure_storage.dart';
import 'package:tak/core/utils/colors.dart';
import 'package:tak/core/utils/helpers.dart';
import 'package:tak/core/widgets/tak_cache_network_image.dart';
import 'package:tak/features/auth/presentation/bloc/auth/auth_bloc.dart';

class TakDrawer extends StatefulWidget {
  const TakDrawer({super.key});

  @override
  State<TakDrawer> createState() => _TakDrawerState();
}

class _TakDrawerState extends State<TakDrawer> {
  SecureStorage secureStorage = getIt<SecureStorage>();
  String username = "";
  String avatar = imageplaceholder;
  int rating = 0;
  String role = 'user';
  @override
  void initState() {
    drawerAction();
    super.initState();
  }

  drawerAction() {
    _getUserData();
  }

  _getUserData() async {
    UserModel? usermodel = await secureStorage.getUserData();
    setState(() {
      username = "${usermodel?.name}";
      avatar = "${usermodel?.avatar}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 50.h),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40.h),
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.50.w,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? white
                          : dark,
                    ),
                  ),
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TakCachedNetworkImage(
                          path: avatar,
                          width: 52,
                          fit: BoxFit.fill,
                          height: 52,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1.w,
                              color: const Color(0xFFA0A2A9),
                            ),
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                        ),
                        Gap(8.h),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              username,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    fontSize: 20.sp,
                                  ),
                            ),
                            Gap(8.h),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: const Color(0xffFEDA15),
                                  size: 24.w,
                                ),
                                Gap(8.h),
                                Text(
                                  '$rating.0',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        fontSize: 16.sp,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),

              // others
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: [
                  //

                  ListTile(
                    onTap: () async {
                      await context.push("/profile");
                      drawerAction();
                    },
                    title: Text(
                      'Profile',
                      style: Theme.of(context).listTileTheme.titleTextStyle,
                    ),
                    leading: const HeroIcon(HeroIcons.user),
                  ),

                  ListTile(
                    onTap: () async {
                      await context.push("/referral");
                      drawerAction();
                    },
                    title: Text(
                      'Referral',
                      style: Theme.of(context).listTileTheme.titleTextStyle,
                    ),
                    leading: const HeroIcon(HeroIcons.share),
                  ),

                  ListTile(
                    onTap: () async {
                      context.push("/help-center");
                      drawerAction();
                    },
                    title: Text(
                      'Help',
                      style: Theme.of(context).listTileTheme.titleTextStyle,
                    ),
                    leading: const HeroIcon(HeroIcons.questionMarkCircle),
                  ),

                  ListTile(
                    onTap: () async {
                      await context.push("/settings");
                      drawerAction();
                    },
                    title: Text(
                      'Settings',
                      style: Theme.of(context).listTileTheme.titleTextStyle,
                    ),
                    leading: const HeroIcon(HeroIcons.cog),
                  ),

                  ListTile(
                    onTap: () => context.push("/about"),
                    title: Text(
                      'About',
                      style: Theme.of(context).listTileTheme.titleTextStyle,
                    ),
                    leading: const HeroIcon(HeroIcons.exclamationCircle),
                  ),

                  BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is UnAuthenticatedState) {
                        context.go("/getstarted");
                      }
                      //error
                      if (state is ErrorAuthState) {
                        toast(state.message);
                      }
                    },
                    child: ListTile(
                      onTap: () {
                        context.read<AuthBloc>().add(LogoutEvent());
                      },
                      title: Text(
                        'Logout',
                        style: GoogleFonts.robotoFlex(
                          color: primaryColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      leading: const HeroIcon(HeroIcons.lockOpen),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
