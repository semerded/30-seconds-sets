import 'package:app_30_seconds_sets/count_down.dart';
import 'package:app_30_seconds_sets/func/variable_sizing.dart';
import 'package:flutter/material.dart';

class MotivationalText extends StatelessWidget {
  final bool isRestPause;
  final TimerState timerState;
  final int setCount;
  const MotivationalText({
    super.key,
    required this.isRestPause,
    required this.timerState,
    required this.setCount,
  });

  @override
  Widget build(BuildContext context) {
    final varSize = VariableSizing(context);
    return Text(
      () {
        if (isRestPause) {
          if (timerState == TimerState.running) {
            return "Set $setCount voltooid\nNu even rusten...";
          } else {
            return "Rustpause voor set $setCount gepauseerd \nLangere rustpause nodig?";
          }
        } else {
          if (timerState == TimerState.stopped) {
            return "Start set $setCount";
          } else if (timerState == TimerState.paused) {
            return "Set $setCount gepauseerd\nVlieg snel terug in actie!";
          } else {
            return "Bezig met set $setCount\nBlijf zo doorgaan!";
          }
        }
      }(),
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: varSize.bigText),
    );
  }
}
