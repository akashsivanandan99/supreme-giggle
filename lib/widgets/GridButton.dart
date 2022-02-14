import 'dart:math';

import 'package:flutter/material.dart';
import 'package:slidingpuzzle/themes/color_palettes.dart';

class GridButton extends StatelessWidget {
  GridButton({
    Key? key,
    required this.click,
    required this.text,
    this.color,
  }) : super(key: key);

  final VoidCallback click;
  final String text;
  Color? color; //= retro_colors[Ramdp,.nextInt(retro_colors.length)];

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
      ),
      style: ButtonStyle(
          textStyle: MaterialStateProperty.all(TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          )),
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0)))),
      onPressed: click,
    );
  }
}
