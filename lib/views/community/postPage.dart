import 'package:boiler_time/constants/routes.dart';
import 'package:boiler_time/services/auth/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comment_tree/data/comment.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import '../../enums/menu_action.dart';
import 'package:animated_tree_view/animated_tree_view.dart';

class PostPage extends StatefulWidget {
  final String documentID;
  final String collectionName;
  const PostPage({required this.documentID, required this.collectionName});

  @override
  State<PostPage> createState() => _postPageViewState();
}

class _postPageViewState extends State<PostPage> {
  String? documentID;
  String? collectionName;

  @override
  void initState() {
    documentID = widget.documentID;
    collectionName = widget.collectionName;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final TextEditingController _comment = TextEditingController();

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _comment,
                  decoration: const InputDecoration(labelText: 'Comment'),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  child: const Text('Create'),
                  onPressed: () async {
                    final String comment = _comment.text;

                    await FirebaseFirestore.instance
                        .collection(collectionName!)
                        .doc(documentID)
                        .update({
                      "Comment": FieldValue.arrayUnion([comment])
                    });

                    _comment.text = '';
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> _delete(String examID) async {
    await FirebaseFirestore.instance
        .collection(collectionName!)
        .doc(documentID)
        .delete();

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You have successfully deleted a post')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          title: const Text('Post'),
        ),
        body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection(collectionName!)
              .doc(documentID)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text('Error = ${snapshot.error}');

            if (snapshot.hasData) {
              var output = snapshot.data;
              var content = output!['Content'];
              var title = output['Title'];
              var category = output['Category'];

              // <-- Your value
              var comment = output['Comment'];
              devtools.log("--------------");
              devtools.log(comment.toString());
              devtools.log("--------------");

              List<String> commentList = [];

              if (comment.length > 0) {
                for (String item in comment) {
                  commentList.add(item);
                  devtools.log(item);
                }
              }

              return Column(children: [
                Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text('Title: $title'),
                    subtitle: Text('Content: $content'),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text('category: $category'),
                  ),
                ),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: commentList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          title: Text('Comment: ' + commentList[index]),
                        ),
                      );
                    })
              ]);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
// Add new product
        floatingActionButton: FloatingActionButton(
          onPressed: () => _create(),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
