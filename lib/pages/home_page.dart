import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flicker_play/pages/user_edit_page.dart';
import 'package:flicker_play/widgets/home_screen.dart';
import 'package:flicker_play/widgets/movie_screen.dart';
import 'package:flicker_play/widgets/my_list_screen.dart';

import 'package:flicker_play/widgets/recently_added.dart';
import 'package:flicker_play/widgets/tv_screen.dart';
import 'package:flutter/material.dart';
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
    // TODO: implement initState
    super.initState();
    init();
  }

  Future init() async {
    preferences = await SharedPreferences.getInstance();
    String? imagePath = preferences.getString('userImage');
    setState(() {
      this.imagePath = imagePath;
    });
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
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
                                    borderRadius: BorderRadius.circular(100)),
                              )),
                  )
                ],
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: 100,
                  width: 680,
                  child: TabBar(tabs: [
                    Tab(icon: Text("Home")),
                    Tab(icon: Text("Movies")),
                    Tab(icon: Text("TV Shows")),
                    Tab(icon: Text("My List")),
                    Tab(icon: Text("Recently Added")),
                  ]),
                ),
              ),
              Expanded(
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
        ));
  }
}
