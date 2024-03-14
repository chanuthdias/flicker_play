import 'package:firebase_auth/firebase_auth.dart';
import 'package:flicker_play/widgets/home_screen.dart';
import 'package:flicker_play/widgets/movie_screen.dart';
import 'package:flicker_play/widgets/my_list_screen.dart';

import 'package:flicker_play/widgets/recently_added.dart';
import 'package:flicker_play/widgets/tv_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(100)),
                    )),
              )
            ],
          ),
          body: const Column(
            children: [
              SingleChildScrollView(
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
