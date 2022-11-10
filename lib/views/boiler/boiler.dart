import 'package:boiler_time/constants/routes.dart';
import 'package:boiler_time/main.dart';
import 'package:boiler_time/services/auth/auth_exceptions.dart';
import 'package:boiler_time/services/auth/auth_service.dart';
import 'package:boiler_time/views/auth/login_view.dart';
import 'package:boiler_time/views/boiler/developers.dart';
import 'package:boiler_time/views/boiler/email_edit.dart';
import 'package:boiler_time/views/boiler/name_edit.dart';
import 'package:boiler_time/views/main_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'dart:developer' as devtools show log;

import '../../enums/menu_action.dart';
import '../../utilities/show_error_dialog.dart';
import '../community/myPost.dart';

class Boiler extends StatefulWidget {
  const Boiler({super.key});

  @override
  State<Boiler> createState() => _BoilerState();
}

class _BoilerState extends State<Boiler> {
  bool isObscurePassword = true;
  String? name;
  String? email;

  void _getUserData() async {
    var collection = FirebaseFirestore.instance.collection('users');

    var docSnapshot =
        await collection.doc(FirebaseAuth.instance.currentUser?.uid).get();

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;

      // You can then retrieve the value from the Map like this:

      setState(() {
        name = data['name'];

        email = data['email'];
      });

      devtools.log(name.toString());
      devtools.log(email.toString());
    }
  }

  @override
  void initState() {
    super.initState();

    _getUserData();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1))
                          ],
                          shape: BoxShape.circle,
                          // ignore: prefer_const_constructors
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: const NetworkImage(
                                  'https://cdn.pixabay.com/photo/2015/04/08/07/25/fat-712246_1280.png'))),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Text(
                  name.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  email.toString(),
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Account

              Container(
                  // width: 10000,
                  // margin: const EdgeInsets.all(15.0),
                  // padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 40, 40, 40),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(
                            5.0) //                 <--- border radius here
                        ),
                  ),
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 22,
                            ),
                            Text(
                              "Account",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.person_add,
                              size: 20,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                          child: TextButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0x00000000),
                              ),
                              child: const ListTile(
                                  title: Text(
                                'My posts',
                                style: TextStyle(fontSize: 15),
                              )),
                              onPressed: () {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: MyPost(),
                                  withNavBar:
                                      false, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              }),
                        ),
                        SizedBox(
                          height: 50,
                          child: TextButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0x00000000),
                              ),
                              child: const ListTile(
                                  title: Text(
                                'Change name',
                                style: TextStyle(fontSize: 15),
                              )),
                              onPressed: () {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: NameEdit(),
                                  withNavBar:
                                      false, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              }),
                        ),
                        SizedBox(
                          height: 50,
                          child: TextButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0x00000000),
                              ),
                              child: const ListTile(
                                title: Text(
                                  'Change password',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              onPressed: () async {
                                editPasswordConfirm(context);
                              }),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ])),
              SizedBox(
                height: 10,
              ),

              //about

              Container(
                  // width: 10000,
                  // margin: const EdgeInsets.all(15.0),
                  // padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 40, 40, 40),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(
                            5.0) //                 <--- border radius here
                        ),
                  ),
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 22,
                            ),
                            Text(
                              "About",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.info,
                              size: 20,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                          child: TextButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0x00000000),
                              ),
                              child: ListTile(
                                title: Row(
                                  children: [
                                    Text(
                                      'App version',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      '  v 0.0.1',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white.withOpacity(0.5)),
                                    ),
                                  ],
                                ),
                              ),
                              onPressed: () {}),
                        ),
                        SizedBox(
                          height: 50,
                          child: TextButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0x00000000),
                              ),
                              child: const ListTile(
                                title: Text(
                                  'Developers',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              onPressed: () {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: Developers(),
                                  withNavBar:
                                      false, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              }),
                        ),
                        SizedBox(
                          height: 50,
                          child: TextButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0x00000000),
                            ),
                            child: const ListTile(
                              title: Text(
                                'Github',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ])),
              SizedBox(
                height: 30,
              ),
              FloatingActionButton.extended(
                onPressed: () async {
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
                },
                icon: Icon(Icons.logout_outlined),
                label: Text("Log out"),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Sign out'),
          content: const Text(
            'Do you want to sign out?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('Log out'))
          ],
        );
      }).then((value) => value ?? false);
}

Future<bool> editPasswordConfirm(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Change password'),
          content: const Text(
            'Do you want change your password?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
                onPressed: () async {
                  var email = FirebaseAuth.instance.currentUser?.email;
                  await AuthService.firebase()
                      .sendPasswordReset(toEmail: email.toString());
                  Navigator.of(context).pop(true);

                  editEmailDialog(context);
                },
                child: const Text('Yes'))
          ],
        );
      }).then((value) => value ?? false);
}

Future<bool> editEmailDialog(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          // title: const Text('Sign out'),
          content: const Text(
              'Password reset email has been sent to the email, Please check your email'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('close'),
            ),
          ],
        );
      }).then((value) => value ?? false);
}
