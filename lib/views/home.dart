import 'dart:html';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File file;

  handleTakePhoto() async {
    Navigator.pop(context);
    File file = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxHeight: 675,
      maxWidth: 960,
    );
    setState(() {
      this.file = file;
    });
  }

  selectImage(parentContext) {
    return showDialog(
        context: parentContext,
        builder: (context) {
          return SimpleDialog(
            title: const Text("Create Post"),
            children: <Widget>[
              const SimpleDialogOption(
                child: Text("Photo with Camera"),
                onPressed: handleTakePhoto(),
              ),
              const SimpleDialogOption(child: Text("Image from Gallery")),
              SimpleDialogOption(
                  child: const Text("Cancel"),
                  onPressed: () => Navigator.pop(context))
            ],
          );
        });
  }

  Container buildSplashScreen() {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/app-icon.png', height: 260.0),
            Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  onPressed: () => {selectImage(context)},
                  child: const Text(
                    "Upload Image",
                    style: TextStyle(
                        backgroundColor: Colors.yellow, fontSize: 22.0),
                  ),
                )),
          ],
        ));
  }

  buildUploadForm() {
    return Text("File loaded");
  }

  Widget build(BuildContext context) {
    return file == null ? buildSplashScreen() : buildUploadForm();
  }
}
