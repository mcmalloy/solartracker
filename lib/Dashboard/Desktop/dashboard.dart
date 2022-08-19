import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solartracker/Dashboard/Desktop/Components/logout_button.dart';
import 'package:solartracker/Dashboard/Desktop/Components/logs_button.dart';
import 'package:solartracker/Dashboard/Desktop/Components/navrail_separator.dart';
import 'package:solartracker/Dashboard/Desktop/Components/solar_IO.dart';
import 'package:solartracker/Theme/customcolors.dart';

import 'Fonts/sanstext.dart';

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
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SolarIOPanel()
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [],
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
          child: NavigationRail(
            backgroundColor: customColors.dashboardBackground.withOpacity(0.8),
            selectedIndex: selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: <NavigationRailDestination>[
              navDestinationWidget(Icons.dashboard_rounded, "Solar Dashboard"),
              navDestinationWidget(Icons.sensors, "Sensor Data"),
              navDestinationWidget(
                  Icons.admin_panel_settings, "Administration"),
            ],
          ),
        ),
        Column(
          children: const [
            SansText(
              body: "Information",
              fontSize: 20,
            ),
            LogsButton(),
            LogoutButton()
          ],
        )
      ],
    );
  }

  NavigationRailDestination navDestinationWidget(IconData icon, String label) {
    return NavigationRailDestination(
        icon: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: customColors.dashboardText,
            ),
            labelText(label)
          ],
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
            color: customColors.dashboardText,
            fontSize: 18),
        textAlign: TextAlign.start,
      ),
    );
  }
}
