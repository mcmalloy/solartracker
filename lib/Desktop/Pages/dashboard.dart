import 'package:flutter/material.dart';
import 'package:solartracker/Desktop/Components/logs_button.dart';
import 'package:solartracker/Desktop/Components/navrail_separator.dart';
import 'package:solartracker/Desktop/Modules/solar_array_module.dart';
import 'package:solartracker/Desktop/Modules/solar_io_module.dart';
import 'package:solartracker/Theme/customcolors.dart';
import '../Components/logout_button.dart';
import '../Fonts/sanstext.dart';

class RailDashboardPage extends StatefulWidget {
  const RailDashboardPage({Key? key}) : super(key: key);

  @override
  State<RailDashboardPage> createState() => _RailDashboardPageState();
}

class _RailDashboardPageState extends State<RailDashboardPage> {
  CustomColors customColors = CustomColors();

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customColors.darkBackground,
      body: Row(
        children: [
          SizedBox(width: 200, child: navRail()),
          const NavRailSeparator(),
          const SizedBox(width: 40),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [SolarIOPanel(), SolarArrayModule()],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [],
            ),
          ),
        ],
      ),
    );
  }

  Widget navRail() {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  customColors.dashboardGradient1,
                  customColors.dashboardGradient2
                ])),
            child: NavigationRail(
              backgroundColor:
                  Colors.transparent,
              selectedIndex: selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.selected,
              destinations: <NavigationRailDestination>[
                navDestinationWidget(
                    Icons.dashboard_rounded, "Solar Dashboard"),
                navDestinationWidget(Icons.sensors, "Sensor Data"),
                navDestinationWidget(
                    Icons.admin_panel_settings, "Administration"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  NavigationRailDestination navDestinationWidget(IconData icon, String label) {
    return NavigationRailDestination(
        icon: Container(
          decoration: BoxDecoration(
            color: customColors.backgroundWhite
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: customColors.dashboardText,
              ),
              labelText(label)
            ],
          ),
        ),
        selectedIcon: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: customColors.flatPurple.withOpacity(0.5),
            ),
            labelText(label)
          ],
        ),
        label: Container());
  }

  Widget labelText(String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Text(
        label,
        style: TextStyle(
            fontFamily: "GoogleSans",
            fontWeight: FontWeight.bold,
            color: customColors.dashboardItemText,
            fontSize: 20),
        textAlign: TextAlign.start,
      ),
    );
  }
}
