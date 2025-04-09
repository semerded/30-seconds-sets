import 'package:app_30_seconds_sets/enum.dart';
import 'package:app_30_seconds_sets/func/variable_sizing.dart';
import 'package:flutter/material.dart';

class MotivationalText extends StatelessWidget {
  final bool isRestPause;
  final TimerState timerState;
  final int setCount;
  final bool setActive;
  const MotivationalText({super.key, required this.isRestPause, required this.timerState, required this.setCount, required this.setActive});

  @override
  Widget build(BuildContext context) {
    final varSize = VariableSizing(context);
    return Text(
      () {
        if (isRestPause) {
          if (timerState == TimerState.running) {
            return "Set voltooid, even rusten...";
          } else {
            return "Rustpause gepauseerd";
          }
        } else {
          if (timerState == TimerState.stopped) {
            if (setActive) {
              return "Start met je set";
            }
            return "Start je training";
          } else if (timerState == TimerState.paused) {
            return "Gepauseerd, Vlieg snel terug in actie!";
          } else {
            return "Blijf zo doorgaan!";
          }
        }
      }(),
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: varSize.bigText),
    );
  }
}
