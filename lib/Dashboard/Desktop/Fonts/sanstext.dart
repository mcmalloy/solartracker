import 'package:flutter/material.dart';
import 'package:solartracker/Theme/customcolors.dart';

final CustomColors customColors = CustomColors();

class SansText extends StatelessWidget {
  final String body;
  final int fontSize;
  const SansText({Key? key, required this.body, required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 6),
      child: Text(
        body,
        style: TextStyle(
            fontFamily: "GoogleSans",
            color: customColors.dashboardText,
            fontSize: 18),
        textAlign: TextAlign.start,
      ),
    );
  }
}
