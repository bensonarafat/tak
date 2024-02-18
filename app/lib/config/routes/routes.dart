import 'package:go_router/go_router.dart';
import 'package:tak/core/bloc/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:tak/features/onboard/presentation/pages/onboarding.dart';
import 'package:tak/features/setup/presentation/pages/setup.dart';
import 'package:tak/features/transactions/presentation/pages/invoices.dart';
import 'package:tak/features/transactions/presentation/pages/payments.dart';
import 'package:tak/features/transactions/presentation/pages/transactions.dart';
import 'package:tak/features/visitors/domain/entities/visitors_entity.dart';
import 'package:tak/features/visitors/presentation/pages/add_visitor.dart';
import 'package:tak/features/visitors/presentation/pages/edit_visitor.dart';
import 'package:tak/features/visitors/presentation/pages/visitors.dart';
import 'package:tak/features/auth/presentation/pages/create_account.dart';
import 'package:tak/features/auth/presentation/pages/email_verification.dart';
import 'package:tak/features/auth/presentation/pages/login.dart';
import 'package:tak/features/auth/presentation/pages/signup.dart';
import 'package:tak/features/onboard/presentation/pages/get_started.dart';
import 'package:tak/features/profile/presentation/pages/profile.dart';
import 'package:tak/features/security/presentation/pages/security.dart';
import 'package:tak/features/service_request/presentation/pages/add_request.dart';
import 'package:tak/features/service_request/presentation/pages/service_requests.dart';
import 'package:tak/features/settings/presentation/pages/settings.dart';
import 'package:tak/core/widgets/tak_bottom_navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final BottomNavigationBloc bottomNavigationBloc = BottomNavigationBloc();

final List<GoRoute> routes = [
  GoRoute(
    path: '/',
    name: "home",
    builder: (context, state) => const Onboarding(),
  ),
  GoRoute(
    path: "/getstarted",
    name: "getStarted",
    builder: (context, state) => const GetStarted(),
  ),

  GoRoute(
    path: '/sign-up',
    name: "signUp",
    builder: (context, state) => const SignUp(),
  ),
  GoRoute(
    path: "/login",
    name: "login",
    builder: (context, state) => const Login(),
  ),

  GoRoute(
    path: '/verify-otp',
    name: 'verifyOTP',
    builder: (context, state) =>
        EmailVerification(email: state.extra as String),
  ),
  GoRoute(
    path: '/create-account',
    name: 'createAccount',
    builder: (context, state) => CreateAccount(email: state.extra as String),
  ),

  GoRoute(
    path: '/profile',
    name: 'profile',
    builder: (context, state) => const Profile(),
  ),
  GoRoute(
    path: '/settings',
    name: 'settings',
    builder: (context, state) => const Settings(),
  ),
  // navigations
  GoRoute(
    path: '/nav',
    name: "nav",
    builder: (context, state) => BlocProvider<BottomNavigationBloc>.value(
      value: bottomNavigationBloc,
      child: const TakBottomNavigation(),
    ),
  ),

  // navigations
  GoRoute(
    path: "/setup",
    name: "setup",
    builder: (context, state) => const SetUp(),
  ),
  GoRoute(
    path: '/security',
    name: "security",
    builder: (context, state) => const Security(),
  ),

  GoRoute(
    path: '/add-request',
    name: "addRequest",
    builder: (context, state) => AddRequest(houseId: state.extra as String),
  ),
  GoRoute(
    path: '/service-requests',
    name: "serviceRequests",
    builder: (context, state) => const ServiceRequests(),
  ),
  GoRoute(
    path: '/add-visitor',
    name: "addVisitor",
    builder: (context, state) => const AddVisitor(),
  ),
  GoRoute(
    path: '/edit-visitor',
    name: "editVisitor",
    builder: (context, state) =>
        EditVisitor(visitorsEntity: state.extra as VisitorsEntity),
  ),
  GoRoute(
    path: '/visitors',
    name: "visitors",
    builder: (context, state) => const Visitors(),
  ),
  GoRoute(
    path: '/transactions',
    name: 'transactions',
    builder: (context, state) => const Transactions(),
  ),
  GoRoute(
    path: '/invoices',
    name: 'invoices',
    builder: (context, state) => const Invoices(),
  ),
  GoRoute(
    path: '/payments',
    name: 'payments',
    builder: (context, state) => const Payments(),
  ),
];
