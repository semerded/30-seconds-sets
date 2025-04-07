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
            scaffoldBackgroundColor: Palette.bgLight,
            textTheme: const TextTheme(bodyMedium: TextStyle(color: Palette.textDark)),
            colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Palette.primary,
              onPrimary: Palette.textLight,
              secondary: Palette.secondary, // or whatever you like
              onSecondary: Palette.textDark,
              surface: Palette.bgLight,
              onSurface: Palette.textDark,
              error: Colors.red,
              onError: Colors.white,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Palette.buttonLight),
                foregroundColor: WidgetStatePropertyAll(Palette.secondary),
              ),
            ),
          ),
          darkTheme: ThemeData(
            primaryColor: Palette.primary,
            scaffoldBackgroundColor: Palette.bgDark,
            textTheme: const TextTheme(bodyMedium: TextStyle(color: Palette.textLight)),
            colorScheme: const ColorScheme(
              brightness: Brightness.dark,
              primary: Palette.primary,
              onPrimary: Palette.textDark,
              secondary: Palette.secondary,
              onSecondary: Palette.textLight,
              surface: Palette.bgDark,
              onSurface: Palette.textLight,
              error: Colors.red,
              onError: Palette.textLight,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Palette.buttonDark),
                foregroundColor: WidgetStatePropertyAll(Palette.primary),
              ),
            ),
          ),
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
        );
      },
    );
  }
}
