import 'package:flutter/material.dart';

class Move extends StatelessWidget {
  const Move({Key? key, required this.move}) : super(key: key);

  final int move;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Text(
        "Move: ${move}",
        style: TextStyle(
            color: Colors.black, decoration: TextDecoration.none, fontSize: 18),
      ),
    );
  }
}
