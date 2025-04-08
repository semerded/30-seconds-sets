import 'package:app_30_seconds_sets/enum.dart';
import 'package:app_30_seconds_sets/func/timer_handler.dart';
import 'package:flutter/material.dart';

typedef OnButtonPressed = void Function(TimerState timerState);

class TimerActions extends StatefulWidget {
  final TimerState timerState;
  final TimerHandler currentActiveTimer;
  final OnButtonPressed onButtonPressed;

  const TimerActions({super.key, required this.timerState, required this.currentActiveTimer, required this.onButtonPressed});

  @override
  State<TimerActions> createState() => _TimerActionsState();
}

class _TimerActionsState extends State<TimerActions> {
  @override
  Widget build(BuildContext context) {
    return () {
      if (widget.timerState == TimerState.running) {
        return ElevatedButton(
          onPressed: () {
            setState(() {
              widget.onButtonPressed(TimerState.paused);
              widget.currentActiveTimer.pause();
            });
          },
          child: Text("Pauzeren"),
        );
      } else if (widget.timerState == TimerState.paused) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.onButtonPressed(TimerState.running);
                  widget.currentActiveTimer.start();
                });
              },
              child: Text("Hervatten"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.onButtonPressed(TimerState.stopped);
                  widget.currentActiveTimer.stop();
                });
              },
              child: Text("Herstart set"),
            ),
          ],
        );
      } else {
        return ElevatedButton(
          onPressed: () {
            setState(() {
              widget.onButtonPressed(TimerState.running);
              widget.currentActiveTimer.start();
            });
          },
          child: Text("Start"),
        );
      }
    }();
  }
}
