import 'package:flutter/material.dart';

class MyTitle extends StatelessWidget {
  MyTitle({
    Key? key,
    this.size,
  }) : super(key: key);

  var size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.10,
      padding: EdgeInsets.all(5.0),
      child: Text(
        "Sliding Puzzle",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size.height * 0.050,
            color: Colors.black,
            decoration: TextDecoration.none),
      ),
    );
  }
}
