import 'package:boiler_time/views/boiler/boiler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import '../../enums/menu_action.dart';
import '../../services/auth/auth_service.dart';
import '../../utilities/show_error_dialog.dart';

class NameEdit extends StatefulWidget {
  const NameEdit({super.key});

  @override
  State<NameEdit> createState() => _nameEditState();
}

class _nameEditState extends State<NameEdit> {
  late final TextEditingController _newname;
  @override
  void initState() {
    _newname = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _newname.dispose();
    super.dispose();
  }

  bool isObscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: const Text('Edit name'),
      ),
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
                              color: Color.fromARGB(255, 193, 155, 200)),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
              ),
              const SizedBox(height: 30),
              buildTextField("Full Name", "Type your name", false),
              // buildTextField("Email", "Type your email address", false),
              // buildTextField("Phone Number", "Type your phone number", false),
              // buildTextField("Location", "Type your location", false),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop(context);
                    },
                    // ignore: sort_child_properties_last
                    child: const Text("CANCEL",
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                        )),
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final newname = _newname.text;

                      if (newname.isEmpty) {
                        await showErrorDialog(
                          context,
                          'name cant be blank',
                        );
                      } else {
                        await FirebaseAuth.instance.currentUser
                            ?.updateDisplayName(newname);
                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(FirebaseAuth.instance.currentUser?.uid)
                            .set({
                          "name": newname,
                          "email": FirebaseAuth.instance.currentUser?.email,
                          "id": FirebaseAuth.instance.currentUser?.uid,
                          // "image": FirebaseAuth.instance.currentUser?.image,
                        });

                        //then goes to boiler page
                        Navigator.of(context).pushAndRemoveUntil(
                          CupertinoPageRoute(
                            builder: (BuildContext context) {
                              return const Boiler();
                            },
                          ),
                          (route) => false,
                        );
                      }
                    },
                    // ignore: sort_child_properties_last
                    child: const Text("SAVE",
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                        )),
                    style: ElevatedButton.styleFrom(
                        // backgroundColor: Color.fromARGB(255, 193, 155, 200),
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
        controller: _newname,
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
