import 'package:app_30_seconds_sets/func/timer_handler.dart';
import 'package:app_30_seconds_sets/func/variable_sizing.dart';
import 'package:app_30_seconds_sets/widget/motivational_text.dart';
import 'package:app_30_seconds_sets/widget/switch_dark_mode_button.dart';
import 'package:app_30_seconds_sets/widget/timer_actions.dart';
import 'package:app_30_seconds_sets/widget/visual_timer.dart';
import 'package:flutter/material.dart';

enum TimerState { running, paused, stopped }

class CountDown extends StatefulWidget {
  const CountDown({super.key});

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  TimerState timerState = TimerState.stopped;
  int setTime = 10;
  int restTime = 7;
  late int currentActiveTime;
  late final TimerHandler setTimer;
  late final TimerHandler restTimer;
  late TimerHandler currentActiveTimer;
  bool isRestPause = false;
  int setCount = 1;

  void finalCountdown() {}

  @override
  void initState() {
    super.initState();
    setTimer = TimerHandler(setTime, (isDone) {
      setState(() {
        if (isDone) {
          isRestPause = true;
          restTimer.start();
          currentActiveTimer = restTimer;
          currentActiveTime = restTime;
          setCount++;
        }
      });
    }, () => finalCountdown);

    restTimer = TimerHandler(restTime, (isDone) {
      setState(() {
        if (isDone) {
          isRestPause = false;
          setTimer.start();
          currentActiveTimer = setTimer;
          currentActiveTime = setTime;
        }
      });
    }, () => finalCountdown);

    currentActiveTimer = setTimer;
    currentActiveTime = setTime;
  }

  @override
  Widget build(BuildContext context) {
    VariableSizing varSize = VariableSizing(context);
    return Scaffold(
      appBar:
          MediaQuery.of(context).orientation == Orientation.portrait
              ? AppBar(actions: [SwitchDarkModeButton()])
              : null,
      body: Center(
        child:
            MediaQuery.of(context).orientation == Orientation.portrait
                /////////////////////////
                // portrait (vertical) //
                /////////////////////////
                ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MotivationalText(
                      isRestPause: isRestPause,
                      timerState: timerState,
                      setCount: setCount,
                    ),
                    VisualTimer(
                      currentActiveTime: currentActiveTime,
                      currentActiveTimer: currentActiveTimer,
                      timerState: timerState,
                      isFinalCountdown: currentActiveTimer.isFinalCountdown(),
                    ),
                    TimerActions(
                      timerState: timerState,
                      currentActiveTimer: currentActiveTimer,
                      onButtonPressed:
                          (timerState) => setState(() {
                            this.timerState = timerState;
                          }),
                    ),
                  ],
                )
                ////////////////////////////
                // landscape (horizontal) //
                ////////////////////////////
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: varSize.screenWidth / 2,
                      child: Center(
                        child: VisualTimer(
                          currentActiveTimer: currentActiveTimer,
                          currentActiveTime: currentActiveTime,
                          timerState: timerState,
                          isFinalCountdown: currentActiveTimer.isFinalCountdown(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: varSize.screenWidth / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MotivationalText(
                            isRestPause: isRestPause,
                            timerState: timerState,
                            setCount: setCount,
                          ),
                          TimerActions(
                            timerState: timerState,
                            currentActiveTimer: currentActiveTimer,
                            onButtonPressed:
                                (timerState) => setState(() {
                                  this.timerState = timerState;
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
      ),
      floatingActionButton:
          MediaQuery.of(context).orientation == Orientation.landscape
              ? SwitchDarkModeButton()
              : null,
    );
  }
}
