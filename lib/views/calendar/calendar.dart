import 'dart:math';

import 'package:boiler_time/constants/routes.dart';
import 'package:boiler_time/services/auth/auth_service.dart';
import 'package:boiler_time/views/main_view.dart';
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
  // Duration get transitionDuration => const Duration(milliseconds: 0);
  @override
  State<Calendar> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<Calendar> {
  List<TimePlannerTask> tasks = [];
  late final TextEditingController _className;
  String? selectedDay;
  String? selectedStartTime;
  String? selectedEndTime;
  final List<String> dayConstant = [
    'monday',
    'tuesday',
    'wednesday',
    'thursday',
    'friday',
  ];
  final List<String> startTimeConstant = [
    '7:30',
    '8:30',
    '9:00',
    '9:30',
    '10:30',
    '11:30',
    '12:00',
    '12:30',
    '1:30',
    '2:30',
    '3:00',
    '3:30',
    '4:30',
    '5:30',
  ];

  final List<String> endTimeConstant = [
    '7:15',
    '7:20',
    '7:45',
    '8:15',
    '8:20',
    '8:45',
    '9:15',
    '9:20',
    '9:45',
    '10:15',
    '10:20',
    '10:45',
    '11:15',
    '11:20',
    '11:45',
    '12:15',
    '12:20',
    '12:45',
    '1:15',
    '1:20',
    '1:45',
    '2:15',
    '2:20',
    '2:45',
    '3:15',
    '3:20',
    '3:45',
    '4:15',
    '4:20',
    '4:45',
    '5:15',
    '5:20',
    '5:45',
  ];
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
          onTap: () => {},
          child: Text(
            _className.text,
            // style: TextStyle(color: Colors.grey[350], fontSize: 12),
          ),
        ),
      );
    });

    _className.text = "";
    selectedDay = null;
    selectedEndTime = null;
    selectedStartTime = null;
  }

  void _editObject(
    BuildContext context,
    String classNameHint,
    int dayHint,
    String startTimeHint,
    String endTimeHint,
  ) {
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

    // if selectedday is null, it is set to hint
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
    } else {
      day = dayHint;
    }

    devtools.log(day.toString());

    // if selected is null, set to hint
    if (selectedStartTime != null) {
      startHourminStr = selectedStartTime.toString().split(":");
    } else {
      startHourminStr = startTimeHint.toString().split(":");
    }
    startHourmin = startHourminStr.map(int.parse).toList();

    if (startHourmin[0] < 7) {
      startHourmin[0] += 12;
    }

    if (selectedEndTime != null) {
      endHourminStr = selectedEndTime.toString().split(":");
    } else {
      endHourminStr = endTimeHint.toString().split(":");
    }
    endHourmin = endHourminStr.map(int.parse).toList();

    if (endHourmin[0] < 7) {
      endHourmin[0] += 12;
    }
    duration = (endHourmin[0] * 60 + endHourmin[1]) -
        (startHourmin[0] * 60 + startHourmin[1]);

    devtools
        .log("class name text in _editOBject-----------------------------\n");
    devtools.log(_className.text);
    devtools
        .log("class name text in _editOBject-----------------------------\n");

    if (_className.text == "") {
      devtools.log("class name empty in editobject");
      _className.text = classNameHint;
    }

    String dbData =
        "${_className.text}: $day:${startHourmin[0]}:${startHourmin[1]}:$duration";

    FirebaseFirestore.instance
        .collection('calendar')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update({
      "schedule": FieldValue.arrayUnion([dbData])
    });

    // setState(() {
    //   tasks.add(
    //     TimePlannerTask(
    //       color: colors[Random().nextInt(colors.length)],
    //       dateTime: TimePlannerDateTime(
    //           day: day, hour: startHourmin[0], minutes: startHourmin[1]),
    //       minutesDuration: duration,
    //       onTap: () => {},
    //       child: Text(
    //         _className.text,
    //         // style: TextStyle(color: Colors.grey[350], fontSize: 12),
    //       ),
    //     ),
    //   );
    // });

    _className.text = "";
    selectedDay = null;
    selectedEndTime = null;
    selectedStartTime = null;
  }

  Future<void> _intialize(BuildContext context) async {
    tasks.clear();
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

        // a hint for update/delete
        String classNameHint = schedule;
        String dayHint;

        if (day == 0) {
          dayHint = 'monday';
        } else if (day == 1) {
          dayHint = 'tuesday';
        } else if (day == 2) {
          dayHint = 'wednesday';
        } else if (day == 3) {
          dayHint = 'thursday';
        } else {
          dayHint = 'friday';
        }
        String startTimeHint;
        int modifiedStartHour = 0;

        if (hour > 12) {
          modifiedStartHour = hour - 12;
          devtools.log(hour.toString());
          startTimeHint = modifiedStartHour.toString() + ":";
          if (minute.toString() == "0") {
            startTimeHint += "0" + "0";
          } else {
            startTimeHint += minute.toString();
          }
        } else {
          startTimeHint = hour.toString() + ":";

          if (minute.toString() == "0") {
            startTimeHint += "0" + "0";
          } else {
            startTimeHint += minute.toString();
          }
        }
        int endTimeHintInt = hour * 60 + minute + duration;

        String endTimeHint;
        if (((endTimeHintInt / 60).floor()) > 12) {
          endTimeHint = ((endTimeHintInt / 60).floor() - 12).toString() + ":";
          if ((endTimeHintInt % 60).toString() == "0") {
            endTimeHint += "0" + "0";
          } else {
            endTimeHint += (endTimeHintInt % 60).toString();
          }
        } else {
          endTimeHint = ((endTimeHintInt / 60).floor()).toString() + ":";

          if ((endTimeHintInt % 60).toString() == "0") {
            endTimeHint += "0" + "0";
          } else {
            endTimeHint += (endTimeHintInt % 60).toString();
          }
        }

        setState(() {
          tasks.add(
            TimePlannerTask(
              color: colors[Random().nextInt(colors.length)],
              dateTime:
                  TimePlannerDateTime(day: day, hour: hour, minutes: minute),
              minutesDuration: duration,
              onTap: () async {
                await showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(builder: (context, setState) {
                      return AlertDialog(
                        title: const Text('Edit schedule'),
                        content: ListView(shrinkWrap: true, children: [
                          TextFormField(
                            controller: _className,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: classNameHint,
                            ),
                          ),
                          DropdownButtonHideUnderline(
                              child: DropdownButton2(
                            hint: Text(dayHint),
                            items: dayConstant
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
                              startTimeHint,
                              style: TextStyle(
                                // fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            items: startTimeConstant
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
                              endTimeHint,
                              style: TextStyle(
                                // fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            items: endTimeConstant
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
                              _className.text = "";
                              selectedDay = null;
                              selectedEndTime = null;
                              selectedStartTime = null;
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: const Text('Delete'),
                            onPressed: () async {
                              FirebaseFirestore.instance
                                  .collection('calendar')
                                  .doc(FirebaseAuth.instance.currentUser?.uid)
                                  .update({
                                "schedule": FieldValue.arrayRemove([item])
                              });
                              // Navigator.of(context).pop();
                              Navigator.of(context).pushAndRemoveUntil(
                                CupertinoPageRoute(
                                  builder: (BuildContext context) {
                                    return const MainView(index: 2);
                                  },
                                ),
                                (route) => false,
                              );
                            },
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: const Text('Update'),
                            onPressed: () async {
                              //this is to make sure user's start time is before the end time

                              _className.text == "" ||
                                  selectedDay == null ||
                                  selectedEndTime == null ||
                                  selectedStartTime == null;
                              var startHourminStr;
                              if (selectedStartTime == null) {
                                startHourminStr =
                                    startTimeHint.toString().split(":");
                              } else {
                                startHourminStr =
                                    selectedStartTime.toString().split(":");
                              }
                              var startHourmin =
                                  startHourminStr.map(int.parse).toList();

                              if (startHourmin[0] < 7) {
                                startHourmin[0] += 12;
                              }

                              var endHourminStr;
                              if (selectedEndTime == null) {
                                endHourminStr =
                                    endTimeHint.toString().split(":");
                              } else {
                                endHourminStr =
                                    selectedEndTime.toString().split(":");
                              }

                              var endHourmin =
                                  endHourminStr.map(int.parse).toList();

                              if (endHourmin[0] < 7) {
                                endHourmin[0] += 12;
                              }

                              //

                              if ((endHourmin[0] * 60 + endHourmin[1]) <
                                  (startHourmin[0] * 60 + startHourmin[1])) {
                                await showErrorDialog(
                                  context,
                                  'start time cant be after end time',
                                );
                              } else {
                                //delete
                                FirebaseFirestore.instance
                                    .collection('calendar')
                                    .doc(FirebaseAuth.instance.currentUser?.uid)
                                    .update({
                                  "schedule": FieldValue.arrayRemove([item])
                                });

                                //edit

                                _editObject(context, classNameHint, day,
                                    startTimeHint, endTimeHint);

                                Navigator.of(context).pushAndRemoveUntil(
                                  CupertinoPageRoute(
                                    builder: (BuildContext context) {
                                      return const MainView(index: 2);
                                    },
                                  ),
                                  (route) => false,
                                );
                              }
                            },
                          ),
                        ],
                      );
                    });
                  },
                );
              },
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
                    items: dayConstant
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
                    items: startTimeConstant
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
                    items: endTimeConstant
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
                    onPressed: () async {
                      if (_className.text == "" ||
                          selectedDay == null ||
                          selectedEndTime == null ||
                          selectedStartTime == null) {
                        await showErrorDialog(
                          context,
                          'fields cant be empty',
                        );
                      } else {
                        //this is to make sure user's start time is before the end time
                        var startHourminStr =
                            selectedStartTime.toString().split(":");

                        var startHourmin =
                            startHourminStr.map(int.parse).toList();

                        if (startHourmin[0] < 7) {
                          startHourmin[0] += 12;
                        }

                        var endHourminStr =
                            selectedEndTime.toString().split(":");

                        var endHourmin = endHourminStr.map(int.parse).toList();

                        if (endHourmin[0] < 7) {
                          endHourmin[0] += 12;
                        }

                        //
                        if ((endHourmin[0] * 60 + endHourmin[1]) <
                            (startHourmin[0] * 60 + startHourmin[1])) {
                          await showErrorDialog(
                            context,
                            'start time cant be after end time',
                          );
                        } else {
                          _addObject(context);
                          Navigator.of(context).pushAndRemoveUntil(
                            CupertinoPageRoute(
                              builder: (BuildContext context) {
                                return const MainView(index: 2);
                              },
                            ),
                            (route) => false,
                          );
                        }
                      }
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
