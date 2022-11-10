import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flat_banners/flat_banners.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../enums/menu_action.dart';
import '../../services/auth/auth_service.dart';
import '../auth/login_view.dart';
import '../boiler/boiler.dart';
import 'post.dart';
import 'dart:developer' as devtools show log;

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<String> categoryList = [];
  Future<void> _initialize() async {
    var collection = FirebaseFirestore.instance.collection('post list');

    var docSnapshot = await collection.doc("all category").get();

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      var schedule = data['category'];
      for (String item in schedule) {
        setState(() {
          categoryList.add(item);
        });
      }
    }
    (categoryList.toString());
  }

  void initState() {
    _initialize();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Color.fromARGB(255, 46, 46, 46),
          elevation: 0.0,

          toolbarHeight: 40,
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Image(
                image: AssetImage('assets/bt_logo_white.png'),
              ),
            ),
          ),
          // backgroundColor: Color(0x44000000),
          // elevation: 0,
          // title: Text(
          //   "Boiler Time",
          //   // style: TextStyle(fontSize: 15),
          // ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(5),
            ),
          ),

          actions: [
            PopupMenuButton(
              onSelected: (value) async {
                switch (value) {
                  case MenuAction.logout:
                    final shouldLogout = await showLogOutDialog(context);
                    if (shouldLogout) {
                      await AuthService.firebase().logOut();
                      Navigator.of(context, rootNavigator: true)
                          .pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return LoginView();
                          },
                        ),
                        (route) => false,
                      );
                    }
                }
              },
              itemBuilder: (context) {
                return const [
                  PopupMenuItem<MenuAction>(
                    value: MenuAction.logout,
                    child: Text("Log out"),
                  )
                ];
              },
            )
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: FlatBanners(
                      imageWidth: 50,
                      gradientColors: [
                        const Color(0xff6C59D4).withOpacity(0.9),
                        const Color(0xff869DFB).withOpacity(0.7),
                      ],
                      title: 'Welcome to boiler time',
                      subtitle: 'View Categories',
                      btnText: 'Community',
                      image: 'assets/bt_logo_white.png',
                      onPressed: () {},
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(255, 131, 124, 132)),
                      borderRadius: BorderRadius.all(Radius.circular(
                              5.0) //                 <--- border radius here
                          ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: categoryList.length,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: 60,
                                    child: TextButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Color(0x00000000),
                                        ),
                                        child: ListTile(
                                          title: Text("\u{1F4AC}   " +
                                              categoryList[index]),
                                        ),
                                        onPressed: () {
                                          PersistentNavBarNavigator
                                              .pushNewScreen(
                                            context,
                                            screen: Post(
                                                categoryName:
                                                    categoryList[index]),
                                            withNavBar:
                                                false, // OPTIONAL VALUE. True by default.
                                            pageTransitionAnimation:
                                                PageTransitionAnimation
                                                    .cupertino,
                                          );
                                        }),
                                  ),
                                ],
                              );
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
