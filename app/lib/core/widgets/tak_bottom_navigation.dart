import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tak/core/bloc/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:tak/core/bloc/bottom_navigation/bottom_navigation_event.dart';
import 'package:tak/core/bloc/bottom_navigation/bottom_navigation_state.dart';
import 'package:tak/core/utils/colors.dart';
import 'package:tak/core/widgets/tak_along_drawer.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tak/features/home/presentation/pages/home.dart';
import 'package:tak/features/messages/presentation/pages/messages.dart';
import 'package:tak/features/notification/presentation/pages/notifications.dart';
import 'package:tak/features/transactions/presentation/pages/transactions.dart';

List<BottomNavigationBarItem> bottomNavItems = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: HeroIcon(
      HeroIcons.home,
      size: 20.r,
    ),
    label: 'Home',
    activeIcon: HeroIcon(
      HeroIcons.home,
      size: 20.r,
      color: primaryColor,
    ),
  ),
  BottomNavigationBarItem(
    icon: HeroIcon(
      HeroIcons.chartBar,
      size: 20.r,
    ),
    label: 'Transactions',
    activeIcon: HeroIcon(
      HeroIcons.chartBar,
      size: 20.r,
      color: primaryColor,
    ),
  ),
  BottomNavigationBarItem(
    icon: badges.Badge(
      badgeContent: Text(
        '0',
        style: GoogleFonts.robotoFlex(
          color: white,
        ),
      ),
      child: HeroIcon(
        HeroIcons.chatBubbleBottomCenter,
        size: 20.r,
      ),
    ),
    label: 'Messages',
    activeIcon: badges.Badge(
      badgeContent: Text(
        '0',
        style: GoogleFonts.robotoFlex(
          color: white,
        ),
      ),
      child: HeroIcon(
        HeroIcons.chatBubbleBottomCenter,
        size: 20.r,
        color: primaryColor,
      ),
    ),
  ),
  BottomNavigationBarItem(
    icon: badges.Badge(
      badgeContent: Text(
        '0',
        style: GoogleFonts.robotoFlex(
          color: white,
        ),
      ),
      child: HeroIcon(
        HeroIcons.bell,
        size: 20.r,
      ),
    ),
    label: 'Notifications',
    activeIcon: badges.Badge(
      badgeContent: Text(
        '0',
        style: GoogleFonts.robotoFlex(
          color: white,
        ),
      ),
      child: HeroIcon(
        HeroIcons.bell,
        size: 20.r,
        color: primaryColor,
      ),
    ),
  ),
];

const List<Widget> bottomNavScreen = <Widget>[
  Home(),
  Transactions(),
  Messages(),
  Notifications(),
];

class TakBottomNavigation extends StatelessWidget {
  const TakBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavigationBloc, BottomNavigationState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: bottomNavScreen.elementAt(state.index),
            drawer: const Drawer(
              child: TakDrawer(),
            ),
            bottomNavigationBar: BottomNavigationBar(
              elevation: 1,
              type: BottomNavigationBarType.fixed,
              items: bottomNavItems,
              currentIndex: state.index,
              selectedItemColor: primaryColor,
              selectedFontSize: 14.sp,
              unselectedFontSize: 14.sp,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              onTap: (index) => BlocProvider.of<BottomNavigationBloc>(context)
                  .add(TabChange(index: index)),
            ),
          );
        });
  }
}
