import 'package:flutter/material.dart';

class Time extends StatelessWidget {
  const Time({Key? key, required this.secondsPassed}) : super(key: key);

  final int secondsPassed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Text(
        "Time: $secondsPassed",
        style: TextStyle(
          fontSize: 18,
          decoration: TextDecoration.none,
          color: Colors.black,
        ),
      ),
    );
  }
}
