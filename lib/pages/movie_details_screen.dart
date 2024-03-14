import 'package:flicker_play/constants.dart';
import 'package:flicker_play/models/movie.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            Constants.lBaseImgPath + widget.movieData.posterPath!,
            width: screenWidth,
            height: 250,
            fit: BoxFit.cover,
          ),
          Text(
            widget.movieData.originalTitle!,
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            widget.movieData.overview!,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
