import 'package:app_30_seconds_sets/count_down.dart';
import 'package:app_30_seconds_sets/data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isDarkMode,
      builder: (context, isDark, _) {
        return MaterialApp(
          home: const CountDown(),
          theme: ThemeData(
            primaryColor: Palette.primary,
            scaffoldBackgroundColor: Colors.white,
            textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
            colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Palette.primary,
              onPrimary: Colors.white,
              secondary: Palette.secondary, // or whatever you like
              onSecondary: Colors.white,
              background: Colors.white,
              onBackground: Colors.black,
              surface: Colors.white,
              onSurface: Colors.black,
              error: Colors.red,
              onError: Colors.white,
            ),
          ),
          darkTheme: ThemeData(
            primaryColor: Palette.primary,
            scaffoldBackgroundColor: Colors.black,
            textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
            colorScheme: const ColorScheme(
              brightness: Brightness.dark,
              primary: Palette.primary,
              onPrimary: Colors.black,
              secondary: Palette.secondary,
              onSecondary: Colors.black,
              background: Colors.black,
              onBackground: Colors.white,
              surface: Colors.black,
              onSurface: Colors.white,
              error: Colors.red,
              onError: Colors.black,
            ),
          ),
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
        );
      },
    );
  }
}
