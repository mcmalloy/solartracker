import 'package:flutter/material.dart';

class SolarOutputAnimatedIcon extends StatefulWidget {
  const SolarOutputAnimatedIcon({Key? key}) : super(key: key);

  @override
  State<SolarOutputAnimatedIcon> createState() =>
      _SolarOutputAnimatedIconState();
}

class _SolarOutputAnimatedIconState extends State<SolarOutputAnimatedIcon>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  Tween<double> _rotationTween = Tween(begin: -3.14, end: 3.14);
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    animation = _rotationTween.animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        width: 200,
        child: Stack(
          children: [
            Positioned(
                top: 12,
                left: 12,
                child: Text(
                  "Current\nOutput",
                  style: TextStyle(
                      fontFamily: "GoogleSans",
                      color: const Color(0xfffafafa).withOpacity(0.7),
                      fontSize: 13),
                  textAlign: TextAlign.start,
                )),
            Center(
              child: CustomPaint(painter: ShapePainter()),
            ),
            const Center(
              child: Text(
                "2.12kW",
                style: TextStyle(
                    fontFamily: "GoogleSans",
                    color: Color(0xfffafafa),
                    fontSize: 18),
                textAlign: TextAlign.start,
              ),
            )
          ],
        ));
  }
}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, 40, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
