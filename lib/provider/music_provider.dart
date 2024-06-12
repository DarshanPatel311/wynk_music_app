// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter/material.dart';
//
// class MusicProvider extends ChangeNotifier {
//   AssetsAudioPlayer? assetsAudioPlayer = AssetsAudioPlayer();
//
//   void musicStar() {
//     assetsAudioPlayer!.open(Audio("assets/music/radhey.mp3"),
//         autoStart: false,
//         // showNotification: true
//     );
//     // notifyListeners();
//   }
// }


import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wynk_music_app/utils/audio_list.dart';


class MusicProvider extends ChangeNotifier {
  AssetsAudioPlayer? assetsAudioPlayer = AssetsAudioPlayer();
  double _sliderValue = 0.0;
  double _maxDuration = 0.0;
  double get sliderValue => _sliderValue;
  double get maxDuration => _maxDuration;
  void initializePlayer() {
    assetsAudioPlayer!.open(
      Playlist(audios: audioList),
      autoStart: false,
      showNotification: true,


    );
    // notifyListeners();
  }

  @override
  void dispose() {
    assetsAudioPlayer?.dispose();
    super.dispose();
  }
  void seek(double seconds) {
    assetsAudioPlayer!.seek(Duration(seconds: seconds.toInt()));
  }

  bool isplay=false;
  void songplay(){
    isplay=!isplay;
    notifyListeners();
  }
  List<Audio> _currentPlaylist = [];
  int _currentIndex = 0;

  void changeIndex(int index)
  {
    _currentIndex = index;
  }
  int get currentIndex => _currentIndex;
  MusicPlayerProvider() {
    setPlaylist(audioList);
  }

  void setPlaylist(List<Audio> playlist) {
    _currentPlaylist = playlist;
    assetsAudioPlayer!.open(
      Playlist(audios: _currentPlaylist, startIndex: _currentIndex),
      autoStart: false,
    );
    notifyListeners();
  }

  void playPreviousSong() {
    if (_currentIndex > 0) {
      _currentIndex--;
      assetsAudioPlayer?.playlistPlayAtIndex(_currentIndex);
      notifyListeners();
    }
  }

  void nextAudio() {
    if (_currentIndex < audioList.length - 1) {
      _currentIndex++;
    } else {
      _currentIndex = 0;
    }
    openAudio();
  }

  void openAudio() async {
    await




    assetsAudioPlayer!.currentPosition.listen((Duration position) {
      if (maxDuration != 0.0) {
        _sliderValue = position.inSeconds.toDouble();
        notifyListeners();
      }
    });

    assetsAudioPlayer!.current.listen((Playing? playing) {
      if (playing != null) {
        final duration = playing.audio.duration;
        _maxDuration = duration.inSeconds.toDouble();
        notifyListeners();
      }
    });
  }


  // Other playback control methods can be added here



}