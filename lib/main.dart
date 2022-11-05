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
      //   primary: Color.fromARGB(255, 193, 155, 200),

      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        surface: Color.fromARGB(169, 52, 45, 53),
        onSurface: Colors.black,
        // Colors that are not relevant to AppBar in DARK mode:
        primary: Color.fromARGB(255, 204, 170, 210),
        onPrimary: Colors.white,
        primaryVariant: Colors.black,
        secondary: Color.fromARGB(255, 204, 170, 210),
        secondaryVariant: Colors.orange,
        onSecondary: Colors.white,
        background: Colors.green,
        onBackground: Colors.grey,
        error: Colors.purple,
        onError: Colors.black,
      ),
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
