import 'package:flutter/material.dart';
import 'dart:math' as math;

// class GridButton extends StatelessWidget {
//   // Function click;
//   VoidCallback click;
//   String text;
//   Color color;
//   GridButton(this.text, this.click, this.color);

//   @override
//   Widget build(BuildContext context) {
// return ElevatedButton(
//   child: Text(
//     text,
//   ),
//   style: ButtonStyle(
//       textStyle: MaterialStateProperty.all(TextStyle(
//         fontSize: 30,
//         fontWeight: FontWeight.bold,
//       )),
//       backgroundColor: MaterialStateProperty.all(color),
//       shape: MaterialStateProperty.all(RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(100.0)))),
//   onPressed: click,
// );
//   }
// }

class GridButton extends StatelessWidget {
  const GridButton({
    Key? key,
    required this.click,
    required this.text,
    required this.color,
  }) : super(key: key);

  final VoidCallback click;
  final String text;
  final Color color;

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
