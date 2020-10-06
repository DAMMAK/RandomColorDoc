import 'package:flutter/material.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';
import 'package:randcomcolor_doc/color.dart';
import 'package:randcomcolor_doc/home.dart';
import 'package:randcomcolor_doc/utils/color.dart';

class SimilarColor extends StatefulWidget {
  @override
  _SimilarColorState createState() => _SimilarColorState();
}

class _SimilarColorState extends State<SimilarColor> {
  Map<String, List<Color>> colors;
  List<Color> testColors;

  @override
  void initState() {
    super.initState();
    colors = {
      "green": getGreenColors(),
      "red": getRedColors(),
      "yellow": getYellowColors(),
      "purple": getPurpleColors(),
      "pink": getPinkColors(),
      "orange": getOrangeColors(),
      "blue": getBlueColors(),
      "monochrome": getMonochromeColors(),
    };
    testColors = getGreenColors();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Similar color",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          ..._getColors(),
        ],
      ),
    );
  }

  Widget _colorBuilder(List<String> codes, List<Color> colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        CodeBuilder(codes: codes),
        SizedBox(height: 10),
        ColorList(colors: colors),
      ],
    );
  }

  List<Widget> _getColors() {
    return colors.keys.map((key) {
      List<String> colorCode = [
        "Options options = Options(count:18, colorType:ColorType.$key);",
        "var color = RandomColor(options:options);"
      ];
      List<Color> _color = colors[key];
      // print('$key => $_color');
      return _colorBuilder(
        colorCode,
        _color,
      );
    }).toList();
  }

  List<Color> getGreenColors() {
    var options = Options(
      format: Format.rgbArray,
      count: 18,
      colorType: ColorType.green,
    );
    List color = RandomColor.getColor(options);
    return ColorUtils.getColorByRGBArrays(color);
  }

  List<Color> getRedColors() {
    var options = Options(
      format: Format.rgbArray,
      count: 18,
      colorType: ColorType.red,
    );
    List color = RandomColor.getColor(options);
    return ColorUtils.getColorByRGBArrays(color);
  }

  List<Color> getYellowColors() {
    var options = Options(
      format: Format.rgbArray,
      count: 18,
      colorType: ColorType.yellow,
    );
    List color = RandomColor.getColor(options);
    return ColorUtils.getColorByRGBArrays(color);
  }

  List<Color> getPurpleColors() {
    var options = Options(
      format: Format.rgbArray,
      count: 18,
      colorType: ColorType.purple,
    );
    List color = RandomColor.getColor(options);
    return ColorUtils.getColorByRGBArrays(color);
  }

  List<Color> getPinkColors() {
    var options = Options(
      format: Format.rgbArray,
      count: 18,
      colorType: ColorType.pink,
    );
    List color = RandomColor.getColor(options);
    return ColorUtils.getColorByRGBArrays(color);
  }

  List<Color> getOrangeColors() {
    var options = Options(
      format: Format.rgbArray,
      count: 18,
      colorType: ColorType.orange,
    );
    List color = RandomColor.getColor(options);
    return ColorUtils.getColorByRGBArrays(color);
  }

  List<Color> getBlueColors() {
    var options = Options(
      format: Format.rgbArray,
      count: 18,
      colorType: ColorType.blue,
    );
    List color = RandomColor.getColor(options);
    return ColorUtils.getColorByRGBArrays(color);
  }
  List<Color> getMonochromeColors() {
    var options = Options(
      format: Format.rgbArray,
      count: 18,
      colorType: ColorType.monochrome,
    );
    List color = RandomColor.getColor(options);
    return ColorUtils.getColorByRGBArrays(color);
  }
}
