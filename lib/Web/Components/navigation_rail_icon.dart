import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solartracker/Web/Components/gradient_icon.dart';

class NavigationRailIcon extends StatefulWidget {
  final bool isSelected;
  final IconData icon;
  final String label;
  const NavigationRailIcon(
      {Key? key,
      required this.isSelected,
      required this.icon,
      required this.label})
      : super(key: key);

  @override
  State<NavigationRailIcon> createState() => _NavigationRailIconState();
}

class _NavigationRailIconState extends State<NavigationRailIcon> {
  Color backgroundColor = Color(0xffFFFFFF);
  Color topGradientNavRail = Color(0xff8C4AF2);
  Color bottomGradientNavRail = Color(0xff8C4AF2);
  Color unselectedItemColor = Color(0xffD8CBFC);

  double selectedIconSize = 46;
  double unselectedIconSize = 44;

  @override
  Widget build(BuildContext context) {
    var gradient = LinearGradient(
      colors: <Color>[topGradientNavRail, bottomGradientNavRail],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(18)),
              color: widget.isSelected ? backgroundColor : topGradientNavRail),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              child: GradientIcon(widget.icon, selectedIconSize, gradient),
              visible: widget.isSelected,
              replacement: unselectedIcon(),
            ),
            labelText(widget.label)
          ],
        )
      ],
    );
  }

  Widget unselectedIcon() {
    return Icon(
      widget.icon,
      size: unselectedIconSize,
      color: Colors.white,
    );
  }

  Widget labelText(String label) {
    var selectedItemGradient = Paint()
      ..shader = LinearGradient(
        colors: <Color>[
          topGradientNavRail,
          bottomGradientNavRail
          //add more color here.
        ],
      ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 100.0));
    TextStyle style = TextStyle(
        fontFamily: "GoogleSans",
        foreground: selectedItemGradient,
        fontSize: 26);

    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Text(
        label,
        style: GoogleFonts.roboto(
            foreground: widget.isSelected ? selectedItemGradient : null,
            fontSize: 32,
            fontWeight: FontWeight.w300,
            color: (widget.isSelected == false) ? unselectedItemColor : null),
        textAlign: TextAlign.start,
      ),
    );
  }
}
