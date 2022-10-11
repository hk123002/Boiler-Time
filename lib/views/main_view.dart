// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:boiler_time/services/auth/auth_service.dart';
import 'package:boiler_time/views/Home/home.dart';
import 'package:boiler_time/views/auth/login_view.dart';
import 'package:boiler_time/views/boiler/boiler.dart';
import 'package:boiler_time/views/calendar/calendar.dart';
import 'package:boiler_time/views/community/community.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../enums/menu_action.dart';
import 'package:boiler_time/constants/routes.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

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
          icon: const Icon(Icons.add_business),
          title: ("Home"),
          activeColorPrimary: Colors.amber,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.monitor_sharp),
          title: ("Community"),
          activeColorPrimary: Colors.amber,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.calendar_month),
          title: ("Calendar"),
          activeColorPrimary: Colors.amber,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.people),
          title: ("Boilers"),
          activeColorPrimary: Colors.amber,
          inactiveColorPrimary: Colors.grey,
        ),
      ];
    }

    PersistentTabController controller;
    controller = PersistentTabController(initialIndex: 0);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Boiler Time'),
          actions: [
            PopupMenuButton(
              onSelected: (value) async {
                switch (value) {
                  case MenuAction.logout:
                    final shouldLogout = await showLogOutDialog(context);
                    if (shouldLogout) {
                      await AuthService.firebase().logOut();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        loginRoute,
                        (route) => false,
                      );
                    }
                }
              },
              itemBuilder: (context) {
                return const [
                  PopupMenuItem<MenuAction>(
                    value: MenuAction.logout,
                    child: Text("Log out"),
                  )
                ];
              },
            )
          ],
        ),
        body: PersistentTabView(
          context,
          controller: controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.white, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          // resizeToAvoidBottomInset:
          //     true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows:
              true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle
              .style6, // Choose the nav bar style with this property.
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
    return const Community();
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

// class MainView extends StatefulWidget {
//   const MainView({super.key});

//   @override
//   State<MainView> createState() => _MainViewState();
// }

// class _MainViewState extends State<MainView> {
//   int _selectedIndex = 0;
//   static const TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

//   static const List<Widget> _widgetOptions = <Widget>[
//     Text(
//       'Index 0: Market',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 1: Community',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 2: Chat',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 3: Profile',
//       style: optionStyle,
//     ),
//   ];

// void _onItemTapped(int index) {
//   setState(() {
//     _selectedIndex = index;
//   });
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Main UI'),
//         actions: [
//           PopupMenuButton(
//             onSelected: (value) async {
//               switch (value) {
//                 case MenuAction.logout:
//                   final shouldLogout = await showLogOutDialog(context);
//                   if (shouldLogout) {
//                     await AuthService.firebase().logOut();
//                     Navigator.of(context).pushNamedAndRemoveUntil(
//                       loginRoute,
//                       (route) => false,
//                     );
//                   }
//               }
//             },
//             itemBuilder: (context) {
//               return const [
//                 PopupMenuItem<MenuAction>(
//                   value: MenuAction.logout,
//                   child: Text("Log out"),
//                 )
//               ];
//             },
//           )
//         ],
//       ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Add your onPressed code here!
//         },
//         backgroundColor: Colors.amber,
//         child: const Icon(Icons.add),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             backgroundColor: Colors.amber,
//             icon: Icon(Icons.add_business),
//             label: 'Market',
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Colors.amber,
//             icon: Icon(Icons.monitor_sharp),
//             label: 'Community',
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Colors.amber,
//             icon: Icon(Icons.message),
//             label: 'Chat',
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Colors.amber,
//             icon: Icon(Icons.people),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.black,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Sign out'),
          content: const Text('Are you sure you want to sign out?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('Cancel')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('Log out'))
          ],
        );
      }).then((value) => value ?? false);
}
