import 'package:flutter/material.dart';

class ColorUtils {
  static List<Color> getColorByRGBArrays(List colors) {
    return colors
        .map(
          (color) => Color.fromRGBO(color[0], color[1], color[2], 1.0),
        )
        .toList();
  }
}
