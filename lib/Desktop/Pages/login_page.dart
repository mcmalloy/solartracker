import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solartracker/Theme/customcolors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

CustomColors customColors = CustomColors();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customColors.backgroundThemePurple,
      body: Stack(
        children: [
          Positioned(
              top: MediaQuery.of(context).size.height / 14,
              left: MediaQuery.of(context).size.width / 3,
              child: Text("Log in to Solar Tracker",
                  style: TextStyle(
                      fontFamily: "GoogleSans",
                      color: const Color(0xfffafafa).withOpacity(0.7),
                      fontSize: 22))),
          Positioned(
              top: MediaQuery.of(context).size.height / 8,
              right: 32,
              left: 32,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60.0), //add border radius
                  child: Image.asset(
                    "assets/solar_windmill.jpg",
                    height: MediaQuery.of(context).size.height / 3,
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          Positioned(
              bottom: MediaQuery.of(context).size.height / 3,
              right: 12,
              left: 12,
              child: Center(
                child: Container(
                    height: 80,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xfffafafa)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Log in with facebook",
                            style: TextStyle(
                                fontFamily: "GoogleSans",
                                color: customColors.flatPurple,
                                fontSize: 22)),
                        Icon(
                          FontAwesomeIcons.facebook,
                          color: customColors.flatPurple,
                          size: 52,
                        )
                      ],
                    )),
              ))
        ],
      ),
    );
  }
}
