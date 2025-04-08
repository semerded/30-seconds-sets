import 'package:app_30_seconds_sets/enum.dart';
import 'package:flutter/material.dart';

Future<StopSetDialogResult?> stopSetDialog(BuildContext context) {
  return showDialog<StopSetDialogResult?>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Set stoppen en opslaan?"),
        actions: [
          TextButton(
            child: const Text("Opslaan"),
            onPressed: () {
              Navigator.pop(context, StopSetDialogResult.save);
            },
          ),
          TextButton(
            child: const Text("Verwijderen"),
            onPressed: () {
              Navigator.pop(context, StopSetDialogResult.delete);
            },
          ),
          TextButton(
            child: const Text("Annuleren"),
            onPressed: () {
              Navigator.pop(context, StopSetDialogResult.cancel);
            },
          ),
        ],
      );
    },
  );
}
