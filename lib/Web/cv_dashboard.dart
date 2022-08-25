import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solartracker/Desktop/Modules/circular_animation_module.dart';
import 'package:solartracker/Desktop/Pages/login_page.dart';
import 'package:solartracker/Theme/customcolors.dart';
import 'package:solartracker/Web/Components/dashboard_progress_container.dart';
import 'package:solartracker/Web/Components/gradient_icon.dart';
import 'package:solartracker/Web/Rendering/dashboardPaint.dart';

import 'Components/navigation_rail_icon.dart';

class CVDashBoard extends StatefulWidget {
  const CVDashBoard({Key? key}) : super(key: key);

  @override
  State<CVDashBoard> createState() => _CVDashBoardState();
}

class _CVDashBoardState extends State<CVDashBoard> {
  Color backgroundColor = Color(0xffFFFFFF);
  Color topGradientNavRail = Color(0xff8C4AF2);
  Color bottomGradientNavRail = Color(0xff625AF8);
  Color unselectedItemColor = Color(0xffD8CBFC);
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          background(),
          cvNavRail(),
        ],
      ),
    );
  }

  Widget background() {
    return Container(
      width: MediaQuery.of(context).size.width / 8,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(32), bottomRight: Radius.circular(32)),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                topGradientNavRail,
                topGradientNavRail,
                topGradientNavRail,
                topGradientNavRail,
                topGradientNavRail,
                topGradientNavRail
              ])),
    );
  }

  Widget cvNavRail() {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 7.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32),
                  bottomRight: Radius.circular(32))),
          child: Column(
            children: [
              Text(
                "SaaS",
                style: GoogleFonts.roboto(
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                  color: backgroundColor,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.80,
                child: NavigationRail(
                  backgroundColor: Colors.transparent,
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (int index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  labelType: NavigationRailLabelType.selected,
                  destinations: <NavigationRailDestination>[
                    navDestinationWidget(
                        Icons.dashboard_rounded, "Dashboard", 0),
                    navDestinationWidget(Icons.bar_chart, "Revenue", 1),
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [topDashboard()],
          ),
        )
      ],
    );
  }

  Widget topDashboard() {
    return Padding(
      padding: EdgeInsets.only(top: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.only(left: 32),
            height: 550,
            width: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 1, //spread radius
                  blurRadius: 5, // blur radius
                  offset: Offset(0, -1), // changes position of shadow
                  //first paramerter of offset is left-right
                  //second parameter is top to down
                ),
                //you can set more BoxShadow() here
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          "Manage Your Project in One Touch",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.roboto(
                              fontSize: 36, color: Colors.black87),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        child: Text(
                          "Survived not only five centuries, but also the leap into electronic typeetting.",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.roboto(
                              fontSize: 18, color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 12),
                        child: Container(
                          height: 60,
                          width: 180,
                          decoration: BoxDecoration(
                              color: customColors.dashboardGradient2,
                              borderRadius: BorderRadius.circular(12)),
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "TRY FOR FREE",
                                style: GoogleFonts.roboto(
                                    fontSize: 16, color: Colors.white),
                              )),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DashboardProgressContainer(
                progressText: "Total Clients",
                percent: 50.0,
                value: 50,
                strokeColor: Colors.purple,
              ),
              SizedBox(
                height: 32,
              ),
              DashboardProgressContainer(
                progressText: "Total Revenue",
                percent: 72.3,
                value: 72.3,
                strokeColor: customColors.dashboardGradient2,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DashboardProgressContainer(
                progressText: "New Projects",
                percent: 75.3,
                value: 75.3,
                strokeColor: Colors.lightGreen,
              ),
              SizedBox(
                height: 32,
              ),
              DashboardProgressContainer(
                progressText: "Total Expsenses",
                percent: 18.3,
                value: 18.3,
                strokeColor: customColors.highlightRed,
              ),
            ],
          ),
        ],
      ),
    );
  }

  NavigationRailDestination navDestinationWidget(
      IconData icon, String label, int index) {
    return NavigationRailDestination(
        icon: NavigationRailIcon(
          isSelected: isIndexSelected(index),
          icon: icon,
          label: label,
        ),
        selectedIcon: NavigationRailIcon(
          isSelected: isIndexSelected(index),
          icon: icon,
          label: label,
        ),
        label: Container());
  }

  bool isIndexSelected(int index) {
    return index == selectedIndex;
  }
}
