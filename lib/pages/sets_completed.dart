import 'package:flutter/material.dart';

class SetsCompleted extends StatefulWidget {
  const SetsCompleted({super.key});

  @override
  State<SetsCompleted> createState() => _SetsCompletedState();
}

class _SetsCompletedState extends State<SetsCompleted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color.fromARGB(255, 45, 222, 51), body: Column(children: [Text("Sets voltooid!"), ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text("Terug"))]));
  }
}
