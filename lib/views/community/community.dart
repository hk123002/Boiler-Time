import 'package:boiler_time/constants/routes.dart';
import 'package:boiler_time/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;
import 'package:boiler_time/views/widgets/postcards.dart';

import '../../enums/menu_action.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _communityState();
}

class _communityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return PostCard();
        },
      ),
    );
  }
}
// class Community extends StatelessWidget {
//   const Community({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Community"),
//       ),
//       body: ListView.builder(
//         itemCount: 5,
//         itemBuilder: (BuildContext context, int index) {
//           return PostCard();
//         },
//       ),
//     );
//   }
// }
