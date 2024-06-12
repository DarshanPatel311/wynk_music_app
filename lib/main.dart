import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wynk_music_app/provider/music_provider.dart';
import 'package:wynk_music_app/screens/Home_Screen/home_screen.dart';
import 'package:wynk_music_app/screens/Song_Screen/Song_screen2.dart';
import 'package:wynk_music_app/screens/Song_Screen/song_screen.dart';
import 'package:wynk_music_app/screens/Song_Screen/song_screen3.dart';
import 'package:wynk_music_app/screens/splash_screen.dart';




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
      debugShowCheckedModeBanner: false,
  routes: {
    '/':(context) => SplashScreen(),
    '/Home':(context) => HomeScreen(),
    '/song':(context) => SongScreen(),
    '/song2':(context) => SongScreen2(),
    '/song3':(context) => SongScreen3(),
  },
    );
  }
}
