import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wynk_music_app/provider/music_provider.dart';
import 'package:wynk_music_app/screens/home_screen.dart';
import 'package:wynk_music_app/screens/song_screen.dart';




void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MusicProvider(),
    builder: (context, child) =>  MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  routes: {
    '/':(context) => HomeScreen(),
    '/song':(context) => SongScreen()
  },
    );
  }
}
