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
  List<Color> multiColors;
  List<Color> lightColors;
  List<Color> darkColors;
  List<Color> randomColors;

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
    multiColors = getMultiColors();
    lightColors = getLightColors();
    darkColors = getDarkColors();
    randomColors = getRandomColors();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          SelectableText(
            "Similar color",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          ..._getColors(),
          _multipleColors(),
          _lightColors(),
          _darkColors(),
          _randomColors()
        ],
      ),
    );
  }

  Widget _colorBuilder(String codes, List<Color> colors) {
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
      var colorCode =
          "Options options = Options(count:18, colorType:ColorType.$key);\nvar color = RandomColor(options:options);";
      List<Color> _color = colors[key];
      // print('$key => $_color');
      return _colorBuilder(
        colorCode,
        _color,
      );
    }).toList();
  }

  Widget _multipleColors() {
    var colorCode =
        "Options options = Options(count:27, colorType:[ColorType.blue, ColorType.green]);\nvar color = RandomColor(options:options);";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        SelectableText(
          "Multiple colors",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        _colorBuilder(
          colorCode,
          multiColors,
        )
      ],
    );
  }

// Light Colors
  Widget _lightColors() {
    var colorCode =
        "Options options = Options(format: Format.rgbArray, count: 27,luminosity: Luminosity.light);\nvar color = RandomColor(options:options);";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        SelectableText(
          "Light colors",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        _colorBuilder(
          colorCode,
          lightColors,
        )
      ],
    );
  }

  // Light Colors
  Widget _darkColors() {
    var colorCode =
        "Options options = Options(count: 27,luminosity: Luminosity.light);\nvar color = RandomColor(options:options);";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        SelectableText(
          "Dark colors",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        _colorBuilder(
          colorCode,
          darkColors,
        )
      ],
    );
  }

  // Random Colors
  Widget _randomColors() {
    var colorCode =
        "Options options = Options(count: 27,luminosity: Luminosity.random, colorType: ColorType.random);\nvar color = RandomColor(options:options);";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        SelectableText(
          "Truely Random colors",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        _colorBuilder(
          colorCode,
          randomColors,
        )
      ],
    );
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

  List<Color> getMultiColors() {
    var options = Options(
      format: Format.rgbArray,
      count: 27,
      colorType: [ColorType.blue, ColorType.green],
    );
    List color = RandomColor.getColor(options);
    return ColorUtils.getColorByRGBArrays(color);
  }

  // Light color
  List<Color> getLightColors() {
    var options = Options(
      format: Format.rgbArray,
      count: 27,
      luminosity: Luminosity.light,
    );
    List color = RandomColor.getColor(options);
    return ColorUtils.getColorByRGBArrays(color);
  }

  // Dark color
  List<Color> getDarkColors() {
    var options = Options(
      format: Format.rgbArray,
      count: 27,
      luminosity: Luminosity.dark,
    );
    List color = RandomColor.getColor(options);
    return ColorUtils.getColorByRGBArrays(color);
  }

  // Truely Random color
  List<Color> getRandomColors() {
    var options = Options(
      format: Format.rgbArray,
      count: 27,
      luminosity: Luminosity.random,
      colorType: ColorType.random,
    );
    List color = RandomColor.getColor(options);
    return ColorUtils.getColorByRGBArrays(color);
  }
}
