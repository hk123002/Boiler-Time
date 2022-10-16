import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LibraryTime extends StatelessWidget {
  const LibraryTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: const ExpansionTile(
                title: Text('Wilmeth Active Learning Center (WALC)'),
                subtitle: Text('Example Sub Title'),
                leading: Icon(
                  Icons.info,
                  size: 30,
                ),
                children: [
                  ListTile(title: Text('Sunday'), subtitle: Text('Closed')),
                  ListTile(
                      title: Text('Monday - Friday'),
                      subtitle: Text('9.00 AM - 6:00 PM')),
                  ListTile(title: Text('Saturday'), subtitle: Text('Closed')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: const ExpansionTile(
                title: Text('Hicks Undergraduate Library'),
                subtitle: Text('Example Sub Title'),
                leading: Icon(
                  Icons.info,
                  size: 30,
                ),
                children: [
                  ListTile(title: Text('Sunday'), subtitle: Text('Closed')),
                  ListTile(
                      title: Text('Monday - Friday'),
                      subtitle: Text('8.00 AM - 5:00 PM')),
                  ListTile(title: Text('Saturday'), subtitle: Text('Closed')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: const ExpansionTile(
                title: Text('Parrish Library of Management & Economics'),
                subtitle: Text('Example Sub Title'),
                leading: Icon(
                  Icons.info,
                  size: 30,
                ),
                children: [
                  ListTile(title: Text('Sunday'), subtitle: Text('Closed')),
                  ListTile(
                      title: Text('Monday - Friday'),
                      subtitle: Text('9.00 AM - 6:00 PM')),
                  ListTile(title: Text('Saturday'), subtitle: Text('Closed')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: const ExpansionTile(
                title: Text('West Lafayette LIbrary'),
                subtitle: Text('Example Sub Title'),
                leading: Icon(
                  Icons.info,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('Sunday'),
                      subtitle: Text('1:00 PM - 5:00 PM')),
                  ListTile(
                      title: Text('Monday - Thursday'),
                      subtitle: Text('10.00 AM - 8:00 PM')),
                  ListTile(
                      title: Text('Friday - Saturday'),
                      subtitle: Text('10:00 AM - 6:00 PM')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
