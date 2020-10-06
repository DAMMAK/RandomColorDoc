import 'package:flutter/material.dart';

class ColorContainer extends StatelessWidget {
  final Color color;
  ColorContainer({this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class ColorList extends StatelessWidget {
  final List<Color> colors;
  ColorList({this.colors});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      child: Wrap(
        children: colors
            .map((Color color) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ColorContainer(
                    color: color,
                  ),
                ))
            .toList(),
      ),
    );
  }
}
