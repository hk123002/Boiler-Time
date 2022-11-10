// ignore_for_file: prefer_const_constructors

import 'dart:ffi';
import 'dart:math';

import 'package:banner_carousel/banner_carousel.dart';
import 'package:boiler_time/constants/routes.dart';
import 'package:boiler_time/services/auth/auth_service.dart';
import 'package:boiler_time/views/boiler/developers.dart';
import 'package:boiler_time/views/community/postPage.dart';

import 'package:boiler_time/views/home/about/academic_schedule.dart';
import 'package:boiler_time/views/home/about/bus_schedule.dart';
import 'package:boiler_time/views/home/about/dining_menu.dart';
import 'package:boiler_time/views/home/about/library_schedule.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flat_banners/flat_banners.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'dart:developer' as devtools show log;

import '../../enums/menu_action.dart';
import '../auth/login_view.dart';
import '../boiler/boiler.dart';
import '../community/myPost.dart';
import '../community/post.dart';
import '../main_view.dart';
import '../community/post.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeViewState();
}

class _homeViewState extends State<home> {
  List<String> classList = [];
  List<String> hourList = [];

  // List<String> hotPostTitle = ["hi", "hi1", "hi2", "hi3"];
  // List<String> hotPostContent = [];
  // List<String> hotPostID = [];
  List<String> categoryList = [];
  List<String> postList = [];
  List<String> postNameList = [];
  String? name;
  late DateTime date;
  late String day;
  late int dayHint;

  List<String> welcomeMessage = [
    "Not last dance,\nThe dance lasts",
    "What's important is\nunbroken heart",
    "It's not how much time you have,\nit's how you use it",
    "Forget the past,\ncause it's just covering the future",
    "I fight for the better future",
    "Never underestimate the\npower of the Scout's code.",
    "If you believe in your worth, fight",
    "The past is a mirror\nthat refers the future",
    "It's hard to climb the mountain,\nbut the views from the top\nare well worth it",
    "Those who wait to be freed\ndo not deserve freedom",
  ];

  //get user data

  Future<void> _getUserData() async {
    setState(() {
      date = DateTime.now();
      day = DateFormat('EEEE').format(date);
    });
    var usercollection = FirebaseFirestore.instance.collection('users');

    var docSnapshot =
        await usercollection.doc(FirebaseAuth.instance.currentUser?.uid).get();

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;

      // You can then retrieve the value from the Map like this:

      setState(() {
        name = data['name'];
      });
      (name.toString());
    }

    //fetch data for calendar

    (day + "and " + (day == "Monday").toString());
    if (day == "Monday") {
      dayHint = 0;
    } else if (day == "Tuesday") {
      dayHint = 1;
    } else if (day == "Wednesday") {
      dayHint = 2;
    } else if (day == "Thursday") {
      dayHint = 3;
    } else if (day == "Friday") {
      dayHint = 4;
    } else {
      dayHint = -1;
    }
    var calenarcollection = FirebaseFirestore.instance.collection('calendar');

    docSnapshot = await calenarcollection
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;

      var schedule = data['schedule'];
      for (String item in schedule) {
        var split = item.split(":");
        int day = int.parse(split[1]);
        String schedule = split[0];
        int hour = int.parse(split[2]);
        int minute = int.parse(split[3]);
        int duration = int.parse(split[4]);
        ("day is " + day.toString() + " and dayhint is " + dayHint.toString());
        if (day == dayHint) {
          ("adding class...");
          String startTimeHint;
          int modifiedStartHour = 0;

          if (hour > 12) {
            modifiedStartHour = hour - 12;
            (hour.toString());
            startTimeHint = modifiedStartHour.toString() + ":";
            if (minute.toString() == "0") {
              startTimeHint += "0" + "0";
            } else {
              startTimeHint += minute.toString();
            }
          } else {
            startTimeHint = hour.toString() + ":";

            if (minute.toString() == "0") {
              startTimeHint += "0" + "0";
            } else {
              startTimeHint += minute.toString();
            }
          }
          int endTimeHintInt = hour * 60 + minute + duration;

          String endTimeHint;
          if (((endTimeHintInt / 60).floor()) > 12) {
            endTimeHint = ((endTimeHintInt / 60).floor() - 12).toString() + ":";
            if ((endTimeHintInt % 60).toString() == "0") {
              endTimeHint += "0" + "0";
            } else {
              endTimeHint += (endTimeHintInt % 60).toString();
            }
          } else {
            endTimeHint = ((endTimeHintInt / 60).floor()).toString() + ":";

            if ((endTimeHintInt % 60).toString() == "0") {
              endTimeHint += "0" + "0";
            } else {
              endTimeHint += (endTimeHintInt % 60).toString();
            }
          }

          setState(() {
            classList.add(schedule);
            hourList.add(startTimeHint.toString() + " - " + endTimeHint);
          });
        }
      }
    }
  }

// initialize most viewed and host post from firebase

  Future<void> _initialize() async {
    var collection = FirebaseFirestore.instance.collection('post list');

    var docSnapshot = await collection.doc("most viewed").get();

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

    docSnapshot = await collection.doc("hot post").get();

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      var postData = data['post'];

      for (String item in postData) {
        var split = item.split(":");
        var name = split[0];
        var id = split[1];
        postList.add(id);
        postNameList.add(name);
      }
    }

    (postList.toString());
  }

  late final _random;
  late final randomIndex;
  @override
  void initState() {
    _random = new Random();
    randomIndex = _random.nextInt(welcomeMessage.length);
    _getUserData();
    _initialize();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
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
        body: ListView(
          children: [
            Wrap(children: [
              //banner
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        // const SizedBox(height: 20),

                        /// Carousel FullScreen
                        BannerCarousel.fullScreen(
                          activeColor: Color.fromARGB(255, 15, 223, 207),

                          banners: BannerImages.listBanners,
                          height: 80,
                          animation: false,
                          initialPage: 0,
                          indicatorBottom: false,
                          // OR pageController: PageController(initialPage: 6),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          welcomeMessage[randomIndex],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          name.toString(),
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 189, 189, 189),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),

              // card when there's no class
              Visibility(
                visible: classList.isEmpty,
                child: Center(
                  child: Container(
                    width: 330,
                    child: Card(
                      // color: Color.fromARGB(255, 71, 71, 71),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                            color: Color.fromARGB(
                                255, 43, 43, 43)), // color for borderline
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Text(
                                  "\u{1F4CB}  Today's class",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 35,
                                ),
                                Text(
                                  day.toLowerCase(),
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 35,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 35,
                                ),
                                Text(
                                  "You have no class today! \u{1F389}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(children: [
                              SizedBox(
                                width: 35,
                              ),
                            ]),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              //card when there's class today
              Visibility(
                visible: classList.isNotEmpty,
                child: SizedBox(
                  height: 170, // card height
                  child: PageView.builder(
                    itemCount: classList.length,
                    controller: PageController(viewportFraction: 0.85),
                    onPageChanged: (int index) =>
                        setState(() => _index = index),
                    itemBuilder: (_, i) {
                      return Transform.scale(
                        scale: i == _index ? 1 : 0.9,
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                                color: Color.fromARGB(255, 43, 43, 43)),

                            /// color for borderline
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "\u{1F4CB}  Today's class",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 35,
                                    ),
                                    Text(
                                      day.toLowerCase(),
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 35,
                                    ),
                                    Text(
                                      classList[i],
                                      style: TextStyle(
                                        fontSize: 15,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(children: [
                                  SizedBox(
                                    width: 35,
                                  ),
                                  Text(
                                    hourList[i],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              SizedBox(
                height: 180,
              ),
              //row for button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // button for my post
                  Column(
                    children: [
                      FloatingActionButton.small(
                        heroTag: "mypost",
                        elevation: 0,
                        backgroundColor: Color.fromARGB(255, 41, 41, 41),
                        onPressed: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: MyPost(),
                            withNavBar:
                                false, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        child: Center(
                          child: Icon(
                            size: 20,
                            Icons.my_library_add,
                            color: Color.fromARGB(180, 51, 255, 51),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "my post",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),

                  //button for bus schedule

                  Column(
                    children: [
                      FloatingActionButton.small(
                        heroTag: "bus",
                        elevation: 0,
                        backgroundColor: Color.fromARGB(255, 41, 41, 41),
                        onPressed: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: BusSchedule(),
                            withNavBar:
                                false, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        child: Center(
                          child: Icon(
                            size: 20,
                            Icons.bus_alert_outlined,
                            color: Color.fromARGB(180, 255, 255, 0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "bus schedule",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),

                  //button for library

                  Column(
                    children: [
                      FloatingActionButton.small(
                        heroTag: "library",
                        elevation: 0,
                        backgroundColor: Color.fromARGB(255, 41, 41, 41),
                        onPressed: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: LibraryTime(),
                            withNavBar:
                                false, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        child: Center(
                          child: Icon(
                            size: 20,
                            Icons.school,
                            color: Color.fromARGB(180, 15, 223, 207),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "library",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),

                  //button for menu
                  Column(
                    children: [
                      FloatingActionButton.small(
                        heroTag: "developers",
                        elevation: 0,
                        backgroundColor: Color.fromARGB(255, 41, 41, 41),
                        onPressed: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: Developers(),
                            withNavBar:
                                false, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        child: Center(
                          child: Icon(
                            size: 20,
                            Icons.person,
                            color: Color.fromARGB(180, 223, 15, 135),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "developers",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),

                  //button for academic schedule
                  Column(
                    children: [
                      FloatingActionButton.small(
                        heroTag: "holiday",
                        elevation: 0,
                        backgroundColor: Color.fromARGB(255, 41, 41, 41),
                        onPressed: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: AcademicSchedule(),
                            withNavBar:
                                false, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        child: Center(
                          child: Icon(
                            size: 20,
                            Icons.schedule,
                            color: Color.fromARGB(180, 103, 15, 223),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "holidays",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 80,
              ),

              //most viewed

              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 40, 40, 40),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(
                          5.0) //                 <--- border radius here
                      ),
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 3,
                    ),
                    Row(children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 13,
                            ),
                            Text(
                              "  Most viewed",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            primary: Colors.red.withOpacity(0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(2),
                                ),
                                side: BorderSide(
                                    color: Colors.red.withOpacity(0))),
                          ),
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true)
                                .pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return MainView(
                                    index: 1,
                                  );
                                },
                              ),
                              (_) => false,
                            );
                          },
                          child: Row(
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              // Text(
                              //   'see more',
                              //   style: TextStyle(
                              //     color: Colors.white,
                              //   ),
                              // ), // <-- Text

                              Icon(
                                // <-- Icon
                                Icons.navigate_next_outlined,
                                color: Colors.white,

                                size: 24.0,
                                // color: Color.fromARGB(255, 193, 155, 200),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ]),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: categoryList.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 50,
                            child: TextButton(
                              child: ListTile(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '\u{1F4CC}   ' + categoryList[index],
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onPressed: () => {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen:
                                      Post(categoryName: categoryList[index]),
                                  withNavBar:
                                      false, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                )
                              },
                            ),
                          );
                        }),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),

              //most viewed

              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 40, 40, 40),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(
                          5.0) //                 <--- border radius here
                      ),
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 3,
                    ),
                    Row(children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 13,
                            ),
                            Text(
                              "  Hot post",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            primary: Colors.red.withOpacity(0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(2),
                                ),
                                side: BorderSide(
                                    color: Colors.red.withOpacity(0))),
                          ),
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true)
                                .pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return MainView(
                                    index: 1,
                                  );
                                },
                              ),
                              (_) => false,
                            );
                          },
                          child: Row(
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              // Text(
                              //   'see more',
                              //   style: TextStyle(
                              //     color: Colors.white,
                              //   ),
                              // ), // <-- Text

                              Icon(
                                // <-- Icon
                                Icons.navigate_next_outlined,
                                color: Colors.white,

                                size: 24.0,
                                // color: Color.fromARGB(255, 193, 155, 200),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ]),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: postList.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 50,
                            child: TextButton(
                              child: ListTile(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '\u{1F525}   ' + postNameList[index],
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onPressed: () => {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: PostPage(
                                      documentID: postList[index],
                                      collectionName: "post"),
                                  withNavBar:
                                      false, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                )
                              },
                            ),
                          );
                        }),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              //hot pots
            ]),
          ],
        ),
      ),
    );
  }
}

class BannerImages {
  static const String banner1 =
      "https://www.jaxon.gg/wp-content/uploads/2022/11/Deft.png";
  static const String banner2 =
      "https://www.purdue.edu/studentsuccess/images/pillar-banner.jpg";
  static const String banner3 =
      "https://file.thisisgame.com/upload/nboard/news/2022/02/11/20220211104008_4939w.jpg";

  static const String banner4 =
      "https://parimatchnews.com/wp-content/uploads/2022/11/%D0%B4%D0%B4.png";

  static List<BannerModel> listBanners = [
    BannerModel(imagePath: banner1, id: "1"),
    BannerModel(imagePath: banner2, id: "2"),
    BannerModel(imagePath: banner3, id: "3"),
    BannerModel(imagePath: banner4, id: "4"),
  ];
}

class BannerClass {
  static const String banner1 =
      "https://www.jaxon.gg/wp-content/uploads/2022/11/Deft.png";
  static const String banner2 =
      "https://www.purdue.edu/studentsuccess/images/pillar-banner.jpg";
  static const String banner3 =
      "https://file.thisisgame.com/upload/nboard/news/2022/02/11/20220211104008_4939w.jpg";

  static const String banner4 =
      "https://parimatchnews.com/wp-content/uploads/2022/11/%D0%B4%D0%B4.png";
  static List<BannerModel> listBanners = [
    BannerModel(imagePath: banner1, id: "1"),
    BannerModel(imagePath: banner2, id: "2"),
    BannerModel(imagePath: banner3, id: "3"),
    BannerModel(imagePath: banner4, id: "4"),
  ];
}
