import 'package:boiler_time/views/community/alumni.dart';
import 'package:boiler_time/views/community/community.dart';
import 'package:boiler_time/views/community/freshman.dart';
import 'package:boiler_time/views/community/intern.dart';
import 'package:boiler_time/views/community/jobsearch.dart';
import 'package:boiler_time/views/community/junior.dart';
import 'package:boiler_time/views/community/senior.dart';
import 'package:boiler_time/views/community/sophomore.dart';
import 'package:flutter/material.dart';

import 'exam.dart';
import 'miscellaneous.dart';
import 'ratemyprofessor.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Community"),
        ),
        body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
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
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black.withOpacity(0),
                  ),
                  child: const ListTile(
                    title: Text('Rate My Professor'),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RateMyProfessor()),
                    );
                  }),
              ElevatedButton(
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
              ElevatedButton(
                  child: const ListTile(
                    title: Text('Alumni'),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Alumni()),
                    );
                  }),
              ElevatedButton(
                  child: const ListTile(
                    title: Text('Senior'),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Senior()),
                    );
                  }),
              ElevatedButton(
                  child: const ListTile(
                    title: Text('Junior'),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Junior()),
                    );
                  }),
              ElevatedButton(
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
              ElevatedButton(
                  child: const ListTile(
                    title: Text('Freshman'),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Freshman()),
                    );
                  }),
              ElevatedButton(
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
              ElevatedButton(
                  child: const ListTile(
                    title: Text('Internship'),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Intern()),
                    );
                  }),
            ],
          ),
        ));
  }
}
