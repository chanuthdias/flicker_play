import 'package:cloud_firestore/cloud_firestore.dart';

class FireService {
  CollectionReference movies = FirebaseFirestore.instance.collection('Movies');

  Future<void> addFavouriteMovie(
      {required String originalTitle,
      required String overview,
      required double popularity,
      required String posterPath,
      required String releaseDate,
      required String title,
      required double voteAverage,
      required int voteCount}) {
    return movies
        .doc('test1')
        .set({
          'originalTitle': originalTitle,
          'overview': overview,
          'popularity': popularity,
          'posterPath': posterPath,
          'releaseDate': releaseDate,
          'title': title,
          'voteAverage': voteAverage,
          'voteCount': voteCount
        })
        .then((value) => print("Movie Added"))
        .catchError((error) => print("Failed to add movie: $error"));
  }
}
