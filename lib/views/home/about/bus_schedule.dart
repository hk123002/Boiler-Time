import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BusSchedule extends StatelessWidget {
  const BusSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: const Text('bus schedule'),
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
                color: Colors.blueGrey,
              ),
              child: const ExpansionTile(
                title: Text('13 Silver Loop'),
                subtitle: Text('Campus Loop'),
                leading: Icon(
                  Icons.directions_bus,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('Schedule'),
                      subtitle: Text('Every 6 ~ 8 Minute')),
                  ListTile(
                      title: Text('Monday - Friday'),
                      subtitle: Text('7:00 AM - 6:00 PM')),
                  ListTile(
                      title: Text('Saturday - Sunday'),
                      subtitle: Text('Closed')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber,
              ),
              child: const ExpansionTile(
                title: Text('28 Gold Loop'),
                subtitle: Text('To Purdue Campus'),
                leading: Icon(
                  Icons.directions_bus,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('Schedule'),
                      subtitle: Text('Every 13 Minute')),
                  ListTile(
                      title: Text('Monday - Friday'),
                      subtitle: Text('7:00 AM - 12:00 AM')),
                  ListTile(
                      title: Text('Saturday - Sunday'),
                      subtitle: Text('Closed')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber,
              ),
              child: const ExpansionTile(
                title: Text('28 Gold Loop'),
                subtitle: Text('To Purdue Airport'),
                leading: Icon(
                  Icons.directions_bus,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('Schedule'),
                      subtitle: Text('Every 13 Minute')),
                  ListTile(
                      title: Text('Monday - Friday'),
                      subtitle: Text('6:30 AM - 11:30 AM')),
                  ListTile(
                      title: Text('Saturday - Sunday'),
                      subtitle: Text('Closed')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: const ExpansionTile(
                title: Text('4B Purdue West'),
                subtitle: Text('To Citybus Center'),
                leading: Icon(
                  Icons.directions_bus,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('Schedule'),
                      subtitle: Text('Every 30 Minute')),
                  ListTile(
                      title: Text('Monday - Friday'),
                      subtitle: Text('6:30 AM - 11:30 AM')),
                  ListTile(
                      title: Text('Saturday - Sunday'),
                      subtitle: Text('Closed')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: const ExpansionTile(
                title: Text('4B Purdue West'),
                subtitle: Text('To Walmart'),
                leading: Icon(
                  Icons.directions_bus,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('Schedule'),
                      subtitle: Text('Every 30 Minute')),
                  ListTile(
                      title: Text('Monday - Friday'),
                      subtitle: Text('6:30 AM - 11:30 AM')),
                  ListTile(
                      title: Text('Saturday - Sunday'),
                      subtitle: Text('Closed')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: const ExpansionTile(
                title: Text('23 The Connector'),
                subtitle: Text('To Lafayette'),
                leading: Icon(
                  Icons.directions_bus,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('Schedule'),
                      subtitle: Text('Every 30 Minute')),
                  ListTile(
                      title: Text('Monday - Friday'),
                      subtitle: Text('7:00 AM - 6:00 PM')),
                  ListTile(
                      title: Text('Saturday - Sunday'),
                      subtitle: Text('Closed')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: const ExpansionTile(
                title: Text('23 The Connector'),
                subtitle: Text('To West Lafayette & Purdue Campus'),
                leading: Icon(
                  Icons.directions_bus,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('Schedule'),
                      subtitle: Text('Every 30 Minute')),
                  ListTile(
                      title: Text('Monday - Friday'),
                      subtitle: Text('6:30 AM - 12:00 AM')),
                  ListTile(
                      title: Text('Saturday - Sunday'),
                      subtitle: Text('Closed')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
              ),
              child: const ExpansionTile(
                title: Text('24 Red Point'),
                subtitle: Text('To Purdue Campus'),
                leading: Icon(
                  Icons.directions_bus,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('Schedule'),
                      subtitle: Text('Every 30 Minute')),
                  ListTile(
                      title: Text('Monday - Friday'),
                      subtitle: Text('7:30 AM - 9:30 PM')),
                  ListTile(
                      title: Text('Saturday - Sunday'),
                      subtitle: Text('Closed')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
              ),
              child: const ExpansionTile(
                title: Text('24 Red Point'),
                subtitle: Text('To Red Point'),
                leading: Icon(
                  Icons.directions_bus,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('Schedule'),
                      subtitle: Text('Every 30 Minute')),
                  ListTile(
                      title: Text('Monday - Friday'),
                      subtitle: Text('7:30 AM - 9:00 PM')),
                  ListTile(
                      title: Text('Saturday - Sunday'),
                      subtitle: Text('Closed')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.brown,
              ),
              child: const ExpansionTile(
                title: Text('5 Happy Hollow'),
                subtitle: Text('To River and Kalberer'),
                leading: Icon(
                  Icons.directions_bus,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('Schedule'),
                      subtitle: Text('Every 20 Minute')),
                  ListTile(
                      title: Text('Monday - Friday'),
                      subtitle: Text('6:30 AM - 9:00 PM')),
                  ListTile(
                      title: Text('Saturday - Sunday'),
                      subtitle: Text('Closed')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.brown,
              ),
              child: const ExpansionTile(
                title: Text('21A Lake & Alight'),
                subtitle: Text('To Lake & Alight'),
                leading: Icon(
                  Icons.directions_bus,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('Schedule'),
                      subtitle: Text('Every 30 Minute')),
                  ListTile(
                      title: Text('Monday - Friday'),
                      subtitle: Text('7:30 AM - 9:00 PM')),
                  ListTile(
                      title: Text('Saturday - Sunday'),
                      subtitle: Text('Closed')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.brown,
              ),
              child: const ExpansionTile(
                title: Text('17 Ross Ade'),
                subtitle: Text('Campus Loop'),
                leading: Icon(
                  Icons.directions_bus,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('Schedule'),
                      subtitle: Text('Every 30 Minute')),
                  ListTile(
                      title: Text('Monday - Friday'),
                      subtitle: Text('7:00 AM - 6:00 PM')),
                  ListTile(
                      title: Text('Saturday - Sunday'),
                      subtitle: Text('Closed')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
              ),
              child: const ExpansionTile(
                title: Text('10 Northwestern'),
                subtitle: Text('To Purdue Campus'),
                leading: Icon(
                  Icons.directions_bus,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('Schedule'),
                      subtitle: Text('Every 30 Minute')),
                  ListTile(
                      title: Text('Monday - Friday'),
                      subtitle: Text('7:00 AM - 9:00 PM')),
                  ListTile(
                      title: Text('Saturday - Sunday'),
                      subtitle: Text('Closed')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
              ),
              child: const ExpansionTile(
                title: Text('10 Northwestern'),
                subtitle: Text('To Shining Armor'),
                leading: Icon(
                  Icons.directions_bus,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('Schedule'),
                      subtitle: Text('Every 30 Minute')),
                  ListTile(
                      title: Text('Monday - Friday'),
                      subtitle: Text('7:00 AM - 9:00 PM')),
                  ListTile(
                      title: Text('Saturday - Sunday'),
                      subtitle: Text('Closed')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: const ExpansionTile(
                title: Text('35 Linberg Express'),
                subtitle: Text('Village west and Cottage Apts Loop'),
                leading: Icon(
                  Icons.directions_bus,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('Schedule'), subtitle: Text('Every  Minute')),
                  ListTile(
                      title: Text('Monday - Friday'),
                      subtitle: Text('7:00 AM - 8:00 PM')),
                  ListTile(
                      title: Text('Saturday - Sunday'),
                      subtitle: Text('Closed')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: const ExpansionTile(
                title: Text('15 Tower Arces'),
                subtitle: Text('To Purdue Campus'),
                leading: Icon(
                  Icons.directions_bus,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('Schedule'),
                      subtitle: Text('Every 20 Minute')),
                  ListTile(
                      title: Text('Monday - Friday'),
                      subtitle: Text('7:00 AM - 11:30 PM')),
                  ListTile(
                      title: Text('Saturday - Sunday'),
                      subtitle: Text('Closed')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
              ),
              child: const ExpansionTile(
                title: Text('15 Tower Arces'),
                subtitle: Text('To Tower Arces'),
                leading: Icon(
                  Icons.directions_bus,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('Schedule'),
                      subtitle: Text('Every 20 Minute')),
                  ListTile(
                      title: Text('Monday - Friday'),
                      subtitle: Text('7:00 AM - 11:30 PM')),
                  ListTile(
                      title: Text('Saturday - Sunday'),
                      subtitle: Text('Closed')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: const ExpansionTile(
                title: Text('1B Salisbury'),
                subtitle: Text('To Citybus'),
                leading: Icon(
                  Icons.directions_bus,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('Schedule'),
                      subtitle: Text('Every 30 Minute')),
                  ListTile(
                      title: Text('Monday - Friday'),
                      subtitle: Text('6:30 AM - 11:30 PM')),
                  ListTile(
                      title: Text('Saturday - Sunday'),
                      subtitle: Text('Closed')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: const ExpansionTile(
                title: Text('1B Salisbury'),
                subtitle: Text('To Walmart'),
                leading: Icon(
                  Icons.directions_bus,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('Schedule'),
                      subtitle: Text('Every 30 Minute')),
                  ListTile(
                      title: Text('Monday - Friday'),
                      subtitle: Text('6:30 AM - 11:30 PM')),
                  ListTile(
                      title: Text('Saturday - Sunday'),
                      subtitle: Text('Closed')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
