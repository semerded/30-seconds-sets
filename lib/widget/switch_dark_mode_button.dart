import 'package:app_30_seconds_sets/data.dart';
import 'package:flutter/material.dart';

class SwitchDarkModeButton extends StatelessWidget {
  const SwitchDarkModeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isDarkMode,
      builder: (context, isDark, _) {
        return IconButton(
          onPressed: () {
            isDarkMode.value = !isDarkMode.value;
          },
          icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
        );
      },
    );
  }
}
