import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../provider/music_provider.dart';

Row control_button(MusicProvider providerTrue, MusicProvider providerFalse) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Icon(
        Icons.repeat_one_outlined,
        color: Colors.redAccent,
        size: 35,
      ),
      SizedBox(),
      IconButton(
        onPressed: () {
          providerTrue.assetsAudioPlayer!.previous();
          providerFalse.playPreviousSong();
        },
        icon: Icon(
          Icons.fast_rewind,
          color: Colors.white,
          size: 40,
        ),
      ),
      (providerFalse.isplay)
          ? IconButton(
              onPressed: () {
                providerFalse.assetsAudioPlayer!.play();

                providerTrue.songplay();
              },
              icon: Icon(
                Icons.play_circle_fill,
                color: Colors.white,
                size: 75,
              ),
            )
          : IconButton(
              onPressed: () {

                  providerFalse.assetsAudioPlayer!.pause();

                  providerTrue.songplay();

              },
              icon: Icon(
                Icons.pause_circle,
                color: Colors.white,
                size: 75,
              ),
            ),
      IconButton(
        onPressed: () {
          providerTrue.assetsAudioPlayer!.previous();
          providerFalse.nextAudio();
        },
        icon: Icon(
          Icons.fast_forward_sharp,
          color: Colors.white,
          size: 40,
        ),
      ),
      SizedBox(),
      Icon(
        Icons.timer_outlined,
        color: Colors.white,
        size: 30,
      ),
    ],
  );
}
