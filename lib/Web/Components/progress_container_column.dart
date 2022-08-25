import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardProgressContainerColumn extends StatefulWidget {
  final String progressText;
  const DashboardProgressContainerColumn({Key? key, required this.progressText})
      : super(key: key);

  @override
  State<DashboardProgressContainerColumn> createState() =>
      _DashboardProgressContainerColumnState();
}

class _DashboardProgressContainerColumnState
    extends State<DashboardProgressContainerColumn> {
  @override
  Widget build(BuildContext context) {
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
