import 'package:boiler_time/constants/routes.dart';
import 'package:boiler_time/services/auth/auth_exceptions.dart';
import 'package:boiler_time/services/auth/auth_service.dart';
import 'package:boiler_time/views/boiler/profile_edit.dart';
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

  @override
  void initState() {
    _getUserData(context);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _getUserData(BuildContext context) async {
    setState(() async {
      var collection = FirebaseFirestore.instance.collection('users');

      var docSnapshot =
          await collection.doc(FirebaseAuth.instance.currentUser?.uid).get();

      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data()!;

        // You can then retrieve the value from the Map like this:
        name = data['name'] as String;

        email = data['email'] as String;

        devtools.log(name.toString());
        devtools.log(email.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _getUserData(context);
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
              Text(name.toString()),
              Text(email.toString()),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    CupertinoPageRoute(
                      builder: (BuildContext context) {
                        return const Profile();
                      },
                    ),
                    (route) => false,
                  );
                  // Navigator.of(context).pushNamedAndRemoveUntil(
                  //   editprofileRoute,
                  //   (route) => false,
                  // );
                },
                child: const Text("Edit profile"),
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

//   Widget buildTextField(

//       String labelText, String placeholder, bool isPasswordTextField) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 30),
//       child: TextField(
//         obscureText: isPasswordTextField ? isObscurePassword : false,
//         decoration: InputDecoration(
//             suffixIcon: isPasswordTextField
//                 ? IconButton(
//                     onPressed: () {},
//                     icon: const Icon(Icons.remove_red_eye, color: Colors.grey),
//                   )
//                 : null,
//             contentPadding: const EdgeInsets.only(bottom: 5),
//             labelText: labelText,
//             floatingLabelBehavior: FloatingLabelBehavior.always,
//             hintText: placeholder,
//             // ignore: prefer_const_constructors
//             hintStyle: TextStyle(
//                 fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
//       ),
//     );
//   }
// }
}
