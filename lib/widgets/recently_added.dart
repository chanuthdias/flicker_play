import 'package:flicker_play/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../models/movie.dart';
import '../services/api_services.dart';
import '../utills/end_points.dart';

class RecentlyAdded extends StatefulWidget {
  const RecentlyAdded({super.key});

  @override
  State<RecentlyAdded> createState() => _RecentlyAddedState();
}

class _RecentlyAddedState extends State<RecentlyAdded> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiServices().get(apiEndPoint: EndPoints.nowPlaying),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Movie movie = Movie.fromJson(snapshot.data!);
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: movie.results!.length,
                itemBuilder: (context, index) {
                  return MovieCard(movie: movie.results![index]);
                });
          }
          return SizedBox(
            height: 200,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[500]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
}
