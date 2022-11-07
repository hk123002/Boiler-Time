// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:boiler_time/services/auth/auth_service.dart';
import 'package:boiler_time/views/Home/home.dart';
import 'package:boiler_time/views/auth/login_view.dart';
import 'package:boiler_time/views/boiler/boiler.dart';
import 'package:boiler_time/views/calendar/calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../enums/menu_action.dart';
import 'package:boiler_time/constants/routes.dart';

import 'community/category.dart';
import 'package:google_fonts/google_fonts.dart';

class MainView extends StatelessWidget {
  final int index;
  const MainView({required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildScreens() {
      return [
        const marketscreen(),
        const communityscreen(),
        const chatscreen(),
        const profilescreen(),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          // iconSize: 20,
          title: ("home"),
          textStyle: GoogleFonts.rubik(
            textStyle: TextStyle(fontSize: 11),
          ),
          activeColorPrimary: Color.fromARGB(255, 255, 255, 255),
          inactiveColorPrimary: Color.fromARGB(255, 180, 179, 179),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.margin),
          // iconSize: 20,
          title: ("community"),
          textStyle: GoogleFonts.rubik(
            textStyle: TextStyle(fontSize: 10),
          ),
          activeColorPrimary: Color.fromARGB(255, 255, 255, 255),
          inactiveColorPrimary: Color.fromARGB(255, 180, 179, 179),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.calendar_month_outlined),
          // iconSize: 20,
          title: ("calendar"),
          textStyle: GoogleFonts.rubik(
            textStyle: TextStyle(fontSize: 10),
          ),
          activeColorPrimary: Color.fromARGB(255, 255, 255, 255),
          inactiveColorPrimary: Color.fromARGB(255, 180, 179, 179),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person_outline),
          // iconSize: 20,
          title: ("profile"),
          textStyle: GoogleFonts.rubik(
            textStyle: TextStyle(fontSize: 10),
          ),
          activeColorPrimary: Color.fromARGB(255, 252, 252, 252),
          inactiveColorPrimary: Color.fromARGB(255, 180, 179, 179),
        ),
      ];
    }

    PersistentTabController controller;
    controller = PersistentTabController(initialIndex: index);

    return Scaffold(
        body: PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor:
          Color.fromARGB(255, 29, 29, 29), // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      // resizeToAvoidBottomInset:
      //     true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        // borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.black,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 300),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    ));
  }
}

class marketscreen extends StatelessWidget {
  const marketscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const home();
  }
}

class communityscreen extends StatelessWidget {
  const communityscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Category();
  }
}

class chatscreen extends StatelessWidget {
  const chatscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Calendar();
  }
}

class profilescreen extends StatelessWidget {
  const profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Boiler();
  }
}
