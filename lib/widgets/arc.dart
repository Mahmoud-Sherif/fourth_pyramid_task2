import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../core/utils/color_manager.dart';

class MyArc extends StatelessWidget {
  final double diameter;
  final double adjust;

  const MyArc({super.key, this.diameter = 200, required this.adjust});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(adjust: adjust),
      size: Size(diameter, diameter),
    );
  }
}

// This is the Painter class
class MyPainter extends CustomPainter {
  final double adjust;

  MyPainter({required this.adjust});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = ColorManager.orange.withOpacity(.2);
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / adjust, 0),
        height: size.height,
        width: size.width,
      ),
      0,
      math.pi,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
