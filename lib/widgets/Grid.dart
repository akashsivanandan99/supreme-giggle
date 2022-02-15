import 'dart:math';

import 'package:flutter/material.dart';
import 'GridButton.dart';
import 'package:slidingpuzzle/themes/color_palettes.dart';

class Grid extends StatelessWidget {
  Grid({
    Key? key,
    required this.opacity,
    required this.numbers,
    required this.clickGrid,
    required this.color,
    this.size,
    required this.change_colour,
  }) : super(key: key);

  var numbers = [];
  bool opacity;
  final size;
  Function clickGrid;
  Color color;
  bool change_colour;

  @override
  Widget build(BuildContext context) {
    var height = size.height;
    var width = size.width;
    var random = Random();
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
                ? GridButton(
                    click: () {
                      clickGrid(index);
                    },
                    text: "${numbers[index]}",
                    // color: retro_colors[random.nextInt(retro_colors.length)]
                    // color: change_colour == true
                    //     ? retro_colors[random.nextInt(retro_colors.length)]
                    //     : color,
                    change_color: change_colour,
                    opacity: opacity,
                  )
                : SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
