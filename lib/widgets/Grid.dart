import 'package:flutter/material.dart';
import 'GridButton.dart';
import 'dart:math' as math;

class Grid extends StatelessWidget {
  var numbers = [];
  final size;
  Function clickGrid;
  Color color;
  Grid(this.numbers, this.size, this.clickGrid, this.color);

  @override
  Widget build(BuildContext context) {
    var height = size.height;
    var width = size.width;
    return Container(
      height: height * 0.60,
      width: width * 0.60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: numbers.length,
          itemBuilder: (context, index) {
            return numbers[index] != 0
                ? GridButton("${numbers[index]}", () {
                    clickGrid(index);
                  },Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.7))
                : SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
