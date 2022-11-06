import 'package:boiler_time/constants/routes.dart';
import 'package:boiler_time/services/auth/auth_service.dart';
import 'package:boiler_time/views/auth/forgot_password_view.dart';
import 'package:boiler_time/views/auth/login_view.dart';
import 'package:boiler_time/views/main_view.dart';
import 'package:boiler_time/views/auth/register_view.dart';
import 'package:boiler_time/views/auth/verify_email_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    title: 'Boiler Time Demo',
    theme: ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.dark,

      // primaryColor: Colors.lightBlue[800],

      // Define the default font family.
      // fontFamily: 'Georgia',

      // Define the default `TextTheme`. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      // textTheme: const TextTheme(
      //   headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      //   headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      //   bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      // ),
    ),
    home: const HomePage(),
    routes: {
      loginRoute: (context) => const LoginView(),
      registerRoute: (context) => const RegisterView(),
      mainRoute: (context) => const MainView(index: 0),
      verifyEmailRoute: (context) => const VerifyEmailView(),
      forgotPasswordRoute: ((context) => const ForgotPasswordView()),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              devtools.log(user.toString());
              if (user.isEmailVerified) {
                return const MainView(index: 0);
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }
          default:
            return Scaffold(
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  'assets/splash.png',
                  fit: BoxFit.cover,
                ),
              ),
            );
        }
      },
    );
  }
}
