import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Random Color",
          style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
        ),
        Text(
          "A color generator for dart",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 25,
          ),
        )
      ],
    );
  }
}
