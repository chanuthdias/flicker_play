import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../models/movie.dart';
import '../services/api_services.dart';
import '../utills/end_points.dart';
import 'movie_card.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Now Playing..",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          FutureBuilder(
              future: ApiServices().get(apiEndPoint: EndPoints.nowPlaying),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Movie movie = Movie.fromJson(snapshot.data!);
                  return SizedBox(
                    height: 280,
                    width: 500,
                    child: ListView.builder(
                        itemCount: movie.results!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return MovieCard(movie: movie.results![index]);
                        }),
                  );
                }
                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
              }),
          const Text(
            "Top Rated..",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          FutureBuilder(
              future: ApiServices().get(apiEndPoint: EndPoints.topRated),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Movie movie = Movie.fromJson(snapshot.data!);
                  return SizedBox(
                    height: 280,
                    width: 500,
                    child: ListView.builder(
                        itemCount: movie.results!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return MovieCard(movie: movie.results![index]);
                        }),
                  );
                }
                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
              }),
          const Text(
            "Popular..",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          FutureBuilder(
              future: ApiServices().get(apiEndPoint: EndPoints.popular),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Movie movie = Movie.fromJson(snapshot.data!);
                  return SizedBox(
                    height: 280,
                    width: 500,
                    child: ListView.builder(
                        itemCount: movie.results!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return MovieCard(movie: movie.results![index]);
                        }),
                  );
                }
                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
              })
        ],
      ),
    );
  }
}
