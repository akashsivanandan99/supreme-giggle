import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'widgets/Menu.dart';
import 'widgets/MyTitle.dart';
import 'widgets/Grid.dart';

class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  int move = 0;
  Color color = Colors.deepPurple;
  int secondsPassed = 0;
  bool isActive = false;
  Timer timer = Timer(Duration(seconds: 1), () {});

  Color _color = Colors.white;

  @override
  void initState() {
    super.initState();
    numbers.shuffle();
    Timer.periodic(Duration(seconds: 1), (Timer t) => startTime());
  }

  @override
  Widget build(BuildContext context) {
    Size size = const Size(800.0, 800.0);
    //final size = MediaQuery.of(context).size;

    return SafeArea(
      child: AnimatedContainer(
        height: size.height,
        decoration: BoxDecoration(
          color: _color,
        ),
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        child: Column(
          children: <Widget>[
            MyTitle(size),
            Grid(numbers, size, clickGrid, color),
            Menu(
              reset: reset,
              move: move,
              secondsPassed: secondsPassed,
              size: size,
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
        final random = Random();

        // Generate a random width and height.

        // Generate a random color.
        // _color = Color.fromRGBO(
        //   random.nextInt(256),
        //   random.nextInt(256),
        //   random.nextInt(256),
        //   1,
        // );

        // color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        //     .withOpacity(0.7);
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
        secondsPassed = secondsPassed + 1;
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
