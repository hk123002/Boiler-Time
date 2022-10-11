import 'package:boiler_time/constants/routes.dart';
import 'package:boiler_time/services/auth/auth_exceptions.dart';
import 'package:boiler_time/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import '../../utilities/show_error_dialog.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1))
                      ],
                      shape: BoxShape.circle,
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
