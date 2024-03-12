import 'package:flicker_play/models/movie.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatefulWidget {
  final Results movie;

  const MovieCard({super.key, required this.movie});

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  String lBaseImgPath = "https://image.tmdb.org/t/p/w500";
  String oImgBasePath = "https://image.tmdb.org/t/p/original";
  @override
  Widget build(BuildContext context) {
    var movieItem = widget.movie;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: 280,
        width: 200,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              lBaseImgPath + movieItem.posterPath!,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            Text(movieItem.originalTitle!),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(movieItem.voteAverage.toString()),
                  const Icon(Icons.favorite)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
