import 'package:flicker_play/widgets/movie_card.dart';
import 'package:flutter/material.dart';

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
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return MovieCard(movie: movie);
                });
          }
        });
  }
}
