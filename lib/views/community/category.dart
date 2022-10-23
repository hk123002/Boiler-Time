import 'package:boiler_time/views/community/community.dart';
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
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  child: const Text('Exam'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Exam()),
                    );
                  }),
              ElevatedButton(
                  child: const Text('Rate My Professor'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RateMyProfessor()),
                    );
                  }),
              ElevatedButton(
                  child: const Text('Miscellaneous'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Miscellaneous()),
                    );
                  })
            ],
          ),
        ));
  }
}
