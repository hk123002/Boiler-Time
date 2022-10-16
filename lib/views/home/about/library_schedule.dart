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
                color: Colors.amber,
              ),
              child: ListTile(
                title: Text('Wilmeth Active Learning Center (WALC)'),
                subtitle: Text('Example Sub Title'),
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
                title: Text('Hicks Undergraduate Library'),
                subtitle: Text('Example Sub Title'),
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
                title: Text('Parrish Library of Management & Economics'),
                subtitle: Text('Example Sub Title'),
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
                title: Text('West Lafayette LIbrary'),
                subtitle: Text('Example Sub Title'),
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
