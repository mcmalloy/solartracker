import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:solartracker/Theme/customcolors.dart';
import 'package:solartracker/Web/Rendering/circular_animation_duration_engine.dart';

class CircularAnimationModule extends StatefulWidget {
  final double radius; // default 96
  final double animateToPercentage;
  final double centerTextValue;
  final bool showPercentText;
  final String? centerText;
  final Color strokeColor;
  const CircularAnimationModule(
      {Key? key,
      required this.radius,
      required this.animateToPercentage,
      required this.centerTextValue,
      required this.showPercentText,
      this.centerText,
      required this.strokeColor})
      : super(key: key);

  @override
  State<CircularAnimationModule> createState() =>
      _CircularAnimationModuleState();
}

class _CircularAnimationModuleState extends State<CircularAnimationModule>
    with SingleTickerProviderStateMixin {
  CustomColors customColors = CustomColors();
  double showPercentage = 0;
  String centerValue = "";
  late Animation<double> animation;
  late AnimationController paintController;
  late Tween<double> animatedPercentage;
  late Tween<double> centerTextPercentage;
  AnimationDurationEngine engine = AnimationDurationEngine();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var logger = Logger();
    animatedPercentage = Tween(begin: 0, end: widget.animateToPercentage);
    paintController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: engine.getAnimationDuration()),
    );
    centerTextPercentage = Tween(begin: 0, end: widget.centerTextValue);
    animation = animatedPercentage.animate(
        CurvedAnimation(parent: paintController, curve: Curves.easeOutExpo))
      ..addListener(() {
        setState(() {
          showPercentage = animation.value;
        });
        //logger.d("percentage: ${ showPercentage}");
      });
    centerTextPercentage
        .animate(
            CurvedAnimation(parent: paintController, curve: Curves.easeOutExpo))
        .addListener(() {
      setState(() {
        centerValue =
            centerTextPercentage.lerp(paintController.value).toInt().toString();
      });
    });
    paintController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return circularProgressPainter();
  }

  Widget circularProgressPainter() {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(
          animation: paintController,
          builder: (BuildContext context, Widget? child) {
            return CustomPaint(
                painter: FullProgressBarStandardPaint(
                    widget.strokeColor,
                    customColors.flatPurple,
                    customColors.backgroundThemePurple,
                    widget.radius,
                    showPercentage,
                    StrokeWidth.Normal));
          },
        ),
        centerText()
      ],
    );
  }

  Widget centerText() {
    String txt = widget.centerText != null ? widget.centerText! : "";
    return Visibility(
      visible: widget.showPercentText,
      child: Text(
        "$centerValue$txt",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: "GoogleSans",
            fontWeight: FontWeight.normal,
            color: ColorTween(
              begin: Colors.white60,
              end: widget.strokeColor,
            ).transform(0.9)!,
            fontSize: widget.centerText != null ? 32 : 32),
      ),
    );
  }
}

enum StrokeWidth { SuperThin, Thin, Normal, Thick, Thicc }

class FullProgressBarStandardPaint extends CustomPainter {
  final Color strokeColor;
  final Color gradientColor;
  final Color shadeColor;
  final double radius;
  final double percentage;
  final StrokeWidth strokeWidth;
  FullProgressBarStandardPaint(this.strokeColor, this.gradientColor,
      this.shadeColor, this.radius, this.percentage, this.strokeWidth);

  double getStrokeWidth() {
    switch (strokeWidth) {
      case StrokeWidth.SuperThin:
        return 5;
      case StrokeWidth.Thin:
        return 10;
      case StrokeWidth.Normal:
        return 17;
      case StrokeWidth.Thick:
        return 30;
      case StrokeWidth.Thicc:
        return 60;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.rotate(pi);
    paintBackground(canvas, size);
    paintForeGround(canvas, size);

    //logger.d("Drew for OffsetAngle $offsetAngle");
  }

  void paintBackground(Canvas canvas, Size size) {
    double sWidth = getStrokeWidth();
    Offset center = Offset(size.width / 2, size.height / 2);
    var backgroundPaint = Paint()
      ..color = strokeColor
      ..strokeWidth = sWidth - 5
      //..maskFilter = MaskFilter.blur(BlurStyle.solid, 4)
      ..style = PaintingStyle.stroke
      ..maskFilter = MaskFilter.blur(BlurStyle.solid, 2)
      ..strokeCap = StrokeCap.round;
    backgroundPaint.color = Colors.grey.withOpacity(0.4);
    canvas.drawCircle(center, radius, backgroundPaint);
  }

  void paintForeGround(Canvas canvas, Size size) {
    double sWidth = getStrokeWidth();
    Offset center = Offset(size.width / 2, size.height / 2);
    var mainPaint = Paint()
      ..color = strokeColor
      ..strokeWidth = sWidth
      ..maskFilter = MaskFilter.blur(BlurStyle.solid, 8)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    mainPaint.color = ColorTween(
      begin: strokeColor.withOpacity(0.2),
      end: strokeColor,
    ).transform(0.9)!;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), 0,
        degreesToRadians(), false, mainPaint);
  }

  double percentToDegrees() {
    return percentage * 3.6;
  }

  double degreesToRadians() {
    return percentToDegrees() * pi / 180;
  }

  void progressGradient(int stepDegrees) {
    // Set paint color based on division angle.
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
