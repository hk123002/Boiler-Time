import 'dart:async';

import 'package:corn_market/constants/routes.dart';
import 'package:corn_market/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    //     await AuthService.firebase().currentUser?.reload();
    // final user = AuthService.firebase().currentUser;
    // if (user?.isEmailVerified ?? false) {
    //   timer.cancel();
    //   print('verified');
    //   if (user?.isEmailVerified ?? false) {
    //     Navigator.of(context).pushNamedAndRemoveUntil(
    //       mainRoute,
    //       (route) => false,
    //     );
    //   }
    // }
    return Scaffold(
      appBar: AppBar(title: const Text('Verify Email')),
      body: Column(
        children: [
          const Text(
              "We've sent you an email verification. Please verifiy your account with you email."),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().sendEmailVerification();
              final user = AuthService.firebase().currentUser;

              devtools.log(user.toString());
            },
            child: const Text('resend email verification'),
          ),
          TextButton(
              onPressed: () async {
                await AuthService.firebase().logOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  loginRoute,
                  (route) => false,
                );
              },
              child: const Text('Go Back to Log in')),
        ],
      ),
    );
  }
}
