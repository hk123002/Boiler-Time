import 'package:boiler_time/constants/routes.dart';
import 'package:boiler_time/main.dart';
import 'package:boiler_time/services/auth/auth_exceptions.dart';
import 'package:boiler_time/services/auth/auth_service.dart';
import 'package:boiler_time/views/auth/login_view.dart';
import 'package:boiler_time/views/boiler/email_edit.dart';
import 'package:boiler_time/views/boiler/name_edit.dart';
import 'package:boiler_time/views/main_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import '../../enums/menu_action.dart';

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
        toolbarHeight: 40,
        leading: Icon(Icons.stop_circle_outlined),
        // title: Text(
        //   "Purdue Univ",
        //   style: TextStyle(fontStyle: FontStyle.italic),
        // ),
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
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 20),
              Center(child: Text(email.toString())),
              const SizedBox(height: 30),
              Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                        // color: Color.fromARGB(255, 131, 124, 132),
                        ),
                    borderRadius: BorderRadius.all(Radius.circular(
                            5.0) //                 <--- border radius here
                        ),
                  ),
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Account",
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              CupertinoPageRoute(
                                builder: (BuildContext context) {
                                  return const NameEdit();
                                },
                              ),
                              (route) => false,
                            );
                          },
                          child: Text(
                            "Edit Name",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            // await AuthService.firebase()
                            //     .sendPasswordReset(toEmail: email);
                          },
                          child: Text(
                            "Edit Password",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            final shouldLogout =
                                await showLogOutDialog(context);
                            if (shouldLogout) {
                              await AuthService.firebase().logOut();
                              Navigator.of(context, rootNavigator: true)
                                  .pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return LoginView();
                                  },
                                ),
                                (_) => false,
                              );
                            }
                          },
                          child: const Text("log out"),
                        ),
                      ])),
              Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                        // color: Color.fromARGB(255, 131, 124, 132),
                        ),
                    borderRadius: BorderRadius.all(Radius.circular(
                            5.0) //                 <--- border radius here
                        ),
                  ),
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Developers",
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "App version",
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "About",
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ])),
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
          content: const Text('Are you sure you want to sign out?'),
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
