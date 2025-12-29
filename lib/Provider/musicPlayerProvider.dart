import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../Models/songModel.dart';


class MusicPlayerProvider with ChangeNotifier {
  final _player = AudioPlayer();
  Song? _currentSong;
  bool _isPlaying = false;

  Song? get currentSong => _currentSong;
  bool get isPlaying => _isPlaying;

  Future<void> play(Song song) async {
    if (_currentSong != song) {
      await _player.setAsset(song.audioPath);
      _currentSong = song;
    }
    await _player.play();
    _isPlaying = true;
    notifyListeners();
  }

  Future<void> pause() async {
    await _player.pause();
    _isPlaying = false;
    notifyListeners();
  }

  void togglePlay(Song song) {
    if (_currentSong == song && _isPlaying) {
      pause();
    } else {
      play(song);
    }
  }

  void disposePlayer() {
    _player.dispose();
  }
}
