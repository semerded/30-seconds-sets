import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CountDown extends StatefulWidget {
  const CountDown({super.key});

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularPercentIndicator(radius: 80, percent: 1, center: Text("30")),
            ElevatedButton(onPressed: () {}, child: Text("Start")),
          ],
        ),
      ),
    );
  }
}
