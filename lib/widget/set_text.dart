import 'package:flutter/material.dart';

class SetText extends StatelessWidget {
  final int setCount;
  final int setLimit;
  final bool isRestPause;
  const SetText({super.key, required this.setCount, required this.setLimit, required this.isRestPause});

  @override
  Widget build(BuildContext context) {
    return Text("${isRestPause ? "Rust" : "Set"} $setCount${setLimit == 0 ? "" : " / $setLimit"}", style: const TextStyle(fontSize: 48));
  }
}
