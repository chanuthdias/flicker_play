import 'dart:io';

import 'package:flicker_play/pages/user_edit_page.dart';
import 'package:flicker_play/providers/user_provider.dart';
import 'package:flicker_play/services/fire_base_services.dart';
import 'package:flicker_play/utills/colors.dart';
import 'package:flicker_play/widgets/home_screen.dart';
import 'package:flicker_play/widgets/movie_screen.dart';
import 'package:flicker_play/widgets/my_list_screen.dart';

import 'package:flicker_play/widgets/recently_added.dart';
import 'package:flicker_play/widgets/tv_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? imagePath;
  late SharedPreferences preferences;
  @override
  void initState() {
    super.initState();
    init();
    FireService().getUserDetails(context);
  }

  Future init() async {
    // preferences = await SharedPreferences.getInstance();
    // String? imagePath = preferences.getString('userImage');
    setState(() {
      imagePath = context.read<UserProvider>().imgPath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: AppColor.primaryColor,
          body: Container(
            // decoration: const BoxDecoration(
            //   gradient: LinearGradient(
            //       colors: [AppColor.primaryColor, AppColor.secondaryColor],
            //       begin: Alignment.topCenter,
            //       end: Alignment.bottomCenter),
            // ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/header_logo.png",
                      width: 50,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0, top: 30),
                          child: InkWell(
                              onTap: () async {
                                //await FirebaseAuth.instance.signOut();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const UserEdit()),
                                );
                              },
                              child: imagePath != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.file(
                                        File(imagePath!),
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      ))
                                  : Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.greenAccent,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                    )),
                        ),
                        context.read<UserProvider>().firstName != null
                            ? Center(
                                child: Text(
                                    context.read<UserProvider>().firstName!,
                                    style:
                                        const TextStyle(color: Colors.white)))
                            : Container()
                      ],
                    )
                  ],
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: 100,
                    width: 680,
                    child: TabBar(tabs: [
                      Tab(
                          icon: Text(
                        "Home",
                        style: TextStyle(color: Colors.white),
                      )),
                      Tab(
                          icon: Text("Movies",
                              style: TextStyle(color: Colors.white))),
                      Tab(
                          icon: Text("TV Shows",
                              style: TextStyle(color: Colors.white))),
                      Tab(
                          icon: Text("My List",
                              style: TextStyle(color: Colors.white))),
                      Tab(
                          icon: Text("Recently Added",
                              style: TextStyle(color: Colors.white))),
                    ]),
                  ),
                ),
                const Expanded(
                  child: SizedBox(
                    child: TabBarView(children: [
                      HomeScreen(),
                      MovieScreen(),
                      TVScreen(),
                      MyListScreen(),
                      RecentlyAdded()
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
