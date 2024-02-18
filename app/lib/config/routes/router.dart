import 'package:bot_toast/bot_toast.dart';
import 'package:go_router/go_router.dart';
import 'package:tak/config/routes/routes.dart';
import 'package:tak/core/data/models/user_model.dart';
import 'package:tak/core/services/get_it_services.dart';
import 'package:tak/core/services/secure_storage.dart';
// import 'package:tak/core/services/stream_listener.dart';

final GoRouter router = GoRouter(
  initialLocation: "/nav",
  observers: [BotToastNavigatorObserver()],
  routes: routes,
  // refreshListenable: GoRouterRefereshStream(getIt<AuthBloc>().stream),
  redirect: (context, state) async {
    // final bool loggedIn = AuthStreamScope.of(context).isSignedIn();

    bool auth = await getIt<SecureStorage>().isAuthenticated();
    // if the user is not loggin redirect to the home page/ onboarding page
    if (!auth) {
      if (state.matchedLocation != "/getstarted" &&
          state.matchedLocation != "/login" &&
          state.matchedLocation != "/sign-up" &&
          state.matchedLocation != "/create-account" &&
          state.matchedLocation != "/submitted" &&
          state.matchedLocation != "/setup" &&
          state.matchedLocation != "/verify-otp") {
        return '/'; //home page
      }
    }

    UserModel? userModel = await getIt<SecureStorage>().getUserData();
    if (userModel != null) {
      if (userModel.emailVerifiedAt != null) {
        if (userModel.status == "pending") {
          return "/setup";
        }
        if (userModel.role == "security") {
          if (state.matchedLocation == "/nav") {
            return '/security';
          }
          return '/security';
        }
        if (userModel.role == "tenant") {
          if (state.matchedLocation == "/security") {
            return '/nav';
          }
        }
      } else {
        return '/verify-otp';
      }
    }
    return null;
  },
);
