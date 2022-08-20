import 'package:flutter/material.dart';
import 'package:solartracker/Dashboard/Desktop/Components/solar_output_animated_icon.dart';
import 'package:solartracker/Dashboard/Desktop/Fonts/labeltext.dart';
import 'package:solartracker/Theme/customcolors.dart';

CustomColors customColors = CustomColors();

class SolarIOPanel extends StatefulWidget {
  const SolarIOPanel({Key? key}) : super(key: key);

  @override
  State<SolarIOPanel> createState() => _SolarIOPanelState();
}

class _SolarIOPanelState extends State<SolarIOPanel> {
  @override
  Widget build(BuildContext context) {
    var _height =  MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        titleText("Solar Panel Summary"),
        const SizedBox(
          height: 16,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          height: 0.4*_height,
          width: 0.4*_width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: customColors.dashboardBackground),
          child: const SolarOutputAnimatedIcon(),
        )
      ],
    );
  }

  Widget titleText(String label) {
    return Text(
      label,
      style: TextStyle(
          fontFamily: "GoogleSans",
          color: Color(0xfffafafa).withOpacity(0.8),
          fontSize: 24),
      textAlign: TextAlign.start,
    );
  }
}
