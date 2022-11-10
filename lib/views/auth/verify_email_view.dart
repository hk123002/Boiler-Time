import 'dart:async';

import 'package:boiler_time/constants/routes.dart';
import 'package:boiler_time/services/auth/auth_service.dart';
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
      appBar: AppBar(
        toolbarHeight: 40,
        title: const Text('Verify Email'),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "We've sent you an email verification.\nPlease verifiy your account with you email.",
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(
            height: 20,
          ),
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
