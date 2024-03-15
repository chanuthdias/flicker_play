import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class FireService {
  final movies = FirebaseFirestore.instance.collection('abcd@gmail.com');

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
        .add({
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

  Future<void> addUserDetails(
      {required String firstName,
      required String lastName,
      required String email}) {
    final users = FirebaseFirestore.instance.collection('users');
    return users
        .doc(email)
        .set({'firstName': firstName, 'lastName': lastName})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add movie: $error"));
  }

  getUserDetails(BuildContext context) {
    FirebaseFirestore.instance
        .collection('users')
        .doc('zxcv@gmail.com')
        .get()
        .then((querySnapshot) {
      print(querySnapshot['firstName']);
      print(querySnapshot['lastName']);

      context.read<UserProvider>().updateUserData(
          firstName: querySnapshot['firstName'],
          lastName: querySnapshot['lastName']);
    }).catchError((error) {
      print("Failed to add movie: $error");
    });
  }
}
