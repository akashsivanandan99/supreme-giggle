import 'package:flutter/material.dart';
import 'dart:math' as math;


class GridButton extends StatelessWidget {
  Function click;
  String text;
  Color color;
  ButtonStyle style;
  GridButton(this.text, this.click, this.color);




  @override
  Widget build(BuildContext context) {
    style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),primary: color, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)));

    return ElevatedButton(
      child: Text(
        text,
      ),
      style: style,
      onPressed: click,
    );
  }
}
