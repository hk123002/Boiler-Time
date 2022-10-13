import 'dart:math';

import 'package:boiler_time/constants/routes.dart';
import 'package:boiler_time/services/auth/auth_service.dart';
import 'package:boiler_time/views/calendar/schedule_edit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import '../../enums/menu_action.dart';
import 'package:time_planner/time_planner.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../utilities/show_error_dialog.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<Calendar> {
  List<TimePlannerTask> tasks = [];
  late final TextEditingController _className;
  String? selectedDay;
  String? selectedStartTime;
  String? selectedEndTime;

  @override
  void initState() {
    _intialize(context);

    _className = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _className.dispose();
    super.dispose();
  }

  //add new schedule
  void _addObject(BuildContext context) {
    List<Color?> colors = [
      Colors.purple,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.lime[600]
    ];

    late int day; // day (monday = 0, tuesday = 1, etc...)
    late List<int> startHourmin; // in format of [hour, min]
    late List<String> startHourminStr; // string arr of [hour, min]
    late List<int> endHourmin;
    late List<String> endHourminStr;
    late int duration;

    if (selectedDay == 'monday') {
      day = 0;
    } else if (selectedDay == 'tuesday') {
      day = 1;
    } else if (selectedDay == 'wednesday') {
      day = 2;
    } else if (selectedDay == 'thursday') {
      day = 3;
    } else if (selectedDay == 'friday') {
      day = 4;
    }

    devtools.log(day.toString());

    startHourminStr = selectedStartTime.toString().split(":");

    startHourmin = startHourminStr.map(int.parse).toList();

    if (startHourmin[0] < 7) {
      startHourmin[0] += 12;
    }

    endHourminStr = selectedEndTime.toString().split(":");

    endHourmin = endHourminStr.map(int.parse).toList();

    if (endHourmin[0] < 7) {
      endHourmin[0] += 12;
    }
    duration = (endHourmin[0] * 60 + endHourmin[1]) -
        (startHourmin[0] * 60 + startHourmin[1]);

    String dbData =
        "${_className.text}: $day:${startHourmin[0]}:${startHourmin[1]}:$duration";

    FirebaseFirestore.instance
        .collection('calendar')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update({
      "schedule": FieldValue.arrayUnion([dbData])
    });

    setState(() {
      tasks.add(
        TimePlannerTask(
          color: colors[Random().nextInt(colors.length)],
          dateTime: TimePlannerDateTime(
              day: day, hour: startHourmin[0], minutes: startHourmin[1]),
          minutesDuration: duration,
          onTap: () {},
          child: Text(
            _className.text,
            // style: TextStyle(color: Colors.grey[350], fontSize: 12),
          ),
        ),
      );
    });
  }

  Future<void> _intialize(BuildContext context) async {
    List<Color?> colors = [
      Colors.purple,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.lime[600]
    ];

    devtools.log("--------------------------");
    var collection = FirebaseFirestore.instance.collection('calendar');

    var docSnapshot =
        await collection.doc(FirebaseAuth.instance.currentUser?.uid).get();

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;

      // You can then retrieve the value from the Map like this:
      var schedule = data['schedule'];
      for (String item in schedule) {
        devtools.log(item);

        var split = item.split(":");

        String schedule = split[0];
        int day = int.parse(split[1]);
        int hour = int.parse(split[2]);
        int minute = int.parse(split[3]);
        int duration = int.parse(split[4]);

        setState(() {
          tasks.add(
            TimePlannerTask(
              color: colors[Random().nextInt(colors.length)],
              dateTime:
                  TimePlannerDateTime(day: day, hour: hour, minutes: minute),
              minutesDuration: duration,
              onTap: () {},
              child: Text(
                schedule,
                // style: TextStyle(color: Colors.grey[350], fontSize: 12),
              ),
            ),
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
        onPressed: () => showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            final List<String> day = [
              'monday',
              'tuesday',
              'wednesday',
              'thursday',
              'friday',
            ];
            final List<String> startTime = [
              '7:30',
              '8:30',
              '9:30',
              '10:30',
              '11:30',
              '12:30',
              '1:30',
              '2:30',
              '3:30',
              '4:30',
              '5:30',
            ];

            final List<String> endTime = [
              '7:20',
              '8:20',
              '9:20',
              '10:20',
              '11:20',
              '12:20',
              '1:20',
              '2:20',
              '3:20',
              '4:20',
              '5:20',
            ];
            return StatefulBuilder(builder: (context, setState) {
              return AlertDialog(
                title: const Text('Add new schedule'),
                content: ListView(shrinkWrap: true, children: [
                  TextFormField(
                    controller: _className,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Class Name',
                    ),
                  ),
                  DropdownButtonHideUnderline(
                      child: DropdownButton2(
                    hint: const Text("Day"),
                    items: day
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                    // fontSize: 14,
                                    ),
                              ),
                            ))
                        .toList(),
                    value: selectedDay,
                    onChanged: (value) {
                      setState(() {
                        selectedDay = value as String;
                      });
                      devtools.log(selectedDay.toString());
                    },
                    buttonHeight: 40,
                    buttonWidth: 140,
                    itemHeight: 40,
                  )),
                  DropdownButtonHideUnderline(
                      child: DropdownButton2(
                    hint: Text(
                      'Start Time',
                      style: TextStyle(
                        // fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: startTime
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                    // fontSize: 14,
                                    ),
                              ),
                            ))
                        .toList(),
                    value: selectedStartTime,
                    onChanged: (value) {
                      setState(() {
                        selectedStartTime = value as String;
                      });
                      devtools.log(selectedStartTime.toString());
                    },
                    buttonHeight: 40,
                    buttonWidth: 140,
                    itemHeight: 40,
                  )),
                  DropdownButtonHideUnderline(
                      child: DropdownButton2(
                    hint: Text(
                      'End Time',
                      style: TextStyle(
                        // fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: endTime
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                    // fontSize: 14,
                                    ),
                              ),
                            ))
                        .toList(),
                    value: selectedEndTime,
                    onChanged: (value) {
                      setState(() {
                        selectedEndTime = value as String;
                      });
                      devtools.log(selectedEndTime.toString());
                    },
                    buttonHeight: 40,
                    buttonWidth: 140,
                    itemHeight: 40,
                  )),
                ]),
                actions: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text('Save'),
                    onPressed: () {
                      _addObject(context);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
          },
        ),
        tooltip: 'Add schedule',
        child: const Icon(Icons.add),
      ),
    );
  }
}




// class DialogExample extends StatelessWidget {
//   const DialogExample({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () => showDialog<String>(
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//           title: const Text('AlertDialog Title'),
//           content: const Text('AlertDialog description'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () => Navigator.pop(context, 'Cancel'),
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () => Navigator.pop(context, 'OK'),
//               child: const Text('OK'),
//             ),
//           ],
//         ),
//       ),
//       child: const Text('Show Dialog'),
//     );
//   }
// }
