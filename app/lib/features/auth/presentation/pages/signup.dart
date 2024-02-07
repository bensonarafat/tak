import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tak/core/utils/colors.dart';
import 'package:tak/core/widgets/tak_email_field.dart';
import 'package:tak/features/auth/presentation/widgets/already_have_account.dart';
import 'package:tak/features/auth/presentation/widgets/email_next_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool checked = true;

  String email = "";
  fieldemail(v) {
    setState(() {
      email = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: IconTheme(
            data: Theme.of(context).iconTheme,
            child: Icon(
              Icons.chevron_left,
              weight: 24.sp,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 8.h,
                        left: 16.w,
                      ),
                      child: Text(
                        "Weclome to Tak Estate!",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 8.h,
                        bottom: 16.h,
                        left: 16.w,
                      ),
                      child: Text(
                        "Enter email address to get started",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    // email widget
                    EmailField(
                      callback: fieldemail,
                    ),
                    // emailbuttin widget
                    EmailNextButton(
                      email: email,
                      checked: checked,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16.h),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Checkbox(
                              activeColor: primaryColor,
                              value: checked,
                              onChanged: (v) {
                                setState(() {
                                  checked = v ?? false;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Text(
                              "By signing up confirm that you agree to our Terms of use and Privacy Policy",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: AlreadyHaveAnAccount(),
          )
        ],
      ),
    );
  }
}
