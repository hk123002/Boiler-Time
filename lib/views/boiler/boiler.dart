import 'package:boiler_time/constants/routes.dart';
import 'package:boiler_time/services/auth/auth_exceptions.dart';
import 'package:boiler_time/services/auth/auth_service.dart';
import 'package:boiler_time/views/boiler/email_edit.dart';
import 'package:boiler_time/views/boiler/name_edit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

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
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
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

                      // button for image edit button

                      // ),
                      // Positioned(
                      //     bottom: 0,
                      //     right: 0,
                      //     child: Container(
                      //       height: 40,
                      //       width: 40,
                      //       decoration: BoxDecoration(
                      //           shape: BoxShape.circle,
                      //           border: Border.all(width: 4, color: Colors.white),
                      //           color: Colors.amber),
                      //       child: Icon(
                      //         Icons.edit,
                      //         color: Colors.white,
                      //       ),
                      //     ))
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Text("Hello, World!    " + name.toString()),
              Text(email.toString()),
              const SizedBox(height: 30),
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
                  // Navigator.of(context).pushNamedAndRemoveUntil(
                  //   editprofileRoute,
                  //   (route) => false,
                  // );
                },
                child: const Text("Edit name"),
              ),

              //edit email button on development

              // TextButton(
              //   onPressed: () {
              //     Navigator.of(context).pushAndRemoveUntil(
              //       CupertinoPageRoute(
              //         builder: (BuildContext context) {
              //           return const EmailEdit();
              //         },
              //       ),
              //       (route) => false,
              //     );
              //     // Navigator.of(context).pushNamedAndRemoveUntil(
              //     //   editprofileRoute,
              //     //   (route) => false,
              //     // );
              //   },
              //   child: const Text("Edit email"),
              // ),
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
