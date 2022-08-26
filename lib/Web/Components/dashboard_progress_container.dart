import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solartracker/Desktop/Modules/circular_animation_module.dart';
import 'package:solartracker/Web/Components/progress_container_column.dart';

class DashboardProgressContainer extends StatefulWidget {
  final String progressText;
  final double percent;
  final double value;
  final Color strokeColor;
  const DashboardProgressContainer(
      {Key? key,
      required this.progressText,
      required this.percent,
      required this.value,
      required this.strokeColor})
      : super(key: key);

  @override
  State<DashboardProgressContainer> createState() =>
      _DashboardProgressContainerState();
}

class _DashboardProgressContainerState
    extends State<DashboardProgressContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 420,
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
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: DashboardProgressContainerColumn(
              progressText: widget.progressText,
            ),
          ),
          Expanded(
              flex: 3,
              child: CircularAnimationModule(
                  radius: 64,
                  animateToPercentage: widget.percent,
                  centerTextValue: 50,
                  centerText: "%",
                  showPercentText: true,
                  strokeColor: widget.strokeColor))
        ],
      ),
    );
  }

  Widget leftSide() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(top: 12, left: 24),
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Text(
                    "5.0%",
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_upward_rounded,
                    color: Colors.green,
                  )
                ],
              ),
            )),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: EdgeInsets.only(left: 24),
          child: Text(
            widget.progressText,
            textAlign: TextAlign.start,
            style: GoogleFonts.roboto(fontSize: 22, color: Colors.grey),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 24),
          child: Text(
            "500+",
            style: GoogleFonts.roboto(fontSize: 42, color: Colors.black87),
          ),
        )
      ],
    );
  }
}
