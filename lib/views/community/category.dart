import 'package:boiler_time/views/community/alumni.dart';
import 'package:boiler_time/views/community/community.dart';
import 'package:boiler_time/views/community/freshman.dart';
import 'package:boiler_time/views/community/intern.dart';
import 'package:boiler_time/views/community/jobsearch.dart';
import 'package:boiler_time/views/community/junior.dart';
import 'package:boiler_time/views/community/senior.dart';
import 'package:boiler_time/views/community/sophomore.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'exam.dart';
import 'miscellaneous.dart';
import 'ratemyprofessor.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          leading: Icon(Icons.stop_circle_outlined),
          // title: Text(
          //   "Purdue Univ",
          //   style: TextStyle(fontStyle: FontStyle.italic),
          // ),
        ),
        body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 131, 124, 132)),
                borderRadius: BorderRadius.all(Radius.circular(
                        5.0) //                 <--- border radius here
                    ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("community"),
                  TextButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0x00000000),
                      ),
                      child: const ListTile(
                        title: Text('Exam'),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Exam()),
                        );
                      }),
                  TextButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0x00000000),
                      ),
                      child: const ListTile(
                        title: Text('Rate My Professor'),
                      ),
                      onPressed: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: RateMyProfessor(),
                          withNavBar: false, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      }),
                  TextButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0x00000000),
                      ),
                      child: const ListTile(
                        title: Text('Miscellaneous'),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Miscellaneous()),
                        );
                      }),
                  TextButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0x00000000),
                      ),
                      child: const ListTile(
                        title: Text('Alumni'),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Alumni()),
                        );
                      }),
                  TextButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0x00000000),
                      ),
                      child: const ListTile(
                        title: Text('Senior'),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Senior()),
                        );
                      }),
                  TextButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0x00000000),
                      ),
                      child: const ListTile(
                        title: Text('Junior'),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Junior()),
                        );
                      }),
                  TextButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0x00000000),
                      ),
                      child: const ListTile(
                        title: Text('Sophomore'),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Sophomore()),
                        );
                      }),
                  TextButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0x00000000),
                      ),
                      child: const ListTile(
                        title: Text('Freshman'),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Freshman()),
                        );
                      }),
                  TextButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0x00000000),
                      ),
                      child: const ListTile(
                        title: Text('Job Search'),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const JobSearch()),
                        );
                      }),
                  TextButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0x00000000),
                      ),
                      child: const ListTile(
                        title: Text('Internship'),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Intern()),
                        );
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
