import 'package:corn_market/constants/routes.dart';
import 'package:corn_market/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import '../../enums/menu_action.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _chatViewState();
}

class _chatViewState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('chat'),
      ),
    );
  }
}
