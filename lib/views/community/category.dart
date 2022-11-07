import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../enums/menu_action.dart';
import '../../services/auth/auth_service.dart';
import '../auth/login_view.dart';
import '../boiler/boiler.dart';
import 'post.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Color.fromARGB(255, 46, 46, 46),
          elevation: 0.0,

          toolbarHeight: 40,
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Image(
                image: AssetImage('assets/bt_logo_white.png'),
              ),
            ),
          ),
          // backgroundColor: Color(0x44000000),
          // elevation: 0,
          // title: Text(
          //   "Boiler Time",
          //   // style: TextStyle(fontSize: 15),
          // ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(5),
            ),
          ),

          actions: [
            PopupMenuButton(
              onSelected: (value) async {
                switch (value) {
                  case MenuAction.logout:
                    final shouldLogout = await showLogOutDialog(context);
                    if (shouldLogout) {
                      await AuthService.firebase().logOut();
                      Navigator.of(context, rootNavigator: true)
                          .pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return LoginView();
                          },
                        ),
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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 131, 124, 132)),
                  borderRadius: BorderRadius.all(Radius.circular(
                          5.0) //                 <--- border radius here
                      ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0x00000000),
                        ),
                        child: const ListTile(
                          title: Text('Exam'),
                        ),
                        onPressed: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: Post(),
                            withNavBar:
                                false, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        }),
                    // TextButton(
                    //     style: ElevatedButton.styleFrom(
                    //       primary: Color(0x00000000),
                    //     ),
                    //     child: const ListTile(
                    //       title: Text('Rate My Professor'),
                    //     ),
                    //     onPressed: () {
                    //       PersistentNavBarNavigator.pushNewScreen(
                    //         context,
                    //         screen: RateMyProfessor(),
                    //         withNavBar: false, // OPTIONAL VALUE. True by default.
                    //         pageTransitionAnimation:
                    //             PageTransitionAnimation.cupertino,
                    //       );
                    //     }),
                    // TextButton(
                    //     style: ElevatedButton.styleFrom(
                    //       primary: Color(0x00000000),
                    //     ),
                    //     child: const ListTile(
                    //       title: Text('Miscellaneous'),
                    //     ),
                    //     onPressed: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => const Miscellaneous()),
                    //       );
                    //     }),
                    // TextButton(
                    //     style: ElevatedButton.styleFrom(
                    //       primary: Color(0x00000000),
                    //     ),
                    //     child: const ListTile(
                    //       title: Text('Alumni'),
                    //     ),
                    //     onPressed: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => const Alumni()),
                    //       );
                    //     }),
                    // TextButton(
                    //     style: ElevatedButton.styleFrom(
                    //       primary: Color(0x00000000),
                    //     ),
                    //     child: const ListTile(
                    //       title: Text('Senior'),
                    //     ),
                    //     onPressed: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => const Senior()),
                    //       );
                    //     }),
                    // TextButton(
                    //     style: ElevatedButton.styleFrom(
                    //       primary: Color(0x00000000),
                    //     ),
                    //     child: const ListTile(
                    //       title: Text('Junior'),
                    //     ),
                    //     onPressed: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => const Junior()),
                    //       );
                    //     }),
                    // TextButton(
                    //     style: ElevatedButton.styleFrom(
                    //       primary: Color(0x00000000),
                    //     ),
                    //     child: const ListTile(
                    //       title: Text('Sophomore'),
                    //     ),
                    //     onPressed: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => const Sophomore()),
                    //       );
                    //     }),
                    // TextButton(
                    //     style: ElevatedButton.styleFrom(
                    //       primary: Color(0x00000000),
                    //     ),
                    //     child: const ListTile(
                    //       title: Text('Freshman'),
                    //     ),
                    //     onPressed: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => const Freshman()),
                    //       );
                    //     }),
                    // TextButton(
                    //     style: ElevatedButton.styleFrom(
                    //       primary: Color(0x00000000),
                    //     ),
                    //     child: const ListTile(
                    //       title: Text('Job Search'),
                    //     ),
                    //     onPressed: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => const JobSearch()),
                    //       );
                    //     }),
                    // TextButton(
                    //     style: ElevatedButton.styleFrom(
                    //       primary: Color(0x00000000),
                    //     ),
                    //     child: const ListTile(
                    //       title: Text('Internship'),
                    //     ),
                    //     onPressed: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => const Intern()),
                    //       );
                    //     }),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
