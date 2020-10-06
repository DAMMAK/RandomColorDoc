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
  @override
  void initState() {
    super.initState();
    var options = Options(
        format: Format.rgbArray,
        count: 36,
        colorType: ColorType.blue,
        luminosity: Luminosity.light);
    List color = RandomColor.getColor(options);
    colors = ColorUtils.getColorByRGBArrays(color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.435,
        child: SingleChildScrollView(
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
    ));
  }

  Widget _intro() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What is it ?",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 20),
        Text(
            "This is a port of the RandomColor.js script created by David Merfield"),
        SizedBox(height: 20),
        Text(
          "Random Color generates attractive colors by default. More specifically, RamdomColor produces bright colors with a reasonably high saturation. This makes random Color particularly useful for data visualizations and generative art",
        ),
      ],
    );
  }

  Widget _howToUse() {
    return Column(
      children: [
        Text(
          "How to use",
          style: TextStyle(
            fontSize: 33,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
            "RandomColor class accept a property called Options, Options is a class that contains the properties that will used to determine how your will generated."),
      ],
    );
  }

  Widget _example() {
    List<String> color36 = [
      "Options options = Options(count:36)",
      "var color = RandomColor(options:options);"
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Examples",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
        CodeBuilder(codes: color36)
      ],
    );
  }
}

class CodeBuilder extends StatelessWidget {
  final List<String> codes;
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: codes
            .map((e) => Text(e,
                style: TextStyle(
                  height: 1.5,
                  fontSize: 14,
                  fontFamily: GoogleFonts.sourceCodePro().fontFamily,
                )))
            .toList(),
      ),
    );
  }
}
