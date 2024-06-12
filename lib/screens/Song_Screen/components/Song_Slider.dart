import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../provider/music_provider.dart';

SliderTheme Song_Slider(BuildContext context, MusicProvider providerFalse, MusicProvider providerTrue) {
  return SliderTheme(
    data: SliderTheme.of(context).copyWith(
      trackHeight: 1.5,

      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
    ),
    child: Slider(
      activeColor: Colors.white,

      value: providerFalse.sliderValue,
      max: providerTrue.maxDuration > 0
          ? providerTrue.maxDuration
          : 1.0,
      onChanged: (value) {
        if (providerTrue.maxDuration > 0) {
          providerFalse.seek(value);
        }
      },
    ),
  );
}
