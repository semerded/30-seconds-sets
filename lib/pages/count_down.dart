import 'package:app_30_seconds_sets/enum.dart';
import 'package:app_30_seconds_sets/func/timer_handler.dart';
import 'package:app_30_seconds_sets/func/variable_sizing.dart';
import 'package:app_30_seconds_sets/pages/sets_completed.dart';
import 'package:app_30_seconds_sets/widget/change_time_popup.dart';
import 'package:app_30_seconds_sets/widget/dialog/stop_set_dialog.dart';
import 'package:app_30_seconds_sets/widget/motivational_text.dart';
import 'package:app_30_seconds_sets/widget/set_text.dart';
import 'package:app_30_seconds_sets/widget/switch_dark_mode_button.dart';
import 'package:app_30_seconds_sets/widget/timer_actions.dart';
import 'package:app_30_seconds_sets/widget/visual_timer.dart';
import 'package:flutter/material.dart';

class CountDown extends StatefulWidget {
  const CountDown({super.key});

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  bool setActive = false;
  TimerState timerState = TimerState.stopped;
  int setTime = 10;
  int restTime = 7;
  late int currentActiveTime;
  late TimerHandler setTimer;
  late TimerHandler restTimer;
  late TimerHandler currentActiveTimer;
  bool isRestPause = false;
  int setCount = 1;
  int setLimit = 5;

  void _setTimers() {
    setTimer = TimerHandler(setTime, (isDone) {
      setState(() {
        if (isDone) {
          isRestPause = true;
          restTimer.start();
          currentActiveTimer = restTimer;
          currentActiveTime = restTime;
        }
      });
    });

    restTimer = TimerHandler(restTime, (isDone) {
      setState(() {
        if (isDone) {
          setCount++;

          if (setCount > setLimit && setLimit != 0) {
            Navigator.push(context, MaterialPageRoute<bool>(builder: (context) => const SetsCompleted())).then((callback) {
              setState(() {
                setActive = false;
                timerState = TimerState.stopped;
                currentActiveTimer.stop();
                currentActiveTimer = setTimer;
                setCount = 1;
                currentActiveTime = setTime;
                isRestPause = false;
              });
            });
          } else {
            isRestPause = false;
            setTimer.start();
            currentActiveTimer = setTimer;
            currentActiveTime = setTime;
          }
        }
      });
    });

    currentActiveTimer = setTimer;
    currentActiveTime = setTime;
  }

  @override
  void initState() {
    super.initState();
    _setTimers();
  }

  @override
  void dispose() {
    setTimer.dispose();
    restTimer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    VariableSizing varSize = VariableSizing(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(right: 16, top: 32, child: SwitchDarkModeButton()),
          Center(
            child:
                MediaQuery.of(context).orientation == Orientation.portrait
                    /////////////////////////
                    // portrait (vertical) //
                    /////////////////////////
                    ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(flex: 4),
                        SetText(setCount: setCount, setLimit: setLimit, isRestPause: isRestPause),
                        Spacer(flex: 1),
                        MotivationalText(isRestPause: isRestPause, timerState: timerState, setCount: setCount, setActive: setActive),
                        Spacer(flex: 1),
                        VisualTimer(currentActiveTime: currentActiveTime, currentActiveTimer: currentActiveTimer, timerState: timerState, isFinalCountdown: currentActiveTimer.isFinalCountdown()),
                        Spacer(flex: 1),
                        TimerActions(
                          timerState: timerState,
                          currentActiveTimer: currentActiveTimer,
                          onButtonPressed:
                              (timerState) => setState(() {
                                if (timerState == TimerState.running && !setActive) {
                                  setActive = true;
                                }
                                this.timerState = timerState;
                              }),
                        ),
                        Spacer(flex: 4),
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
                          child: Center(child: VisualTimer(currentActiveTimer: currentActiveTimer, currentActiveTime: currentActiveTime, timerState: timerState, isFinalCountdown: currentActiveTimer.isFinalCountdown())),
                        ),
                        SizedBox(
                          width: varSize.screenWidth / 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SetText(setCount: setCount, setLimit: setLimit, isRestPause: isRestPause),
                              MotivationalText(isRestPause: isRestPause, timerState: timerState, setCount: setCount, setActive: setActive),
                              TimerActions(
                                timerState: timerState,
                                currentActiveTimer: currentActiveTimer,
                                onButtonPressed:
                                    (timerState) => setState(() {
                                      if (timerState == TimerState.running && !setActive) {
                                        setActive = true;
                                      }
                                      this.timerState = timerState;
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
          ),
        ],
      ),
      floatingActionButton:
          setActive
              ? FloatingActionButton(
                onPressed:
                    () => stopSetDialog(context).then((value) {
                      if (value != null && value != StopSetDialogResult.cancel) {
                        setState(() {
                          setActive = false;
                          timerState = TimerState.stopped;
                          currentActiveTimer.stop();
                          currentActiveTimer = setTimer;
                          setCount = 1;
                          currentActiveTime = setTime;
                          isRestPause = false;
                        });
                      }
                    }),
                backgroundColor: Colors.red,
                child: Icon(Icons.stop),
              )
              : FloatingActionButton(
                onPressed: () {
                  changeTimePopup(context, setTime, restTime, setLimit).then((values) {
                    setState(() {
                      setTime = values[0];
                      restTime = values[1];
                      setLimit = values[2];
                      _setTimers();
                    });
                  });
                },
                child: Icon(Icons.more_time_sharp),
              ),
    );
  }
}
