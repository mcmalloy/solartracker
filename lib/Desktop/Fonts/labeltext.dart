import 'package:flutter/material.dart';
import 'package:solartracker/Theme/customcolors.dart';

final CustomColors customColors = CustomColors();

class LabelText extends StatelessWidget {
  final String label;
  final int fontSize;
  const LabelText({Key? key, required this.label, required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 6),
      child: Text(
        label,
        style: TextStyle(
            fontFamily: "GoogleSans",
            color: customColors.dashboardText,
            fontSize: 18),
        textAlign: TextAlign.start,
      ),
    );
  }
}