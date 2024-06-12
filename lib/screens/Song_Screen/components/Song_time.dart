
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../provider/music_provider.dart';

Padding Song_time(MusicProvider providerTrue) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text('${providerTrue.sliderValue ~/ 60}:',style: TextStyle(color: Colors.white)),
            Text((providerTrue.sliderValue.toInt() % 60)
                .toString()
                .padLeft(2, '0'),style: TextStyle(color: Colors.white)),
          ],
        ),
        Row(
          children: [
            Text('${providerTrue.maxDuration ~/ 60}:',style: TextStyle(color: Colors.white),),
            Text('${(providerTrue.maxDuration.toInt() % 60).toString()..padRight(2, '0')}',style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
    ),
  );
}