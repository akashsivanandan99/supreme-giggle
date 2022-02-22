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
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
          )),
      onPressed: next,
      child: Text(
        "Change theme",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
