import 'package:flicker_play/constants.dart';
import 'package:flicker_play/models/movie.dart';
import 'package:flicker_play/utills/colors.dart';
import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatefulWidget {
  final Results movieData;

  const MovieDetailsScreen({super.key, required this.movieData});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      backgroundColor: AppColor.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            Constants.lBaseImgPath + widget.movieData.posterPath!,
            width: screenWidth,
            height: 250,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              widget.movieData.originalTitle!,
              style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Text(
                  "TMDB Ratings: ${widget.movieData.voteAverage}",
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              widget.movieData.overview!,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
