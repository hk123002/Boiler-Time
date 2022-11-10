import 'package:boiler_time/constants/routes.dart';
import 'package:boiler_time/services/auth/auth_exceptions.dart';
import 'package:boiler_time/services/auth/auth_service.dart';
import 'package:boiler_time/services/auth/firebase_auth_provider.dart';
import 'package:boiler_time/views/auth/forgot_password_view.dart';
import 'package:boiler_time/views/auth/register_view.dart';
import 'package:boiler_time/views/auth/verify_email_view.dart';
import 'package:boiler_time/views/main_view.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../utilities/show_error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(
                top: 50.0, bottom: 20.0, left: 10, right: 10),
            padding: const EdgeInsets.all(3.0),
            // decoration: BoxDecoration(
            //   border: Border.all(color: Color.fromARGB(255, 131, 124, 132)),
            //   borderRadius: BorderRadius.all(Radius.circular(
            //           15.0) //                 <--- border radius here
            //       ),
            // ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Center(
                      child: Container(
                          width: 300,
                          height: 150,
                          /*decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(50.0)),*/
                          child: Image.asset(
                            'assets/boilertime_banner.png',
                          )),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    //padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      controller: _email,
                      enableSuggestions: false,
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Enter valid email as hello@gmail.com'),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    child: TextField(
                      controller: _password,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter secure password'),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 204, 170, 210),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () async {
                      Scaffold(
                        body: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Image.asset(
                            'assets/splash.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                      final email = _email.text;
                      final password = _password.text;

                      try {
                        await AuthService.firebase().logIn(
                          email: email,
                          password: password,
                        );
                        final user = FirebaseAuthProvider().currentUser;
                        if (user?.isEmailVerified ?? false) {
                          //write to users document
                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(FirebaseAuth.instance.currentUser?.uid)
                              .set({
                            "name":
                                FirebaseAuth.instance.currentUser?.displayName,
                            "email": FirebaseAuth.instance.currentUser?.email,
                            "id": FirebaseAuth.instance.currentUser?.uid,
                          });

                          Future getCalendar() async {
                            var a = await FirebaseFirestore.instance
                                .collection('calendar')
                                .doc(FirebaseAuth.instance.currentUser?.uid)
                                .get();
                            if (a.exists) {
                              devtools.log('Exists');
                            }
                            if (!a.exists) {
                              await FirebaseFirestore.instance
                                  .collection('calendar')
                                  .doc(FirebaseAuth.instance.currentUser?.uid)
                                  .set({"schedule": []});
                            }
                          }

                          getCalendar();

                          // if user is verified
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            mainRoute,
                            (route) => false,
                          );
                        } else {
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerifyEmailView()),
                          );
                        }
                      } on UserNotFoundAuthException {
                        await showErrorDialog(
                          context,
                          'User not found',
                        );
                      } on WrongPasswordAuthException {
                        await showErrorDialog(
                          context,
                          'Wrong password',
                        );
                      } on GenericAuthException {
                        await showErrorDialog(
                          context,
                          'Authentication error',
                        );
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordView()),
                    );
                  },
                  child: const Text("Forgot password?"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterView()),
                    );
                  },
                  child: const Text("New User? Create Account"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
