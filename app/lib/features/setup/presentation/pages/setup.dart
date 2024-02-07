import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tak/core/services/get_it_services.dart';

import 'package:tak/features/setup/presentation/bloc/setup_bloc.dart';
import 'package:tak/features/setup/presentation/pages/house.dart';
import 'package:tak/features/setup/presentation/pages/setup_page.dart';

class SetUp extends StatefulWidget {
  const SetUp({super.key});

  @override
  State<SetUp> createState() => _SetUpState();
}

class _SetUpState extends State<SetUp> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SetUpBloc>(
      create: (context) => getIt<SetUpBloc>()..add(FetchHousesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Account setup"),
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            SetupPage(pageController: controller),
            const HousesPage(),
          ],
        ),
      ),
    );
  }
}
