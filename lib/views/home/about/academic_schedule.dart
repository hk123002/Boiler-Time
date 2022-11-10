import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AcademicSchedule extends StatelessWidget {
  const AcademicSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: const Text('2022-2023'),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(169, 52, 45, 53),
              ),
              child: const ExpansionTile(
                title: Text('August'),
                subtitle: Text('2022'),
                leading: Icon(
                  Icons.calendar_month,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('22 Mon'),
                      subtitle: Text('Fall Semester Begin')),
                  ListTile(
                      title: Text('29 Mon'),
                      subtitle:
                          Text('Last Day to Register Without a Late Fee')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(169, 52, 45, 53),
              ),
              child: const ExpansionTile(
                title: Text('September'),
                subtitle: Text('2022'),
                leading: Icon(
                  Icons.calendar_month,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('5 Fri'),
                      subtitle: Text('LABOUR DAY (No Classes')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(169, 52, 45, 53),
              ),
              child: const ExpansionTile(
                title: Text('October'),
                subtitle: Text('2022'),
                leading: Icon(
                  Icons.calendar_month,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('10-11 Mon-Tues'),
                      subtitle: Text('OCTOBER BREAK')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(169, 52, 45, 53),
              ),
              child: const ExpansionTile(
                title: Text('November'),
                subtitle: Text('2022'),
                leading: Icon(
                  Icons.calendar_month,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('23-26 Wed-Sat'),
                      subtitle: Text('THANKSGIVING VACATION')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(169, 52, 45, 53),
              ),
              child: const ExpansionTile(
                title: Text('December'),
                subtitle: Text('2022'),
                leading: Icon(
                  Icons.calendar_month,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('10 Sat'), subtitle: Text('CLASSES END')),
                  ListTile(
                      title: Text('12-17 Mon-Sat'),
                      subtitle: Text('FINAL EXAMS')),
                  ListTile(
                      title: Text('17 Sat'), subtitle: Text('SEMESTER ENDS')),
                  ListTile(
                      title: Text('19 Mon'),
                      subtitle: Text('Winter Session classes begin')),
                  ListTile(
                      title: Text('20 Tues'),
                      subtitle: Text('GRADES DUE (Fall Session)')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(169, 52, 45, 53),
              ),
              child: const ExpansionTile(
                title: Text('January'),
                subtitle: Text('2022'),
                leading: Icon(
                  Icons.calendar_month,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('6 Fri'),
                      subtitle: Text('Winter Session Ends')),
                  ListTile(
                      title: Text('9 Mon'),
                      subtitle: Text('SPRING SEMESTER CLASSES BEGIN')),
                  ListTile(
                      title: Text('10 Tues'),
                      subtitle: Text('Grades Due (Winter Session)')),
                  ListTile(
                      title: Text('16 Mon'),
                      subtitle: Text('MARTIN LUTHER KING JR.DAY (No Classes)')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(169, 52, 45, 53),
              ),
              child: const ExpansionTile(
                title: Text('February'),
                subtitle: Text('2022'),
                leading: Icon(
                  Icons.calendar_month,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('20 Mon'),
                      subtitle: Text(
                          'Last Day For Grade Correction For Fall Semester 2022')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(169, 52, 45, 53),
              ),
              child: const ExpansionTile(
                title: Text('March'),
                subtitle: Text('2022'),
                leading: Icon(
                  Icons.calendar_month,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('13 Mon'),
                      subtitle:
                          Text('Schedule of Classes Published for Fall 2023')),
                  ListTile(
                      title: Text('13-18 Mon-Sat'),
                      subtitle: Text('SPRING VACATION')),
                  ListTile(
                      title: Text('Friday - Saturday'),
                      subtitle: Text('10:00 AM - 6:00 PM')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(169, 52, 45, 53),
              ),
              child: const ExpansionTile(
                title: Text('April'),
                subtitle: Text('2022'),
                leading: Icon(
                  Icons.calendar_month,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('29 Sat'), subtitle: Text('CLASSES END')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(169, 52, 45, 53),
              ),
              child: const ExpansionTile(
                title: Text('May'),
                subtitle: Text('2022'),
                leading: Icon(
                  Icons.calendar_month,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('1-6 Mon-Sat'),
                      subtitle: Text('FINAL EXAMS')),
                  ListTile(
                      title: Text('6 Sat'), subtitle: Text('SEMESTER ENDS')),
                  ListTile(title: Text('9 Tues'), subtitle: Text('GRADES DUE')),
                  ListTile(
                      title: Text('15 Mon'),
                      subtitle: Text('First 8-Week Summer Module Begins')),
                  ListTile(
                      title: Text('15 Mon'),
                      subtitle: Text('12-Week Full Summer Module Begins')),
                  ListTile(
                      title: Text('15 Mon'),
                      subtitle: Text('First 4-Week Summer Module Begins')),
                  ListTile(
                      title: Text('29 Mon'),
                      subtitle: Text('MEMORIAL DAY (No Classes)')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(169, 52, 45, 53),
              ),
              child: const ExpansionTile(
                title: Text('June'),
                subtitle: Text('2022'),
                leading: Icon(
                  Icons.calendar_month,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('9 Fri'),
                      subtitle: Text('First 4-Week Summer Module Ends')),
                  ListTile(
                      title: Text('12 Mon'),
                      subtitle: Text('Second 8-Week Summer Module Begins')),
                  ListTile(
                      title: Text('12 Mon'),
                      subtitle: Text('Second 4-Week Module Begins')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(169, 52, 45, 53),
              ),
              child: const ExpansionTile(
                title: Text('July'),
                subtitle: Text('2022'),
                leading: Icon(
                  Icons.calendar_month,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('4 Tues'),
                      subtitle:
                          Text('Independence Holiday Observed (No Classes)')),
                  ListTile(
                      title: Text('7 Fri'),
                      subtitle: Text('First 8-Week Summer Module Ends')),
                  ListTile(
                      title: Text('7 Fri'),
                      subtitle: Text('Second 4-Week Summer Module Ends')),
                  ListTile(
                      title: Text('10 Mon'),
                      subtitle: Text('Third 4-Week Summer Module Begins')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(169, 52, 45, 53),
              ),
              child: const ExpansionTile(
                title: Text('August'),
                subtitle: Text('2023'),
                leading: Icon(
                  Icons.calendar_month,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('1 Tues'),
                      subtitle: Text('12-Week Full Summer Module Ends')),
                  ListTile(
                      title: Text('1 Tues'),
                      subtitle: Text('Second 8-Week Summer Module Ends')),
                  ListTile(
                      title: Text('2-4 Wed-Fri'),
                      subtitle: Text('Final Exams for Second 8-Week Module')),
                  ListTile(
                      title: Text('4 Fri'),
                      subtitle: Text('Third 4-Week Summer Module Ends')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
