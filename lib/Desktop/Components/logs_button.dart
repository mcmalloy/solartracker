import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:solartracker/Theme/customcolors.dart';

import '../Fonts/sanstext.dart';

CustomColors customColors = CustomColors();

class LogsButton extends StatefulWidget {
  const LogsButton({Key? key}) : super(key: key);

  @override
  State<LogsButton> createState() => _LogsButtonState();
}

class _LogsButtonState extends State<LogsButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 12,
          ),
          Icon(
            FontAwesomeIcons.database,
            size: 20,
            color: customColors.backgroundThemePurple.withOpacity(0.05),
            shadows: [
              Shadow(
                  color: customColors.flatPurple.withOpacity(0.9),
                  blurRadius: 2,
                  offset: Offset(-1, 1))
            ],
          ),
          SansText(
            body: "Logs",
            fontSize: 18,
          )
        ],
      ),
    );
  }
}
