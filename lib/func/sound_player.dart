import 'package:audioplayers/audioplayers.dart';

class SoundPlayer {
  final AudioPlayer _finalCountDownPlayer = AudioPlayer();
  final AudioPlayer _donePlayer = AudioPlayer();

  SoundPlayer() {
    _finalCountDownPlayer.setSource(AssetSource('sounds/done_8-bit.mp3'));
    _finalCountDownPlayer.setReleaseMode(ReleaseMode.stop);
    _donePlayer.setSource(AssetSource('sounds/finalcountdown_8-bit.mp3'));
    _donePlayer.setReleaseMode(ReleaseMode.stop);

    AudioPlayer.global.setAudioContext(
      AudioContext(
        android: AudioContextAndroid(
          audioFocus: AndroidAudioFocus.none,
          usageType: AndroidUsageType.media,
        ),
        iOS: AudioContextIOS(
          category: AVAudioSessionCategory.ambient,
          options: [AVAudioSessionOptions.mixWithOthers],
        ),
      ),
    );
  }
  void setAudio(audioName) {
    _finalCountDownPlayer.setSource(AssetSource('sounds/finalcountdown_$audioName.mp3'));
    _finalCountDownPlayer.setReleaseMode(ReleaseMode.stop);
    _donePlayer.setSource(AssetSource('sounds/done_$audioName.mp3'));
    _donePlayer.setReleaseMode(ReleaseMode.stop);
  }

  void playFinalCountDown() => _finalCountDownPlayer.resume();

  void playDone() => _donePlayer.resume();

  void dispose() {
    _finalCountDownPlayer.stop();
    _donePlayer.stop();
    _finalCountDownPlayer.dispose();
    _donePlayer.dispose();
  }
}
