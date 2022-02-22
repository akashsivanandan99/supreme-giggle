import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'widgets/Menu.dart';
import 'widgets/MyTitle.dart';
import 'widgets/Grid.dart';
import 'themes/color_palettes.dart' as color_palettes;
import 'package:rive/rive.dart';

class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  int move = 0;
  Color color = Colors.blue;
  double secondsPassed = 0;
  bool isActive = false;
  Timer timer = Timer(Duration(milliseconds: 500), () {});
  bool opacity = true;
  bool change_colour = false;
  int count = 0;
  List<Color> _color = color_palettes.palettes[0];
  int color_pos = 0;

  @override
  void initState() {
    super.initState();
    numbers.shuffle();
    Timer.periodic(Duration(milliseconds: 800), (Timer t) => startTime());
  }

  @override
  Widget build(BuildContext context) {
    Size size = const Size(800.0, 800.0);
    //final size = MediaQuery.of(context).size;

    return SafeArea(
      child: AnimatedContainer(
        height: size.height,
        decoration: BoxDecoration(
          // color: _color,
          color: _color[_color.length - 1],
        ),
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        child: Column(
          children: <Widget>[
            MyTitle(
              size: size,
            ),
            Grid(
                numbers: numbers,
                size: size,
                clickGrid: clickGrid,
                color_palette: _color,
                change_colour: change_colour,
                opacity: opacity),
            Menu(
              reset: reset,
              move: move,
              secondsPassed: secondsPassed,
              size: size,
              next: next_theme,
              // next: next_theme,
            )
          ],
        ),
      ),
    );
  }

  void clickGrid(index) {
    if (secondsPassed == 0) {
      isActive = true;
    }
    if (index - 1 >= 0 && numbers[index - 1] == 0 && index % 4 != 0 ||
        index + 1 < 16 && numbers[index + 1] == 0 && (index + 1) % 4 != 0 ||
        (index - 4 >= 0 && numbers[index - 4] == 0) ||
        (index + 4 < 16 && numbers[index + 4] == 0)) {
      setState(() {
        move++;
        numbers[numbers.indexOf(0)] = numbers[index];
        numbers[index] = 0;
      });
    }
    checkWin();
  }

  void startTime() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed + 0.5;
        if (secondsPassed == secondsPassed.round()) {
          // color = retro_colors[Random().nextInt(retro_colors.length)];
          if (change_colour == false)
            change_colour = true;
          else if (change_colour == true) change_colour = false;
        }

        if (opacity == true) {
          opacity = false;
        } else if (opacity == false) {
          opacity = true;
        }
        count = 0;
      });
    }
  }

  void reset() {
    setState(() {
      numbers.shuffle();
      move = 0;
      secondsPassed = 0;
      isActive = false;
    });
  }

  void next_theme() {
    if (color_pos < color_palettes.palettes.length) {
      color_pos++;
      _color = color_palettes.palettes[color_pos];
    } else
      color_pos = 0;
    _color = color_palettes.palettes[color_pos];
  }

  bool isSorted(List list) {
    int prev = list.first;
    for (var i = 1; i < list.length - 1; i++) {
      int next = list[i];
      if (prev > next) return false;
      prev = next;
    }
    return true;
  }

  void checkWin() {
    if (isSorted(numbers)) {
      isActive = false;
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //this right here
              child: Container(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "You Win!!",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 220.0,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Close",
                              style: TextStyle(color: Colors.white),
                            ),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.blue)),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    }
  }
}
