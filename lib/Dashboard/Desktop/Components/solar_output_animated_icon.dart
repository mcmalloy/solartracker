import 'package:flutter/material.dart';
import 'package:solartracker/Dashboard/Desktop/Components/logout_button.dart';
import 'package:solartracker/Dashboard/Desktop/Components/navrail_separator.dart';
import 'package:solartracker/Theme/customcolors.dart';

class SolarOutputAnimatedIcon extends StatefulWidget {
  const SolarOutputAnimatedIcon({Key? key}) : super(key: key);

  @override
  State<SolarOutputAnimatedIcon> createState() =>
      _SolarOutputAnimatedIconState();
}

class _SolarOutputAnimatedIconState extends State<SolarOutputAnimatedIcon>
    with SingleTickerProviderStateMixin {
  double maxOutput = 2.50;
  double currentSolarOutput = 1;
  late Animation<double> animation;
  late AnimationController controller;
  Tween<double> _rotationTween = Tween(begin: 0, end: 2.50);
  CustomColors customColors = CustomColors();
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    animation = _rotationTween.animate(controller)
      ..addListener(() {
        setState(() {
          currentSolarOutput = animation.value;
        });
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 400,
        width: 400,
        child: Row(
          children: [
            outputPanel(),
            NavRailSeparator(),
            batteryPanel()
          ],
        ));
  }

  Widget outputPanel(){
    return Flexible(
        flex: 3,
        child: Stack(
          children: [
            Positioned(
                top: 12,
                left: 12,
                child: Text(
                  "Current Output",
                  style: TextStyle(
                      fontFamily: "GoogleSans",
                      color: const Color(0xfffafafa).withOpacity(0.7),
                      fontSize: 22),
                  textAlign: TextAlign.start,
                )),
            Center(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red,
                        blurRadius: 5.0,
                        spreadRadius: 2.0,
                      ),
                    ]),
                child: CustomPaint(
                    painter: ShapePainter(Colors.tealAccent)),
              ),
            ),
            Center(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 200),
                child: Text(
                  "${currentSolarOutput.toStringAsFixed(2)}kW",
                  style: const TextStyle(
                      fontFamily: "GoogleSans",
                      color: Color(0xfffafafa),
                      fontSize: 32),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ],
        ));
  }

  Widget batteryPanel(){
    return Flexible(
      flex: 3,
      child: Stack(
        children: [
          Positioned(
              top: 12,
              right: 12,
              child: Text(
                "Current Storage",
                style: TextStyle(
                    fontFamily: "GoogleSans",
                    color: const Color(0xfffafafa).withOpacity(0.7),
                    fontSize: 22),
                textAlign: TextAlign.start,
              )),
          Center(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red,
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                    ),
                  ]),
              child: CustomPaint(
                  painter: ShapePainter(customColors.pastelYellow)),
            ),
          ),
          const Center(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 200),
              child: Text(
                "3.74\nkWh",
                style: TextStyle(
                    fontFamily: "GoogleSans",
                    color: Color(0xfffafafa),
                    fontSize: 32),
                textAlign: TextAlign.start,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  final Color color;

  ShapePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, 80, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
