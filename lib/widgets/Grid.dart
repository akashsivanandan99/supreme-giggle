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
    required this.color_palette,
    this.size,
    required this.change_colour,
  }) : super(key: key);

  var numbers = [];
  bool opacity;
  final size;
  Function clickGrid;
  List<Color> color_palette;
  bool change_colour;

  @override
  Widget build(BuildContext context) {
    var height = size.height;
    var width = size.width;
    var random = Random();
    return Container(
      height: height * 0.45,
      width: width * 0.60,
      child: Padding(
        // padding: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: numbers.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return numbers[index] != 0
                ? GridButton(
                    click: () {
                      clickGrid(index);
                    },
                    text: "${numbers[index]}",
                    color:
                        color_palette[random.nextInt(color_palette.length - 1)],
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
