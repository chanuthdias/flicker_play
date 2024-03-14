import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({super.key});

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  final String documentId = "vUsHfXdcq9iKsYAJz7vq";

  @override
  Widget build(BuildContext context) {
    CollectionReference movies =
        FirebaseFirestore.instance.collection('Movies');

    return FutureBuilder<DocumentSnapshot>(
      future: movies.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("Title: ${data['title']}");
        }

        return Text("loading");
      },
    );
  }
}
