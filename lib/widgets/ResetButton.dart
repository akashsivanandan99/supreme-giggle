import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({
    Key? key,
    // required this.text,
    required this.reset,
  }) : super(key: key);

  // final String text;
  final VoidCallback reset;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: reset,
      // style: ButtonStyle(
      //     backgroundColor: MaterialStateProperty.all(Colors.white),
      //     shape: MaterialStateProperty.all(
      //       RoundedRectangleBorder(
      //           borderRadius: new BorderRadius.circular(30.0)),
      //     )),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        primary: Colors.white,
        padding: EdgeInsets.all(10),
      ),
      // child: Text(
      //   "Reset",
      //   style: TextStyle(
      //     color: Colors.black,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),

      child: Icon(
        Icons.replay,
        color: Colors.black,
        size: 30,
      ),
    );
  }
}
