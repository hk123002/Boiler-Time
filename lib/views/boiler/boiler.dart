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
  @override
  Widget build(BuildContext context) {
    // CollectionReference _collectionRef =
    //     FirebaseFirestore.instance.collection('users');

    // Future<void> getData() async {
    //   // Get docs from collection reference
    //   QuerySnapshot querySnapshot = await _collectionRef.get();

    //   // Get data from docs and convert map to List
    //   final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    //   print(allData);
    // }

    // var user = getData();
    // print("===================================");
    // getData();

    //하다가 맘.. 유저 정보 불러와서 입력하는거 해야함

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
              const Text("Name"),
              const Text("Name"),
              const Text("Name"),
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

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
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
            // ignore: prefer_const_constructors
            hintStyle: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
      ),
    );
  }
}
