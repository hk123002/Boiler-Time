import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LibraryTime extends StatelessWidget {
  const LibraryTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: const Text('library'),
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
                title: Text('Wilmeth Active Learning Center (WALC)'),
                subtitle: Text('340 Centennial Mall Dr'),
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
                color: Color.fromARGB(169, 52, 45, 53),
              ),
              child: const ExpansionTile(
                title: Text('Hicks Undergraduate Library'),
                subtitle: Text('504 W State St'),
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
                color: Color.fromARGB(169, 52, 45, 53),
              ),
              child: const ExpansionTile(
                title:
                    Text('Roland G. Parrish Library of Management & Economics'),
                subtitle: Text('403 W State St'),
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
                color: Color.fromARGB(169, 52, 45, 53),
              ),
              child: const ExpansionTile(
                title: Text('Archives and Special Collections'),
                subtitle: Text('208 W Columbia St'),
                leading: Icon(
                  Icons.info,
                  size: 30,
                ),
                children: [
                  ListTile(title: Text('Sunday'), subtitle: Text('Closed')),
                  ListTile(
                      title: Text('Monday - Friday'),
                      subtitle: Text('10.00 AM - 4:30 PM')),
                  ListTile(title: Text('Saturday'), subtitle: Text('Closed')),
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
                title: Text('Aviation and Transportation Technology'),
                subtitle: Text('208 W Columbia St'),
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
                color: Color.fromARGB(169, 52, 45, 53),
              ),
              child: const ExpansionTile(
                title: Text('Black Cultural Center Library'),
                subtitle: Text('208 W Columbia St'),
                leading: Icon(
                  Icons.info,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('Sunday'),
                      subtitle: Text('2:00 PM - 9:00 PM')),
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
                color: Color.fromARGB(169, 52, 45, 53),
              ),
              child: const ExpansionTile(
                title:
                    Text('Humanities, Social Sciences and Education Library'),
                subtitle: Text('208 W Columbia St'),
                leading: Icon(
                  Icons.info,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('Sunday'),
                      subtitle: Text('1:00 PM - 12:00 AM')),
                  ListTile(
                      title: Text('Monday - Friday'),
                      subtitle: Text('8.00 AM - 12:00 AM')),
                  ListTile(
                      title: Text('Saturday'),
                      subtitle: Text('1:00 PM - 5:00 PM')),
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
                title: Text('Interlibrary Loan'),
                subtitle: Text('208 W Columbia St'),
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
                color: Color.fromARGB(169, 52, 45, 53),
              ),
              child: const ExpansionTile(
                title: Text('Mathematical Sciences Library'),
                subtitle: Text('208 W Columbia St'),
                leading: Icon(
                  Icons.info,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('Sunday'),
                      subtitle: Text('1:00 PM - 8:00 PM')),
                  ListTile(
                      title: Text('Monday - Friday'),
                      subtitle: Text('8.00 AM - 8:00 PM')),
                  ListTile(
                      title: Text('Saturday'),
                      subtitle: Text('1:00 PM - 5:00 PM')),
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
                title: Text('Veterinary Medical Library'),
                subtitle: Text('208 W Columbia St'),
                leading: Icon(
                  Icons.info,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('Sunday'),
                      subtitle: Text('1:00 PM - 8:00 PM')),
                  ListTile(
                      title: Text('Monday - Friday'),
                      subtitle: Text('8.00 AM - 8:00 PM')),
                  ListTile(
                      title: Text('Saturday'),
                      subtitle: Text('1:00 PM - 5:00 PM')),
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
                title: Text('Library of Engineering and Science'),
                subtitle: Text('208 W Columbia St'),
                leading: Icon(
                  Icons.info,
                  size: 30,
                ),
                children: [
                  ListTile(
                      title: Text('Sunday'),
                      subtitle: Text('11:00 AM - 2:00 PM')),
                  ListTile(
                      title: Text('Monday - Friday'),
                      subtitle: Text('7.00 AM - 2:00 AM')),
                  ListTile(
                      title: Text('Saturday'),
                      subtitle: Text('11:00 AM - 12:00 AM')),
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
                title: Text('West Lafayette Library'),
                subtitle: Text('208 W Columbia St'),
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
