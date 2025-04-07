import 'package:app_30_seconds_sets/count_down.dart';
import 'package:app_30_seconds_sets/func/timer_handler.dart';
import 'package:app_30_seconds_sets/func/variable_sizing.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class VisualTimer extends StatefulWidget {
  final TimerHandler currentActiveTimer;
  final int currentActiveTime;
  final TimerState timerState;
  final bool isFinalCountdown;

  const VisualTimer({
    super.key,
    required this.currentActiveTimer,
    required this.currentActiveTime,
    required this.timerState,
    required this.isFinalCountdown,
  });

  @override
  State<VisualTimer> createState() => _VisualTimerState();
}

class _VisualTimerState extends State<VisualTimer> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.value = 0.0;
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final varSize = VariableSizing(context);
    final theme = Theme.of(context);

    _animation = Tween<double>(
      begin: varSize.timerRadius,
      end: varSize.timerRadius + 8,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInQuad));

    if (!widget.isFinalCountdown) {
      _controller.reverse(from: _controller.value);
      _controller.stop();
    } else if (!_controller.isAnimating) {
      _controller.repeat(reverse: true);
    }

    return AnimatedBuilder(
      animation: _animation,
      builder:
          (context, child) => CircularPercentIndicator(
            radius: _animation.value,
            lineWidth: 12,
            percent: widget.currentActiveTimer.getElapsedTime() / widget.currentActiveTime,
            progressColor:
                widget.currentActiveTimer.isFinalCountdown()
                    ? Colors.red
                    : theme.colorScheme.primary,
            animation: true,
            animateFromLastPercent: true,
            animationDuration:
                widget.timerState == TimerState.stopped
                    ? 400
                    : widget.currentActiveTimer.timerInterval,
            center: Text(
              widget.currentActiveTimer.getElapsedTimeInSeconds().toString(),
              style: TextStyle(fontSize: varSize.timerText),
            ),
          ),
    );
  }
}
