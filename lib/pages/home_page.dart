import 'package:flicker_play/models/movie.dart';
import 'package:flicker_play/services/api_services.dart';
import 'package:flicker_play/utills/end_points.dart';
import 'package:flicker_play/widgets/home_screen.dart';
import 'package:flicker_play/widgets/movie_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return const DefaultTabController(
        length: 5,
        child: Scaffold(
          body: Column(
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
                    Center(
                      child: Text("data"),
                    ),
                    Center(
                      child: Text("data"),
                    ),
                    Center(
                      child: Text("data"),
                    ),
                    Center(
                      child: Text("data"),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ));
  }
}
