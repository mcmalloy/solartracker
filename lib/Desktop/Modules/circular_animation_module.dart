import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:solartracker/Theme/customcolors.dart';

class CircularAnimationModule extends StatefulWidget {
  const CircularAnimationModule({Key? key}) : super(key: key);

  @override
  State<CircularAnimationModule> createState() =>
      _CircularAnimationModuleState();
}

class _CircularAnimationModuleState extends State<CircularAnimationModule>
    with SingleTickerProviderStateMixin {
  CustomColors customColors = CustomColors();
  double radius = 256;
  double percentage = 24;
  double showPercentage = 0;
  double newPercentage = 0;
  late Animation<double> animation;
  late AnimationController controller;
  late Tween<double> animatedPercentage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var logger = Logger();
    animatedPercentage = Tween(begin: 0, end: percentage);
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    animation = animatedPercentage.animate(controller)
      ..addListener(() {
        setState(() {
          showPercentage = animation.value;
        });
        //logger.d("percentage: ${ showPercentage}");

      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height / 2,
              right: MediaQuery.of(context).size.width / 2,
              child: circularProgressPainter(),
            )
          ],
        ));
  }

  Widget circularProgressPainter() {
    return AnimatedBuilder(
        animation: controller,

        builder: (BuildContext context, Widget? child) {
          return CustomPaint(
              painter: CircularPainter(
                  Colors.tealAccent,
                  customColors.lightPastelGreen,
                  customColors.backgroundThemePurple,
                  radius,
                  showPercentage));
        });
  }
}

class CircularPainter extends CustomPainter {
  final Color strokeColor;
  final Color shadeColor;
  final Color blurColor;
  final double radius;
  final double percentage;
  CircularPainter(this.strokeColor, this.shadeColor, this.blurColor,
      this.radius, this.percentage);
  @override
  void paint(Canvas canvas, Size size) {
    var logger = Logger();

    var paint = Paint()
      ..color = strokeColor
      ..strokeWidth = 5
      //..maskFilter = MaskFilter.blur(BlurStyle.solid, 4)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    double angle = 2 * pi * (70 / 100);
    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.rotate(pi);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), 0,
        degreesToRadians(), false, paint);

    //logger.d("Drew for OffsetAngle $offsetAngle");
  }

  double percentToDegrees() {
    return percentage * 3.6;
  }

  double degreesToRadians() {
    return percentToDegrees() * pi / 180;
  }

  progressGradient(int stepDegrees) {
    // Set paint color based on division angle.
    /*
    paint.color = ColorTween(
      begin: Colors.green,
      end: Colors.red,
    ).transform(stepDegrees / totalDegrees)!;
     */
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
