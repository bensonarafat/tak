import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tak/core/services/get_it_services.dart';
import 'package:tak/features/auth/presentation/bloc/auth/auth_bloc.dart';

class AuthStreamScope extends InheritedNotifier<GoRouterRefereshStream> {
  AuthStreamScope({
    super.key,
    required super.child,
  }) : super(
          notifier: GoRouterRefereshStream(getIt.get<AuthBloc>().stream),
        );
  static GoRouterRefereshStream of(BuildContext ctx) =>
      ctx.dependOnInheritedWidgetOfExactType<AuthStreamScope>()!.notifier!;
}

class GoRouterRefereshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> subscription;
  GoRouterRefereshStream(Stream<dynamic> stream) {
    notifyListeners();
    subscription = stream.asBroadcastStream().listen(
          (event) => notifyListeners(),
        );
  }

  void checkAuth() {
    getIt.get<AuthBloc>().add(CheckLoginEvent());
  }

  bool isSignedIn() => getIt.get<AuthBloc>().state.isLogin;

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
