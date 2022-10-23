import 'package:banner_carousel/banner_carousel.dart';
import 'package:boiler_time/constants/routes.dart';
import 'package:boiler_time/services/auth/auth_service.dart';
import 'package:boiler_time/views/home/about/academic_schedule.dart';
import 'package:boiler_time/views/home/about/bus_schedule.dart';
import 'package:boiler_time/views/home/about/dining_menu.dart';
import 'package:boiler_time/views/home/about/library_schedule.dart';
import 'package:flat_banners/flat_banners.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import '../../enums/menu_action.dart';
import '../community/exam.dart';
import '../main_view.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeViewState();
}

class _homeViewState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        leading: Icon(Icons.stop_circle_outlined),
        // title: Text(
        //   "Purdue Univ",
        //   style: TextStyle(fontStyle: FontStyle.italic),
        // ),
      ),
      body: ListView(
        children: [
          Wrap(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                /// Carousel FullScreen
                BannerCarousel.fullScreen(
                  banners: BannerImages.listBanners,
                  height: 130,
                  animation: false,
                  initialPage: 1,
                  indicatorBottom: false,
                  // OR pageController: PageController(initialPage: 6),
                ),

                SizedBox(
                  height: 20,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.bus_alert),
                      iconSize: 30.0,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BusSchedule()),
                        );
                      },
                    ),
                    Text(
                      "Bus Schedule",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.school),
                      iconSize: 30.0,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LibraryTime()),
                        );
                      },
                    ),
                    Text(
                      "Library Scheudle",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.dining),
                      iconSize: 30.0,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DiningMenu()),
                        );
                      },
                    ),
                    Text(
                      "Dining Menu",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.schedule),
                      iconSize: 30.0,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AcademicSchedule()),
                        );
                      },
                    ),
                    Text(
                      "Academic Scheudle",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 30.0),
                child: FlatBanners(
                  imageWidth: 50,
                  gradientColors: [
                    Color.fromARGB(255, 2, 3, 2).withOpacity(0.9),
                    Color.fromARGB(255, 65, 69, 42).withOpacity(0.7),
                  ],
                  title: 'Gen.G Esports',
                  subtitle: 'CHOOOOVY',
                  btnText: 'find out more',
                  image: 'geng.png',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 131, 124, 132)),
                borderRadius: BorderRadius.all(Radius.circular(
                        5.0) //                 <--- border radius here
                    ),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Most viewed community",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 50,
                    child: TextButton(
                      child: ListTile(
                        title: Text('One-line with leading widget'),
                      ),
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Exam()),
                        )
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: TextButton(
                      child: ListTile(
                        title: Text('One-line with leading widget'),
                      ),
                      onPressed: () => {},
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: TextButton(
                      child: ListTile(
                        title: Text('One-line with leading widget'),
                      ),
                      onPressed: () => {},
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: TextButton(
                      child: ListTile(
                        title: Text('One-line with leading widget'),
                      ),
                      onPressed: () => {},
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: TextButton(
                      child: ListTile(
                        title: Text('One-line with leading widget'),
                      ),
                      onPressed: () => {},
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: TextButton(
                      child: ListTile(
                        title: Text('One-line with leading widget'),
                      ),
                      onPressed: () => {},
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: TextButton(
                      child: ListTile(
                        title: Text('One-line with leading widget'),
                      ),
                      onPressed: () => {},
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 131, 124, 132)),
                borderRadius: BorderRadius.all(Radius.circular(
                        5.0) //                 <--- border radius here
                    ),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Most viewed community",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 50,
                    child: TextButton(
                      child: ListTile(
                        title: Text('One-line with leading widget'),
                      ),
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Exam()),
                        )
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: TextButton(
                      child: ListTile(
                        title: Text('One-line with leading widget'),
                      ),
                      onPressed: () => {},
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: TextButton(
                      child: ListTile(
                        title: Text('One-line with leading widget'),
                      ),
                      onPressed: () => {},
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: TextButton(
                      child: ListTile(
                        title: Text('One-line with leading widget'),
                      ),
                      onPressed: () => {},
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: TextButton(
                      child: ListTile(
                        title: Text('One-line with leading widget'),
                      ),
                      onPressed: () => {},
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: TextButton(
                      child: ListTile(
                        title: Text('One-line with leading widget'),
                      ),
                      onPressed: () => {},
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: TextButton(
                      child: ListTile(
                        title: Text('One-line with leading widget'),
                      ),
                      onPressed: () => {},
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

class BannerImages {
  static const String banner1 =
      "https://file.thisisgame.com/upload/nboard/news/2022/02/11/20220211104008_4939w.jpg";
  static const String banner2 =
      "https://www.kukinews.com/data/kuk/cache/2022/06/14/kuk202206140165.680x.0.jpg";
  static const String banner3 =
      "https://file.thisisgame.com/upload/nboard/news/2022/02/11/20220211104008_4939w.jpg";

  static const String banner4 =
      "https://file.thisisgame.com/upload/nboard/news/2022/02/11/20220211104008_4939w.jpg";

  static List<BannerModel> listBanners = [
    BannerModel(imagePath: banner1, id: "1"),
    BannerModel(imagePath: banner2, id: "2"),
    BannerModel(imagePath: banner3, id: "3"),
    BannerModel(imagePath: banner4, id: "4"),
  ];
}
