import 'dart:io';
import 'dart:js';

import 'package:corn_market/constants/routes.dart';
import 'package:corn_market/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import '../../enums/menu_action.dart';
import 'package:flutter/material.dart';
import 'package:theSocial/constant/Constantcolors.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _communityState();
}

class _communityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('chat'),
      ),
    );
  }
}

class community with ChangeNotifier{

  ConstantColors constanColors = ConstantColors();
  File uploadPostImage;
  File get getUploadPostImage => uploadPostImage;
  String uploadPostImageUrl;
  String get getUploadPostImageUrl => uploadPostImageUrl;
  final picker = ImagePicker();

  Future pickUploadPost(BuildContext context, ImageSource source) async {
    final pickedUserAvatar = await picker.getImage(source: source);
    pickedUserAvatar == null 
      ? print('Select Image')
      : userAvatar = File(pickedUserAvatar.path);
    print(userAvatar.path);

  userAvatar != null
      ? Provider.of<LandingService> (context, listen: false)
          .showUserAvatar(context)
      : print('Image Upload Error')

    notifyListeners();
  }

  selectPostImageType(BuildContext context){

    return showModalBottomSheet(
        context: context,
        builder: (context){
            return Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: constanColors.yellowColor,
                borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 150.0),
                    child: Divider(
                      thickness: 4.0
                      color: constantColors.whitecolor,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                          color: constantColors.blueColor,
                          child: Text("Gallary",
                              style: constantColors.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0),
                          onPressed: () {} ),
                      ]
                    )
                ],)
          )
       })
     }