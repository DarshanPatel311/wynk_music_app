# Wynk Music App


### 1. Set Up Your Flutter Environment

If you haven't already, set up Flutter on your machine:

- Download and install Flutter from [flutter.dev](https://flutter.dev/docs/get-started/install).
- Ensure you have an editor like Visual Studio Code or Android Studio set up with Flutter and Dart plugins.

### 2. Create a New Flutter Project

Open your terminal or command prompt and run:

```bash
flutter create audio_app
cd audio_app
```

### 3. Add Necessary Dependencies

You will need a package to handle audio playback. One of the most popular packages for this purpose is `just_audio`. Add it to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  just_audio: ^0.9.18
  provider: ^6.0.2 # For state management
```

Run `flutter pub get` to install the new dependencies.

### 4. Implementing the User Interface

Open the `lib/main.dart` file and set up a basic UI. For simplicity, we will create a single screen with play, pause, and stop buttons.

```dart
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AudioProvider(),
      child: MaterialApp(
        title: 'Audio App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AudioPlayerScreen(),
      ),
    );
  }
}

class AudioPlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final audioProvider = Provider.of<AudioProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Audio App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => audioProvider.play(),
              child: Text('Play'),
            ),
            ElevatedButton(
              onPressed: () => audioProvider.pause(),
              child: Text('Pause'),
            ),
            ElevatedButton(
              onPressed: () => audioProvider.stop(),
              child: Text('Stop'),
            ),
          ],
        ),
      ),
    );
  }
}

class AudioProvider extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();

  void play() async {
    try {
      await _audioPlayer.setUrl('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3');
      _audioPlayer.play();
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  void pause() {
    _audioPlayer.pause();
  }

  void stop() {
    _audioPlayer.stop();
  }
}
```

This simple app provides a basic structure for an audio player. The `AudioProvider` class handles the audio logic using the `just_audio` package, while the UI consists of buttons to control the audio playback.

### 5. Expand Functionality

To build a more comprehensive audio app, you might want to add features like:

- **Audio playlists**: Manage multiple audio tracks.
- **UI enhancements**: Display current track information, add progress bars, etc.
- **State management**: Use `Provider`, `Bloc`, or another state management solution for more complex state handling.
- **Offline support**: Download and play audio files offline.

### Example for Adding a Playlist

You can enhance the `AudioProvider` to manage a playlist:

```dart
class AudioProvider extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final List<String> _playlist = [
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3',
  ];
  int _currentIndex = 0;

  void play() async {
    try {
      await _audioPlayer.setUrl(_playlist[_currentIndex]);
      _audioPlayer.play();
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  void pause() {
    _audioPlayer.pause();
  }

  void stop() {
    _audioPlayer.stop();
  }

  void next() {
    if (_currentIndex < _playlist.length - 1) {
      _currentIndex++;
      play();
    }
  }

  void previous() {
    if (_currentIndex > 0) {
      _currentIndex--;
      play();
    }
  }
}
```

Update the `AudioPlayerScreen` to include buttons for next and previous:

```dart
ElevatedButton(
  onPressed: () => audioProvider.previous(),
  child: Text('Previous'),
),
ElevatedButton(
  onPressed: () => audioProvider.next(),
  child: Text('Next'),
),
```



### ScreenShort


<p align='center'>
  <img src='https://github.com/DarshanPatel311/wynk_music_app/assets/143177575/38920aaf-026e-4c70-b26e-dd77ffe90bdf' width=240>
  <img src='https://github.com/DarshanPatel311/wynk_music_app/assets/143177575/11584b2f-6b4f-4c0e-84ba-00a9f85f797b' width=240>
  <img src='https://github.com/DarshanPatel311/wynk_music_app/assets/143177575/36ab2614-9a51-4822-9670-3beee32b704b' width=240>
  <img src='https://github.com/DarshanPatel311/wynk_music_app/assets/143177575/697ca622-cea2-4275-8f4e-76a2b57e9342' width=240>

</p>

### Video



https://github.com/DarshanPatel311/wynk_music_app/assets/143177575/9fdef75e-d5e3-4dff-8e2a-e9c21e07ea4b






