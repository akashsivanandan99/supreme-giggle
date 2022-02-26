import 'package:flutter/material.dart';

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({
    Key? key,
    required this.next,
  }) : super(key: key);

  final VoidCallback next;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: next,
      child: Text(
        "Change theme",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        softWrap: true,
        maxLines: 2,
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        primary: Colors.white,
        padding: EdgeInsets.all(15),
      ),
    );
  }
}
