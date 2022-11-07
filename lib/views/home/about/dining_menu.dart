import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiningMenu extends StatelessWidget {
  const DiningMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: const Text('dining'),
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
              child: ListTile(
                title: Text('Earhart'),
                subtitle: Text('Example Sub Title'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: Icon(
                  Icons.restaurant_menu,
                  size: 30,
                ),
                contentPadding: EdgeInsets.all(10),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Earhart()),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(169, 52, 45, 53),
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Hillenbrand()),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(169, 52, 45, 53),
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Windsor()),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(169, 52, 45, 53),
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Wiley()),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(169, 52, 45, 53),
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Ford()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Earhart extends StatelessWidget {
  const Earhart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Earhart Menue'),
      ),
      body: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                title: Text('menue 1'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('menue 2'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('menue 3'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('menue 4'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('menue 5'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('menue 6'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Hillenbrand extends StatelessWidget {
  const Hillenbrand({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hillenbrand Menue'),
      ),
      body: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                title: Text('menue 1'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('menue 2'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('menue 3'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('menue 4'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('menue 5'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('menue 6'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Windsor extends StatelessWidget {
  const Windsor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Windsor Menue'),
      ),
      body: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                title: Text('menue 1'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('menue 2'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('menue 3'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('menue 4'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('menue 5'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('menue 6'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Wiley extends StatelessWidget {
  const Wiley({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wiley Menue'),
      ),
      body: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                title: Text('menue 1'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('menue 2'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('menue 3'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('menue 4'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('menue 5'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('menue 6'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Ford extends StatelessWidget {
  const Ford({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ford Menue'),
      ),
      body: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                title: Text('menue 1'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('menue 2'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('menue 3'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('menue 4'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('menue 5'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('menue 6'),
                subtitle: Text('menue category'),
                leading: Icon(Icons.food_bank),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
