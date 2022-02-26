import 'package:flutter/material.dart';
import 'ChangeThemeButton.dart';
import 'Time.dart';
import 'ResetButton.dart';
import 'Move.dart';

class Menu extends StatelessWidget {
  Menu(
      {Key? key,
      required this.reset,
      required this.move,
      required this.secondsPassed,
      required this.next,
      this.size})
      : super(key: key);

  final int move;
  final double secondsPassed;
  var size;
  final VoidCallback reset;
  final VoidCallback next;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: [
              Row(
                children: [
                  Move(move: move),
                  SizedBox(width: 20),
                  Time(secondsPassed: secondsPassed.round()),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  ResetButton(reset: reset),
                  SizedBox(width: 5),
                  ChangeThemeButton(next: next),
                ],
              ),
              // Text("Reset"),
            ],
          ),
        ],
      ),
    );
  }
}
