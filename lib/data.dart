import 'package:flutter/material.dart';

final ValueNotifier<bool> isDarkMode = ValueNotifier(false);

class Palette {
  static const Color primary = Colors.orange;
  static const Color secondary = Colors.deepOrange;
  static const Color bgLight = Colors.white;
  static const Color bgDark = Colors.black;
  static const Color buttonLight = Color.fromARGB(255, 222, 222, 222);
  static const Color buttonDark = Color.fromARGB(255, 72, 72, 72);
  static const Color textLight = Colors.white;
  static const Color textDark = Colors.black;
}
