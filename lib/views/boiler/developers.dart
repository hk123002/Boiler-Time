import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Developers extends StatelessWidget {
  const Developers({super.key});

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
            color: Colors.black54,
          ),
        ),
      ),
      body: Container(
        child: Text("Developed by..."),
      ),
    );
  }
}
