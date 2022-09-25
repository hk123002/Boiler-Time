import 'package:corn_market/constants/routes.dart';
import 'package:corn_market/services/auth/auth_exceptions.dart';
import 'package:corn_market/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import '../../utilities/show_error_dialog.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  late final TextEditingController _email;
  @override
  void initState() {
    _email = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  bool emailSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
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
          TextButton(
            onPressed: () async {
              final email = _email.text;

              try {
                await AuthService.firebase().sendPasswordReset(toEmail: email);
                setState(
                  () => emailSent = true,
                );
              } on UserNotFoundAuthException {
                await showErrorDialog(
                  context,
                  'User not found',
                );
              } on GenericAuthException {
                await showErrorDialog(
                  context,
                  'Email not found',
                );
              }
            },
            child: emailSent
                ? Text('Haven\'t got the code yet? Resend')
                : Text('Send password reset link to your email'),
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
