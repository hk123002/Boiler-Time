import 'package:boiler_time/constants/routes.dart';
import 'package:boiler_time/services/auth/auth_service.dart';
import 'package:boiler_time/views/community/postPage.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import '../../enums/menu_action.dart';
import '../main_view.dart';

class Post extends StatefulWidget {
  final categoryName;
  const Post({required this.categoryName});

  @override
  State<Post> createState() => _communityState();
}

//final _post = FirebaseFirestore.instance.collection('post');
final CollectionReference _exam = FirebaseFirestore.instance.collection('post');

class _communityState extends State<Post> {
  late final categoryName;

// text fields' controllers
  final TextEditingController _title = TextEditingController();
  final TextEditingController _content = TextEditingController();

  @override
  void initState() {
    categoryName = widget.categoryName;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                  controller: _title,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: _content,
                  maxLines: 10,
                  decoration: const InputDecoration(
                      alignLabelWithHint: true, labelText: 'Content'),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  child: const Text('Create'),
                  onPressed: () async {
                    final String title = _title.text;
                    final String content = _content.text;

                    DocumentReference docRef = await _exam.add({
                      "Title": title,
                      "Content": content,
                      "Author": FirebaseAuth.instance.currentUser?.uid,
                      "Comment": "",
                      "Category": categoryName,
                    });

                    ("---------");
                    ((docRef.id).toString());
                    ("---------");

                    _title.text = '';
                    _content.text = '';
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _title.text = documentSnapshot['Title'];
      _content.text = documentSnapshot['Content'].toString();
    }

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
                  controller: _title,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  maxLines: 10,
                  controller: _content,
                  decoration: const InputDecoration(
                      alignLabelWithHint: true, labelText: 'Content'),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  child: const Text('Update'),
                  onPressed: () async {
                    final String title = _title.text;
                    final String content = _content.text;

                    await _exam.doc(documentSnapshot?.id).update({
                      "Title": title,
                      "Content": content,
                      "Author": FirebaseAuth.instance.currentUser?.uid
                    });
                    _title.text = '';
                    _content.text = '';
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> _delete(String examID) async {
    DocumentReference docRef = await _exam.doc(examID);
    await _exam.doc(examID).delete();

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You have successfully deleted a post')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          title: Text(categoryName),
        ),
        //body: ListView.builder(
        //itemCount: 5,
        //itemBuilder: (BuildContext context, int index) {
        body: StreamBuilder(
          stream: _exam.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Visibility(
                    visible: documentSnapshot["Category"] == categoryName,
                    child: Card(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(documentSnapshot['Title']),
                        subtitle: Text(
                          documentSnapshot['Content'].length > 20
                              ? documentSnapshot['Content'].substring(0, 20)
                              : documentSnapshot['Content'],
                        ),
                        onTap: () {
                          (documentSnapshot.id);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PostPage(
                                    documentID: documentSnapshot.id,
                                    collectionName: "post")),
                          );
                        },
                        trailing: Visibility(
                          visible: documentSnapshot["Author"] ==
                              FirebaseAuth.instance.currentUser?.uid,
                          child: SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () => _update(documentSnapshot)),
                                IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () =>
                                        _delete(documentSnapshot.id)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
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
