import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flicker_play/models/movie.dart';
import 'package:flicker_play/widgets/movie_card.dart';
import 'package:flutter/material.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({super.key});

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream =
        FirebaseFirestore.instance.collection('abcd@gmail.com').snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return MovieCard(
              isFavourite: false,
              movie: Results(
                  originalTitle: data['originalTitle'],
                  overview: data['overview'],
                  posterPath: data['posterPath'],
                  releaseDate: data['releaseDate'],
                  voteAverage: data['voteAverage'],
                  voteCount: data['voteCount']),
            );
          }).toList(),
        );
      },
    );
  }
}
