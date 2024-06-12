import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:wynk_music_app/utils/Screen_list.dart';

import '../../../provider/music_provider.dart';
import '../home_screen.dart';
import '../../Song_Screen/song_screen.dart';

ConvexAppBar bottomNavigation(MusicProvider providerFalse, MusicProvider providerTrue) {
  return ConvexAppBar(

    backgroundColor: Colors.black,

    style: TabStyle.fixedCircle,
    activeColor: Colors.pink,
    items: [
      TabItem(icon: Icons.home, title: 'Home'),
      TabItem(icon: Icons.music_video, title: 'My Music'),
      (providerFalse.isplay)?TabItem(icon: Icons.play_arrow_outlined, title: 'Song',):TabItem(icon: Icons.pause_circle, title: 'Song',isIconBlend: providerTrue.isplay),
      TabItem(icon: Icons.queue_music, title: 'Hellotunes'),
      TabItem(icon: Icons.people, title: 'Profile'),

    ],
    onTap: (index) => Screenlist,


  );
}
