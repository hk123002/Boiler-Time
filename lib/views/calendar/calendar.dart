import 'dart:math';

import 'package:boiler_time/constants/routes.dart';
import 'package:boiler_time/services/auth/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import '../../enums/menu_action.dart';
import 'package:time_planner/time_planner.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<Calendar> {
  List<TimePlannerTask> tasks = [];

  final _firestore = FirebaseFirestore.instance
      .collection('calendar')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .snapshots();

  //add new schedule
  void _addObject(BuildContext context) {
    List<Color?> colors = [
      Colors.purple,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.lime[600]
    ];

    setState(() {
      tasks.add(
        TimePlannerTask(
          color: colors[Random().nextInt(colors.length)],
          dateTime: TimePlannerDateTime(day: 2, hour: 12, minutes: 30),
          minutesDuration: 90,
          daysDuration: 1,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('You click on time planner object')));
          },
          child: Text(
            'this is a demo',
            style: TextStyle(color: Colors.grey[350], fontSize: 12),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    print("----------------------");

    print(_firestore.toString());

    print("----------------------");
    return Scaffold(
      body: Center(
        child: TimePlanner(
          startHour: 7,
          endHour: 18,
          style: TimePlannerStyle(
            cellHeight: 40,
            cellWidth: 59,
            showScrollBar: false,
          ),
          headers: const [
            TimePlannerTitle(
              title: "Mon",
            ),
            TimePlannerTitle(
              title: "Tue",
            ),
            TimePlannerTitle(
              title: "Wed",
            ),
            TimePlannerTitle(
              title: "Thr",
            ),
            TimePlannerTitle(
              title: "Fri",
            ),
          ],
          tasks: tasks,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addObject(context),
        tooltip: 'Add schedule',
        child: const Icon(Icons.add),
      ),
    );
  }
}
  

  // FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(FirebaseAuth.instance.currentUser?.uid)
  //         .get()
  //         .then((DocumentSnapshot documentSnapshot) {
  //       if (documentSnapshot.exists) {
  //         print('Document data: ${documentSnapshot.data()}');
  //       } else {
  //         print('Document does not exist on the database');
  //       }