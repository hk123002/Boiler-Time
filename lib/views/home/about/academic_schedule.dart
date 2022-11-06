import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AcademicSchedule extends StatelessWidget {
  const AcademicSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: const Text('Developers'),
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
        child: Text("Developed by..."),
      ),
    );
  }
}
