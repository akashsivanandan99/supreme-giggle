import 'package:flutter/material.dart';
import 'Time.dart';
import 'ResetButton.dart';
import 'Move.dart';

class Menu extends StatelessWidget {
  Menu(
      {Key? key,
      required this.reset,
      required this.move,
      required this.secondsPassed,
      this.size})
      : super(key: key);

  final int move;
  final int secondsPassed;
  var size;
  final VoidCallback reset;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ResetButton(
            reset: reset,
            text: 'Reset',
          ),
          Move(move: move),
          Time(secondsPassed),
        ],
      ),
    );
  }
}
