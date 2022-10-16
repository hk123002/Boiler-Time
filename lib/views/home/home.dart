import 'package:boiler_time/constants/routes.dart';
import 'package:boiler_time/services/auth/auth_service.dart';
import 'package:boiler_time/views/home/about/academic_schedule.dart';
import 'package:boiler_time/views/home/about/bus_schedule.dart';
import 'package:boiler_time/views/home/about/dining_menu.dart';
import 'package:boiler_time/views/home/about/library_schedule.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import '../../enums/menu_action.dart';
import '../main_view.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeViewState();
}

class _homeViewState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.bus_alert),
              iconSize: 50.0,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BusSchedule()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.school),
              iconSize: 50.0,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LibraryTime()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.dining),
              iconSize: 50.0,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DiningMenu()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.schedule),
              iconSize: 50.0,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AcademicSchedule()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.ad_units),
              iconSize: 50.0,
              onPressed: () async {
                //brightspace
              },
            ),
          ],
        ),
      ]),
    );
  }
}
