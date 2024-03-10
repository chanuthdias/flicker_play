import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

import 'package:flicker_play/pages/main_page.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyA6-0mPIndGhvDEXI9KP4bo5gS6nxZyQ_c',
              appId: '1:13180334911:android:dbacaaa1a127cc90e8198a',
              messagingSenderId: '13180334911',
              projectId: 'flicker-play'))
      : await Firebase.initializeApp();

  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flicker Play',
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
    );
  }
}
