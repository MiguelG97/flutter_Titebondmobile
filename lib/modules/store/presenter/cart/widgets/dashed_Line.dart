import 'package:flutter/material.dart';

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    print(size.width);
    double lineWidth = size.width / 40;

    for (var i = 0; i < 40; i = i + 2) {
      canvas.drawLine(
          Offset(lineWidth * i, 0),
          Offset(lineWidth * (1 + i), 0),
          Paint()
            ..color = const Color(0xff707B81)
            ..strokeWidth = 1.5);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
