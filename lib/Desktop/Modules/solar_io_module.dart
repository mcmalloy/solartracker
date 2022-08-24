import 'package:flutter/material.dart';
import 'package:solartracker/Desktop/Modules/Components/solar_production_animated_circle.dart';
import 'package:solartracker/Desktop/Modules/circular_animation_module.dart';
import 'package:solartracker/Theme/customcolors.dart';

import 'Components/module_title_text.dart';

CustomColors customColors = CustomColors();

class SolarIOPanel extends StatefulWidget {
  const SolarIOPanel({Key? key}) : super(key: key);

  @override
  State<SolarIOPanel> createState() => _SolarIOPanelState();
}

class _SolarIOPanelState extends State<SolarIOPanel> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// Establish connection to Solar Array
    /// Feed solar data to SolarProductionCircle()
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const ModuleTitleText(text: "Solar Panel Summary"),
        Container(
          height: 0.26 * _height,
          width: 0.25 * _width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xffF8F8FC)),
          child: CircularAnimationModule(
            radius: 96,
            animateToPercentage: 46,
            centerText: "kW",
            centerTextValue: 2.2,
            showPercentText: true,
            strokeColor: Colors.blue,
          ),
        )
      ],
    );
  }
}
