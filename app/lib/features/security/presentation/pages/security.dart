import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tak/core/constants/constants.dart';
import 'package:tak/core/data/models/user_model.dart';
import 'package:tak/core/services/get_it_services.dart';
import 'package:tak/core/services/secure_storage.dart';
import 'package:tak/core/utils/colors.dart';
import 'package:tak/core/utils/extensions.dart';
import 'package:tak/core/widgets/tak_cache_network_image.dart';
import 'package:tak/features/security/presentation/bloc/security_bloc.dart';
import 'package:tak/features/security/presentation/widgets/security_visitor_widget.dart';

class Security extends StatefulWidget {
  const Security({super.key});

  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  SecureStorage secureStorage = getIt<SecureStorage>();
  String avatar = imageplaceholder;
  String name = "";
  String role = "";
  String status = "";

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  _getUserData() async {
    UserModel? usermodel = await secureStorage.getUserData();
    setState(() {
      name = "${usermodel?.name}".inCaps;
      avatar = usermodel?.avatar ?? imageplaceholder;
      role = "${usermodel?.role}".inCaps;
      status = "${usermodel?.status}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SecurityBloc>(
      create: (context) => getIt<SecurityBloc>()..add(FetchVisitorsEvent()),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => context.push("/settings"),
              icon: const Icon(Icons.settings),
            ),
          ],
          leading: GestureDetector(
            onTap: () => context.push("/profile"),
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: TakCachedNetworkImage(
                path: avatar,
                width: 20,
                height: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r),
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          title: GestureDetector(
            onTap: () => context.push("/profile"),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: GoogleFonts.robotoFlex(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      role,
                      style: GoogleFonts.robotoFlex(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_drop_down_sharp,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              status != "approved"
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: primaryColor,
                      ),
                      padding: EdgeInsets.only(
                        left: 8.w,
                        right: 8.w,
                        bottom: 8.h,
                        top: 8.h,
                      ),
                      margin: EdgeInsets.only(left: 8.w, right: 8.w),
                      child: Text(
                        "Account not yet approved, once approved you will be to do do other things with the app",
                        style: GoogleFonts.robotoFlex(
                          color: white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  : Container(),
              const SecurityVisitorWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
