import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BusSchedule extends StatelessWidget {
  const BusSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bus Schedule')),
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
              child: ListTile(
                title: Text('13 Silver Loop'),
                subtitle: Text('Campus Loop'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(
                  Icons.library_books,
                  size: 30,
                ),
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber,
              ),
              child: ListTile(
                title: Text('28 Gold Loop'),
                subtitle: Text('To Purdue Campus'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(
                  Icons.library_books,
                  size: 30,
                ),
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber,
              ),
              child: ListTile(
                title: Text('28 Gold Loop'),
                subtitle: Text('To Purdue Airport'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(
                  Icons.library_books,
                  size: 30,
                ),
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: ListTile(
                title: Text('4B Purdue West'),
                subtitle: Text('To Citybus Center'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(
                  Icons.library_books,
                  size: 30,
                ),
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: ListTile(
                title: Text('4B Purdue West'),
                subtitle: Text('To Walmart'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(
                  Icons.library_books,
                  size: 30,
                ),
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: ListTile(
                title: Text('23 The Connector'),
                subtitle: Text('To Lafayette'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(
                  Icons.library_books,
                  size: 30,
                ),
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: ListTile(
                title: Text('23 The Connector'),
                subtitle: Text('To West Lafayette & Purdue Campus'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(
                  Icons.library_books,
                  size: 30,
                ),
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
              ),
              child: ListTile(
                title: Text('24 Red Point'),
                subtitle: Text('To Purdue Campus'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(
                  Icons.library_books,
                  size: 30,
                ),
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
              ),
              child: ListTile(
                title: Text('24 Red Point'),
                subtitle: Text('To Red Point'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(
                  Icons.library_books,
                  size: 30,
                ),
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: ListTile(
                title: Text('5 Happy Hollow'),
                subtitle: Text('To River and Kalberer'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(
                  Icons.library_books,
                  size: 30,
                ),
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: ListTile(
                title: Text('21A Lake & Alight'),
                subtitle: Text('To Lake & Alight'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(
                  Icons.library_books,
                  size: 30,
                ),
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: ListTile(
                title: Text('17 Ross Ade'),
                subtitle: Text('Campus Loop'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(
                  Icons.library_books,
                  size: 30,
                ),
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
              ),
              child: ListTile(
                title: Text('10 Northwestern'),
                subtitle: Text('To Purdue Campus'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(
                  Icons.library_books,
                  size: 30,
                ),
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
              ),
              child: ListTile(
                title: Text('10 Northwestern'),
                subtitle: Text('To Shining Armor'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(
                  Icons.library_books,
                  size: 30,
                ),
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: ListTile(
                title: Text('35 Linberg Express'),
                subtitle: Text('Village west and Cottage Apts Loop'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(
                  Icons.library_books,
                  size: 30,
                ),
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: ListTile(
                title: Text('15 Tower Arces'),
                subtitle: Text('To Purdue Campus'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(
                  Icons.library_books,
                  size: 30,
                ),
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
              ),
              child: ListTile(
                title: Text('15 Tower Arces'),
                subtitle: Text('To Tower Arces'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(
                  Icons.library_books,
                  size: 30,
                ),
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: ListTile(
                title: Text('1B Salisbury'),
                subtitle: Text('To Citybus Center'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(
                  Icons.library_books,
                  size: 30,
                ),
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: ListTile(
                title: Text('1B Salisbury'),
                subtitle: Text('To Walmart'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(
                  Icons.library_books,
                  size: 30,
                ),
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
