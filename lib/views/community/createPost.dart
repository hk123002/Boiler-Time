import 'package:boiler_time/constants/routes.dart';
import 'package:boiler_time/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;
import 'package:boiler_time/views/widgets/postcards.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../enums/menu_action.dart';

class CreatePost extends StatelessWidget {
  late String title;
  late String content;

  CreatePost(this.title, this.content);

  @override
  Widget build(BuildContext context) {
    CollectionReference post = FirebaseFirestore.instance.collection('post');

    Future<void> addPost() {
      return post
          .add({'Title': title, 'Context': content})
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
      onPressed: addPost,
      child: Text(
        "Add Post",
      ),
    );
  }

  //   return Scaffold(
  //       appBar: AppBar(),
  //       body: Column(
  //         children: [
  //           TextField(
  //             decoration: InputDecoration(hintText: 'Title'),
  //           ),
  //           TextField(
  //             decoration: InputDecoration(hintText: 'Write'),
  //           ),
  //           ElevatedButton(
  //               onPressed: () async {
  //                 await post.add({
  //                   'Title': title, // John Doe
  //                   'Context': content // Stokes and Sons
  //                 }).then((value) => print('post added'));
  //               },
  //               child: Text('Post'))
  //         ],
  //       ));
  // }
}
