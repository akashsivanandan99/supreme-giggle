import 'dart:math';

import 'package:flutter/material.dart';
import 'package:slidingpuzzle/themes/color_palettes.dart';

// class GridButton extends StatelessWidget {
//   GridButton({
//     Key? key,
//     required this.click,
//     required this.text,
//     this.color,
//   }) : super(key: key);

//   final VoidCallback click;
//   required var opacity;
//   final String text;
//   Color? color; //= retro_colors[Ramdp,.nextInt(retro_colors.length)];

// @override
// Widget build(BuildContext context) {
//   return AnimatedOpacity(
//       opacity: opacity,
//       duration: const Duration(milliseconds: 500),
//       child: ElevatedButton(
//         child: Text(
//           text,
//         ),
//         style: ButtonStyle(
//             textStyle: MaterialStateProperty.all(TextStyle(
//               fontSize: 30,
//               fontWeight: FontWeight.bold,
//             )),
//             backgroundColor: MaterialStateProperty.all(color),
//             shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(100.0)))),
//         onPressed: click,
//       ));
// }
// }

class GridButton extends StatelessWidget {
  GridButton({
    Key? key,
    required this.click,
    required this.opacity,
    required this.text,
    this.color,
  }) : super(key: key);

  final VoidCallback click;
  final String text;
  Color? color;
  bool opacity;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity: opacity == true ? 1.0 : 0.8,
        duration: const Duration(milliseconds: 500),
        child: ElevatedButton(
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
        ));
  }
}
