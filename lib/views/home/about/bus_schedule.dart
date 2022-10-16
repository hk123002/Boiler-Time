import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BusSchedule extends StatelessWidget {
  const BusSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Schedule'),
      ),
      body: Center(
        child: Text('Bus Schedule'),
      ),
    );
  }
}
