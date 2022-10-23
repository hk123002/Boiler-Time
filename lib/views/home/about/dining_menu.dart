import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiningMenu extends StatelessWidget {
  const DiningMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('dining'),
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
                title: Text('Earhart'),
                subtitle: Text('Example Sub Title'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(
                  Icons.restaurant_menu,
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
                title: Text('Hillenbrand'),
                subtitle: Text('Example Sub Title'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(
                  Icons.restaurant_menu,
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
                title: Text('Windsor'),
                subtitle: Text('Example Sub Title'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(
                  Icons.restaurant_menu,
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
                title: Text('Wiley'),
                subtitle: Text('Example Sub Title'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(
                  Icons.restaurant_menu,
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
                title: Text('Ford'),
                subtitle: Text('Example Sub Title'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(
                  Icons.restaurant_menu,
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
