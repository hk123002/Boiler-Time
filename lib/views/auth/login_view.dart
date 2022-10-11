import 'package:corn_market/constants/routes.dart';
import 'package:corn_market/services/auth/auth_exceptions.dart';
import 'package:corn_market/services/auth/auth_service.dart';
import 'package:corn_market/services/auth/firebase_auth_provider.dart';
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
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: 'Email'),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(hintText: 'Password'),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;

              try {
                await AuthService.firebase().logIn(
                  email: email,
                  password: password,
                );
                final user = FirebaseAuthProvider().currentUser;
                if (user?.isEmailVerified ?? false) {
                  CollectionReference users =
                      FirebaseFirestore.instance.collection('users');

                  if (checkIfuserexist(user?.id) == false) {
                    devtools.log("user doesn't exist, writing on database");
                  }

                  // if user is verified
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    mainRoute,
                    (route) => false,
                  );
                } else {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    verifyEmailRoute,
                    (route) => false,
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
            child: const Text('Login'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                forgotPasswordRoute,
                (route) => false,
              );
            },
            child: const Text("Forgot password?"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                registerRoute,
                (route) => false,
              );
            },
            child: const Text("Signup"),
          ),
        ],
      ),
    );
  }
}

/// Check If user Exists in the databsae
Future<bool> checkIfuserexist(String? uid) async {
  // Get reference to Firestore collection
  var collectionRef = FirebaseFirestore.instance.collection('users');

  var doc = await collectionRef.doc(uid).get();
  if (doc.exists) {
    return true;
  } else {
    return false;
  }
}
