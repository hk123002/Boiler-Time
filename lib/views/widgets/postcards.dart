import 'package:flutter/material.dart';
import 'package:boiler_time/helper/demoValues.dart';
import 'package:boiler_time/views/community/postPage.dart';
import 'package:boiler_time/views/community/community.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required CircularProgressIndicator child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return PostPage();
        }));
      },
      child: AspectRatio(
        aspectRatio: 6 / 3,
        child: Card(
          elevation: 2,
          child: Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.all(4.0),
            child: Column(),
          ),
        ),
      ),
    );
  }
}

class _PostTitleAndSummary extends StatelessWidget {
  const _PostTitleAndSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _title = TextEditingController();
    final TextEditingController _content = TextEditingController();

    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const <Widget>[],
      ),
    );
  }
}

class _UserNameAndEmail extends StatelessWidget {
  const _UserNameAndEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //Text(DemoValues.userName),
          //Text(DemoValues.userEmail),
        ],
      ),
    );
  }
}
