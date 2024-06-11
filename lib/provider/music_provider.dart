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


  bool isplay=false;
  void songplay(){
    isplay=!isplay;
    notifyListeners();
  }
  List<Audio> _currentPlaylist = [];
  int _currentIndex = 0;

  MusicPlayerProvider() {
    setPlaylist(audioList);
  }

  void setPlaylist(List<Audio> playlist) {
    _currentPlaylist = playlist;
    _currentIndex = 0;
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

  // Other playback control methods can be added here

  List<Audio> get currentPlaylist => _currentPlaylist;
  int get currentIndex => _currentIndex;
  AssetsAudioPlayer? get player => assetsAudioPlayer;


  double _sliderValue = 0.0;
  double _maxDuration = 0.0;

  double get sliderValue => _sliderValue;

  double get maxDuration => _maxDuration;

  AudioPlayerProvider() {
    _openAudio();
  }

  void _openAudio() async {
    await assetsAudioPlayer!.open(
      Audio("assets/audio/duniya.mp3"),
      autoStart: false,
      showNotification: true,
    );

    assetsAudioPlayer!.currentPosition.listen((Duration position) {
      if (_maxDuration != 0.0) {
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

  void play() {
    assetsAudioPlayer!.play();
  }

  void pause() {
    assetsAudioPlayer!.pause();
  }

  void seek(double seconds) {
    assetsAudioPlayer!.seek(Duration(seconds: seconds.toInt()));
  }


}