import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tak/core/widgets/tak_along_or_text.dart';
import 'package:tak/core/widgets/tak_email_field.dart';
import 'package:tak/core/widgets/tak_password_field.dart';
import 'package:tak/core/widgets/tak_social_buttons.dart';
import 'package:tak/features/auth/presentation/widgets/dont_have_an_account.dart';
import 'package:tak/features/auth/presentation/widgets/login_account_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "";
  String password = "";
  fieldemail(v) {
    setState(() {
      email = v;
    });
  }

  fieldpass(v) {
    setState(() {
      password = v;
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 8.h,
                      left: 16.w,
                    ),
                    child: Text(
                      "Welcome back",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 8.h,
                      bottom: 48.h,
                      left: 16.w,
                    ),
                    child: Text(
                      "Login to continue",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 8.h,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EmailField(
                          callback: fieldemail,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        PasswordField(
                          callback: fieldpass,
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: LoginAccountButton(
                      email: email,
                      password: password,
                    ),
                  ),
                  const Center(child: OrText()),
                  const SocialButtons(),
                  Container(
                    margin: EdgeInsets.only(
                      top: 21.h,
                    ),
                    child: const DontHaveAnAccount(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
