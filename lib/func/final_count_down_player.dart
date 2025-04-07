import 'dart:async';

import 'package:audioplayers/audioplayers.dart';

class FinalCountDownPlayer {
  final AudioPlayer _player = AudioPlayer();
  AssetSource _finalCountDownSource = AssetSource('sounds/done_8-bit.mp3');
  AssetSource _doneSource = AssetSource('sounds/finalcountdown_8-bit.mp3');

  int finalCountDownCount = 0;
  Timer? timer;

  void setAudio(audioName) {
    _finalCountDownSource = AssetSource('sounds/finalcountdown_$audioName.mp3');
    _doneSource = AssetSource('sounds/done_$audioName.mp3');
  }

  void playFinalCountDown() {
    _player.play(_finalCountDownSource);
  }

  void playDone() {
    _player.play(_doneSource);
  }

  void dispose() {
    _player.stop();
    _player.dispose();
  }
}
