import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tak/core/widgets/tak_along_or_text.dart';
import 'package:tak/core/widgets/tak_full_name_field.dart';
import 'package:tak/core/widgets/tak_password_field.dart';
import 'package:tak/core/widgets/tak_social_buttons.dart';
import 'package:tak/features/auth/presentation/widgets/already_have_account.dart';
import 'package:tak/features/auth/presentation/widgets/create_account_button.dart';

class CreateAccount extends StatefulWidget {
  final String email;
  const CreateAccount({
    super.key,
    required this.email,
  });

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String fullname = "";
  String password = "";
  String confirmpass = "";
  fieldname(v) {
    setState(() {
      fullname = v;
    });
  }

  fieldpassword(v) {
    setState(() {
      password = v;
    });
  }

  fieldconfirmpassword(v) {
    setState(() {
      confirmpass = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 8.h,
                        left: 16.w,
                      ),
                      child: Text(
                        "Create an Account",
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
                        "Sign up to get started",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 48.h,
                      ),
                      child: FullNameField(
                        callback: fieldname,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 8.h,
                      ),
                      child: PasswordField(
                        callback: fieldpassword,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 8.h,
                      ),
                      child: PasswordField(
                        callback: fieldconfirmpassword,
                      ),
                    ),
                    Center(
                      child: CreateAccountButton(
                        email: widget.email,
                        fullname: fullname,
                        password: password,
                        confirmpassword: confirmpass,
                      ),
                    ),
                    const Center(child: OrText()),
                    const SocialButtons(),
                    Container(
                      margin: EdgeInsets.only(
                        top: 21.h,
                      ),
                      child: const AlreadyHaveAnAccount(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
