import 'dart:math';

import 'package:flutter/material.dart';

class NavigationRailClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double startHeight = size.height / 1.5; // original (size.height - 240)
    double endHeight = size.height / 1.5;
    double maxHeight = size.height / 1.65; // original  size.height - 330

    path.lineTo(0.0, startHeight);

    path.quadraticBezierTo(size.width / 2, maxHeight, size.width, endHeight);

    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
