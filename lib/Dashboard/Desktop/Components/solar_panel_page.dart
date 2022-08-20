import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:solartracker/Theme/customcolors.dart';

class SolarPanelArrayListPage extends StatefulWidget {
  const SolarPanelArrayListPage({Key? key}) : super(key: key);

  @override
  State<SolarPanelArrayListPage> createState() =>
      _SolarPanelArrayListPageState();
}

class _SolarPanelArrayListPageState extends State<SolarPanelArrayListPage> {
  CustomColors customColors = CustomColors();
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        titleText("Solar Array Status"),
        const SizedBox(
          height: 16,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          height: 0.4 * _height,
          width: 0.4 * _width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: customColors.dashboardBackground),
          child: solarGridView(),
        )
      ],
    );
  }

  Widget solarGridView() {
    return GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 2.0,
        children: List.generate(9, (index) {
          return solarIcon(index);
        }));
  }

  List<double> wattArray = [326, 312, 332, 298, 295, 304, 296, 301, 315];
  Widget solarIcon(int index) {
    var panelColor;
    if (wattArray[index] <= 300) {
      panelColor = customColors.highlightRed;
    } else if (wattArray[index] > 300 && wattArray[index] <= 320) {
      panelColor = customColors.pastelYellow.withOpacity(0.7);
    } else if (wattArray[index] > 320 && wattArray[index] <= 400) {
      panelColor = customColors.flatPurple;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        arrayText("400W-${index + 1}"),
        Container(
          padding: EdgeInsets.all(4.0),
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              border: Border.all(
                color: panelColor,
              )),
          child: Container(
              padding: EdgeInsets.all(2.0),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.transparent,
                  border: Border.all(
                    color: panelColor,
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.solarPanel,
                    size: 32,
                    color: panelColor,
                  ),
                  Text(
                    wattArray[index].toString() + "W",
                    style: TextStyle(
                        fontFamily: "GoogleSans",
                        color: Color(0xfffafafa).withOpacity(0.8),
                        fontSize: 16),
                    textAlign: TextAlign.start,
                  )
                ],
              )),
        ),
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

  Widget arrayText(String label) {
    return Text(
      label,
      style: TextStyle(
          fontFamily: "GoogleSans",
          color: Color(0xfffafafa).withOpacity(0.8),
          fontSize: 12),
      textAlign: TextAlign.start,
    );
  }
}
