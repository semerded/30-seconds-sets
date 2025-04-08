import 'package:flutter/material.dart';

Future<List<int>> changeTimePopup(BuildContext context, int setTime, int restTime, int setLimit) async {
  await showModalBottomSheet(
    isDismissible: true,
    context: context,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Set tijd", style: TextStyle(fontSize: 20)),
                  Row(
                    children: [
                      Spacer(flex: 5),
                      IconButton(
                        onPressed: () {
                          setState(() => setTime -= 1);
                        },
                        icon: Icon(Icons.remove, size: 48),
                      ),
                      Spacer(flex: 1),
                      SizedBox(width: 48, child: Text(setTime.toString(), style: TextStyle(fontSize: 32), textAlign: TextAlign.center)),

                      Spacer(flex: 1),
                      IconButton(
                        onPressed: () {
                          setState(() => setTime += 1);
                        },
                        icon: Icon(Icons.add, size: 48),
                      ),
                      Spacer(flex: 5),
                    ],
                  ),
                  Divider(height: 48, endIndent: 48, indent: 48),
                  Text("Rust tijd", style: TextStyle(fontSize: 20)),
                  Row(
                    children: [
                      Spacer(flex: 5),
                      IconButton(
                        onPressed: () {
                          setState(() => restTime -= 1);
                        },
                        icon: Icon(Icons.remove, size: 48),
                      ),
                      Spacer(flex: 1),
                      SizedBox(width: 48, child: Text(restTime.toString(), style: TextStyle(fontSize: 32), textAlign: TextAlign.center)),
                      Spacer(flex: 1),
                      IconButton(
                        onPressed: () {
                          setState(() => restTime += 1);
                        },
                        icon: Icon(Icons.add, size: 48),
                      ),
                      Spacer(flex: 5),
                    ],
                  ),
                  Divider(height: 48, endIndent: 48, indent: 48),
                  Text("Aantal sets (limit)", style: TextStyle(fontSize: 20)),
                  Row(
                    children: [
                      Spacer(flex: 5),
                      SizedBox(width: 64),
                      IconButton(
                        onPressed: () {
                          setState(() => setLimit -= 1);
                        },
                        icon: Icon(Icons.remove, size: 48),
                      ),
                      Spacer(flex: 1),
                      SizedBox(width: 48, child: Text(setLimit.toString(), style: TextStyle(fontSize: 32), textAlign: TextAlign.center)),
                      Spacer(flex: 1),
                      IconButton(
                        onPressed: () {
                          setState(() => setLimit += 1);
                        },
                        icon: Icon(Icons.add, size: 48),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() => setLimit = 0);
                        },
                        icon: Icon(Icons.not_interested_sharp, size: 48),
                      ),
                      Spacer(flex: 5),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
  return [setTime, restTime, setLimit];
}
