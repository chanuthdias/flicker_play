import 'package:flicker_play/constants.dart';
import 'package:flicker_play/models/movie.dart';
import 'package:flicker_play/pages/movie_details_screen.dart';
import 'package:flicker_play/services/fire_base_services.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatefulWidget {
  final Results movie;

  const MovieCard({super.key, required this.movie});

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  String lBaseImgPath = Constants.lBaseImgPath;

  @override
  Widget build(BuildContext context) {
    var movieItem = widget.movie;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetailsScreen(
                      movieData: widget.movie,
                    )),
          );
        },
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
              Text(
                movieItem.originalTitle!,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(movieItem.voteAverage.toString()),
                    InkWell(
                        onTap: () {
                          FireService().addFavouriteMovie(
                            originalTitle: movieItem.originalTitle!,
                            overview: movieItem.overview!,
                            popularity: movieItem.popularity!,
                            posterPath: movieItem.posterPath!,
                            releaseDate: movieItem.releaseDate!,
                            title: movieItem.title!,
                            voteAverage: movieItem.voteAverage!,
                            voteCount: movieItem.voteCount!,
                          );
                        },
                        child: const Icon(Icons.favorite))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
