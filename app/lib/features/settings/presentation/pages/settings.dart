import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tak/core/utils/helpers.dart';
import 'package:tak/features/auth/presentation/bloc/auth/auth_bloc.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: IconTheme(
            data: Theme.of(context).iconTheme,
            child: const Icon(
              Icons.keyboard_arrow_left,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: Text(
              "Update  Role",
              style: Theme.of(context).listTileTheme.titleTextStyle!.copyWith(
                    fontSize: 15.sp,
                  ),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.lock),
            title: Text(
              "Change Password",
              style: Theme.of(context).listTileTheme.titleTextStyle!.copyWith(
                    fontSize: 15.sp,
                  ),
            ),
          ),
          const Divider(),
          BlocListener<AuthBloc, AuthState>(
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
              child: ListTile(
                onTap: () => context.read<AuthBloc>().add(LogoutEvent()),
                leading: const Icon(
                  Icons.logout,
                  color: Color.fromARGB(255, 209, 33, 20),
                ),
                title: Text(
                  "Log Out",
                  style:
                      Theme.of(context).listTileTheme.titleTextStyle!.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w800,
                            color: const Color.fromARGB(255, 209, 33, 20),
                          ),
                ),
              )),
        ],
      ),
    );
  }
}
