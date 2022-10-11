import 'package:boiler_time/constants/routes.dart';
import 'package:boiler_time/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import '../../enums/menu_action.dart';

class Market extends StatefulWidget {
  const Market({super.key});

  @override
  State<Market> createState() => _martketViewState();
}

class _martketViewState extends State<Market> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('chat'),
      ),
    );
  }
}
