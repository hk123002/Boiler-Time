import 'package:corn_market/constants/routes.dart';
import 'package:corn_market/services/auth/auth_service.dart';
import 'package:corn_market/views/forgot_password_view.dart';
import 'package:corn_market/views/login_view.dart';
import 'package:corn_market/views/main_view.dart';
import 'package:corn_market/views/register_view.dart';
import 'package:corn_market/views/verify_email_view.dart';

import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    title: 'Corn Market Demo',
    theme: ThemeData(
      primarySwatch: Colors.deepOrange,
    ),
    home: const HomePage(),
    routes: {
      loginRoute: (context) => const LoginView(),
      registerRoute: (context) => const RegisterView(),
      mainRoute: (context) => const MainView(),
      verifyEmailRoute: (context) => const VerifyEmailView(),
      forgotPasswordRoute: ((context) => const ForgotPasswordView())
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
                return const MainView();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
