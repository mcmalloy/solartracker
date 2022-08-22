import 'package:flutter/material.dart';
import 'package:solartracker/Theme/customcolors.dart';

import '../Fonts/sanstext.dart';
CustomColors customColors = CustomColors();
class LogoutButton extends StatefulWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 12,
          ),
          Icon(
            Icons.logout_rounded,
            size: 20,
            color: customColors.backgroundThemePurple
                .withOpacity(0.05),
            shadows: [
              Shadow(
                  color:
                  customColors.flatPurple.withOpacity(0.9),
                  blurRadius: 2,
                  offset: Offset(-1, 1))
            ],
          ),
          SansText(
            body: "Logout",
            fontSize: 18,
          )
        ],
      ),
    );
  }
}
