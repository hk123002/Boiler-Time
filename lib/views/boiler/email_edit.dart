import 'package:boiler_time/views/auth/login_view.dart';
import 'package:boiler_time/views/boiler/boiler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import '../../constants/routes.dart';
import '../../services/auth/auth_exceptions.dart';
import '../../services/auth/auth_service.dart';
import '../../utilities/show_error_dialog.dart';

class EmailEdit extends StatefulWidget {
  const EmailEdit({super.key});

  @override
  State<EmailEdit> createState() => _nameEditState();
}

class _nameEditState extends State<EmailEdit> {
  late final TextEditingController _newemail;
  bool emailChangeFailed = true;
  @override
  void initState() {
    _newemail = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _newemail.dispose();
    super.dispose();
  }

  bool isObscurePassword = true;
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
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1))
                          ],
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://cdn.pixabay.com/photo/2015/04/08/07/25/fat-712246_1280.png'))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 4, color: Colors.white),
                              color: Colors.amber),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
              ),
              const SizedBox(height: 30),
              buildTextField("Email", "Type your new email", false),
              // buildTextField("Email", "Type your email address", false),
              // buildTextField("Phone Number", "Type your phone number", false),
              // buildTextField("Location", "Type your location", false),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        CupertinoPageRoute(
                          builder: (BuildContext context) {
                            return const Boiler();
                          },
                        ),
                        (route) => false,
                      );
                    },
                    // ignore: sort_child_properties_last
                    child: const Text("CANCEL",
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.black)),
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final newemail = _newemail.text;
                      if (newemail.isEmpty) {
                        await showErrorDialog(
                          context,
                          'email cant be blank',
                        );
                      } else {
                        try {
                          await FirebaseAuth.instance.currentUser
                              ?.updateEmail(newemail.trim());
                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(FirebaseAuth.instance.currentUser?.uid)
                              .set({
                            "name":
                                FirebaseAuth.instance.currentUser?.displayName,
                            "email": newemail.trim(),
                            "id": FirebaseAuth.instance.currentUser?.uid,
                            // "image": FirebaseAuth.instance.currentUser?.image,
                          });
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'email-already-in-use') {
                            await showErrorDialog(
                              context,
                              'The email is already in use',
                            );
                            emailChangeFailed = true;
                          } else if (e.code == 'invalid-email') {
                            await showErrorDialog(
                              context,
                              'invalid email',
                            );
                            emailChangeFailed = true;
                          } else {
                            await showErrorDialog(
                              context,
                              'email change failed',
                            );

                            emailChangeFailed = true;
                          }
                        }

                        if (emailChangeFailed == false) {
                          //then goes to boiler page
                          await AuthService.firebase().logOut();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            loginRoute,
                            (route) => false,
                          );
                        }
                      }
                    },
                    // ignore: sort_child_properties_last
                    child: const Text("SAVE",
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
        controller: _newemail,
        keyboardType: TextInputType.emailAddress,
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.remove_red_eye, color: Colors.grey),
                  )
                : null,
            contentPadding: const EdgeInsets.only(bottom: 5),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
      ),
    );
  }
}
