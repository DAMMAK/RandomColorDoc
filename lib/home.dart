import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:randcomcolor_doc/color.dart';
import 'package:randcomcolor_doc/header.dart';
import 'package:randcomcolor_doc/similar_color.dart';
import 'package:randcomcolor_doc/utils/color.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Color> colors;
  var bgColor;
  @override
  void initState() {
    super.initState();
    var options = Options(
        format: Format.rgbArray,
        count: 36,
        colorType: ColorType.random,
        luminosity: Luminosity.light);
    List color = RandomColor.getColor(options);

    colors = ColorUtils.getColorByRGBArrays(color);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              // color: Colors.green,
              padding: EdgeInsets.symmetric(horizontal: width * 0.29),
              // width: MediaQuery.of(context).size.width * 0.435,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(),
                  ColorList(colors: colors),
                  _intro(),
                  _howToUse(),
                  _example(),
                  SimilarColor()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _intro() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        SelectableText(
          "What is it ?",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 20),
        SelectableText(
          "This is a port of the RandomColor.js script created by David Merfield",
          style: TextStyle(fontSize: 14, height: 1.5),
        ),
        SizedBox(height: 20),
        SelectableText(
          "Random Color generates attractive colors by default. More specifically, RamdomColor produces bright colors with a reasonably high saturation. This makes random Color particularly useful for data visualizations and generative art. it can be used for your mobile(ioS/Android), web, desktop",
          style: TextStyle(fontSize: 14, height: 1.5),
        ),
      ],
    );
  }

  Widget _howToUse() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        SelectableText(
          "How to use",
          style: TextStyle(
            fontSize: 33,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SelectableText(
          "RandomColor class accept a property called Options, Options is a class that contains the properties that will used to determine how your will generated.",
          style: TextStyle(fontSize: 14, height: 1.5),
        ),
      ],
    );
  }

  Widget _example() {
    String color36 =
        "Options options = Options(count:36);\nvar color = RandomColor(options:options);";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        SelectableText("Examples",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
        SizedBox(
          height: 20,
        ),
        CodeBuilder(codes: color36)
      ],
    );
  }
}

class CodeBuilder extends StatelessWidget {
  final String codes;
  CodeBuilder({this.codes});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey.withOpacity(0.7))),
      child: SelectableText(codes,
          style: TextStyle(
            height: 1.5,
            fontSize: 14,
            fontFamily: GoogleFonts.sourceCodePro().fontFamily,
          )),
    );
  }
}
