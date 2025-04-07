import 'dart:async';

import 'package:app_30_seconds_sets/func/final_count_down_player.dart';

typedef OnTick = void Function(bool isDone);

class TimerHandler {
  final int time;
  Timer? _timer;
  final int timerInterval = 20;
  final int finalCountDownStartTime = 5;
  int intervalCount = 0;
  final OnTick callback;
  int? tickLimit;

  int finalCountDownCount = 0;

  final FinalCountDownPlayer finalCountDownPlayer = FinalCountDownPlayer();

  TimerHandler(this.time, this.callback) {
    assert(time > 0);
    tickLimit = ((1000 / timerInterval) * time).toInt();
  }

  void _callback(Timer timer) {
    intervalCount += 1;

    if (isFinalCountdown() && intervalCount % (1000 / timerInterval) == 0) {
      finalCountDownPlayer.playFinalCountDown();
    }

    if (tickLimit != null && intervalCount >= tickLimit!) {
      stop();
      finalCountDownPlayer.playDone();
      callback(true);
    } else {
      callback(false);
    }
  }

  int getElapsedTimeInSeconds() {
    return time - (timerInterval / 1000 * intervalCount).toInt();
  }

  double getElapsedTime() {
    return time - (timerInterval / 1000 * intervalCount);
  }

  bool isFinalCountdown() {
    return time - (time - getElapsedTimeInSeconds()) <= finalCountDownStartTime;
  }

  void start() {
    _timer = Timer.periodic(Duration(milliseconds: timerInterval), _callback);
  }

  void pause() {
    _timer!.cancel();
  }

  void stop() {
    intervalCount = 0;
    _timer!.cancel();
  }

  void dispose() {
    _timer!.cancel();
    finalCountDownPlayer.dispose();
  }
}
