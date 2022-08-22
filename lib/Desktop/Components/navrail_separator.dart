import 'package:flutter/material.dart';
import 'package:solartracker/Theme/customcolors.dart';
CustomColors customColors = CustomColors();
class NavRailSeparator extends StatelessWidget {
  const NavRailSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      color: customColors.flatPurple.withOpacity(0.1),
    );
  }
}
